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
    required String currentAddres,
  }) async {
    updateProfileLoading(true);
    List<MultipartBody> multipartBody = [];
    if (imagePath.isNotEmpty) {
      multipartBody.add(MultipartBody('image', File(imagePath)));
    }

    Map<String, String> fromData = {
      "full_name": fullName,
      "phone_number": phoneNumber,
      "address": currentAddres,
    };

    final response = await ApiClient.patchMultipartData(
      "/api/v1/auth/update_profile/",
      fromData,
      multipartBody: multipartBody,
    );

    print("respons body ===============> ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar("Profile Update Successfully", isError: false);
      Get.back();

      fetchUserInfo();
    } else {
      showCustomSnackBar("Something we want wrong", isError: true);
      print("respone body ===============> ${response.body}");
      print("respone status ===============> ${response.statusCode}");
    }
    updateProfileLoading(false);
  }
}
