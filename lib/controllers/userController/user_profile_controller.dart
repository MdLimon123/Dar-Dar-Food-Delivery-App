import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/models/User/user_info_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var isLoading = false.obs;

  var updateProfileLoading = false.obs;

  var userInfo = UserInfoModel().obs;

  Rx<File?> userProfileImage = Rx<File?>(null);

  Future<void> pickUserProfileImage({bool fromCamera = false}) async {
    final pickedFile = await ImageUtils.pickAndCropImage(
      fromCamera: fromCamera,
    );

    if (pickedFile != null) {
      userProfileImage.value = pickedFile;
    }
  }



  Future<void> fetchUserInfo() async {
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.userProfileEndPoint);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body['data'];
      userInfo.value = UserInfoModel.fromJson(data);
    } else {
      print("something we want to wrong ===========> ${response.body}");
    }
    isLoading(false);
  }

  Future<void> updateUserProfile({
    required String imagePath,
    required String fullName,
    required String phoneNumber,
    required String currentAddress,
  }) async {
    updateProfileLoading(true);
    List<MultipartBody> multipartBody = [];

    if (imagePath.isNotEmpty) {
      if (imagePath.isNotEmpty) {
        multipartBody.add(MultipartBody('image', File(imagePath)));
      }
    }

    Map<String, String> fromData = {
      "full_name": fullName,
      "phone_number": phoneNumber,
      "address": currentAddress,
    };

    final response = await ApiClient.patchMultipartData(
      "/api/v1/auth/update_profile/",
      fromData,
      multipartBody: multipartBody,
    );

    print("Response body: ${response.body}");
    print("Status code: ${response.statusCode}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar("Profile updated successfully.", isError: false);
      Get.back();
      fetchUserInfo();
    } else {
      showCustomSnackBar("Something we wnat wrong", isError: true);
    }

    updateProfileLoading(false);
  }
}
