import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/models/Vendor/vendor_info_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class VendorProfileController extends GetxController {
  Rx<File?> vendorProfileImage = Rx<File?>(null);

  var vendorInfoModel = VendorInfoModel().obs;

  var isLoading = false.obs;

  var updateProfileLoading = false.obs;

  Future<void> pickVendorProfileImage({bool fromCamera = false}) async {
    final pickedFile = await ImageUtils.pickAndCropImage(
      fromCamera: fromCamera,
    );

    if (pickedFile != null) {
      vendorProfileImage.value = pickedFile;
    }
  }

  Future<void> fetchVendorInfo() async {
    isLoading(true);

    final response = await ApiClient.getData("/api/v1/auth/user_profile/");
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = response.body['data'];
      vendorInfoModel.value = VendorInfoModel.fromJson(data);
    } else {
      print("something went wrong ===========> ${response.body}");
    }
    isLoading(false);
  }

  Future<void> updateVendorProfile({
    required String profileImage,
    required String shopName,
    required String contactNumber,
    required String bankAccountNumber,
    required String bankName,
    required String accountName,
  }) async {
    updateProfileLoading(true);
    List<MultipartBody> multipartBody = [];
    if (profileImage.isNotEmpty) {
      multipartBody.add(MultipartBody('image', File(profileImage)));
    }

    final Map<String, String> body = {
      'shop_name': shopName,
      'phone_number': contactNumber,
      'account_number': accountName,
      'bank_name': bankName,
      'account_number': bankAccountNumber,
    };

    final response = await ApiClient.patchMultipartData(
      "/api/v1/auth/update_profile/",
      body,
      multipartBody: multipartBody,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar("Profile updated successfully.", isError: false);
      Get.back();
      fetchVendorInfo();
    } else {
      showCustomSnackBar("Something went wrong", isError: true);
    }
    updateProfileLoading(false);
  }
}
