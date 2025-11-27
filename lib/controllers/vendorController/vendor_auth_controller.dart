import 'dart:convert';
import 'dart:io';
import 'package:dar_dar_foodd_delivery_app/controllers/data_controller.dart';
import 'package:dar_dar_foodd_delivery_app/helpers/prefs_helper.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_constants.dart';
import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_snackbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_email_verify_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_login_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_otp_verify_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_reset_password_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/verify_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorHomeScreen/not_approved_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorHomeScreen/vendor_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorAuthController extends GetxController {
  var otp = "".obs;
  var isLoading = false.obs;
  var isVerifiedLoading = false.obs;

  var isSetupLoading = false.obs;

  var isForgetVerify = "".obs;
  var isForgetLoading = false.obs;

  final locationController = TextEditingController();

  final emailTextController = TextEditingController();
  final passwordController = TextEditingController();
  var currentAddress = "".obs;

  var isRemember = false.obs;
  var isLoginLoading = false.obs;

  var locationLoading = false.obs;
  var locationSuggestions = <String>[].obs;
  var selectedCoordinates = <double>[].obs;
  var isVerificationLoading = false.obs;
  var isResetLoading = false.obs;

  final dataController = Get.put(DataController());

  Rx<File?> storeImage = Rx<File?>(null);

  Rx<File?> licenseImage = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();

    _loadRememberedCredentials();
  }

  Future<void> pickStoreImage({bool fromCamera = false}) async {
    final pickedFile = await ImageUtils.pickAndCropImage(
      fromCamera: fromCamera,
    );

    if (pickedFile != null) {
      storeImage.value = pickedFile;
    }
  }

  Future<void> pickLicenseImage({bool fromCamera = false}) async {
    final pickedFile = await ImageUtils.pickAndCropImage(
      fromCamera: fromCamera,
    );

    if (pickedFile != null) {
      licenseImage.value = pickedFile;
    }
  }

  Future<void> fetchLocationSuggestions(String input) async {
    if (input.isEmpty) {
      locationSuggestions.clear();
      return;
    }

    locationLoading(true);

    try {
      final response = await http.get(
        Uri.parse(
          '${ApiConstant.googleBaseUrl}?input=$input&key=${ApiConstant.googleApiKey}',
        ),
      );

      print('Autocomplete Response: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final predictions = jsonData['predictions'] as List<dynamic>?;

        if (predictions != null && predictions.isNotEmpty) {
          locationSuggestions.value = predictions
              .map((e) => e['description'] as String)
              .toList();
        } else {
          locationSuggestions.clear();
        }
      } else {
        locationSuggestions.clear();
        print('Failed to fetch suggestions: ${response.statusCode}');
      }
    } catch (e) {
      locationSuggestions.clear();
      print('Error fetching suggestions: $e');
    } finally {
      locationLoading(false);
    }
  }

  Future<void> fetchCoordinates(String placeName) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${ApiConstant.findPlaceApiUrl}?input=$placeName&inputtype=textquery&fields=geometry&key=${ApiConstant.googleApiKey}',
        ),
      );

      print('Coordinates Response: ${response.body}'); // Debug

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (jsonData['candidates'] != null &&
            jsonData['candidates'].isNotEmpty) {
          final geometry = jsonData['candidates'][0]['geometry'];
          final location = geometry['location'];
          selectedCoordinates.value = [location['lat'], location['lng']];
        } else {
          selectedCoordinates.clear();
          print('No location found');
        }
      } else {
        print('Failed to fetch coordinates: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching coordinates: $e');
    }
  }

  void selectedLocation(String location) async {
    locationController.text = location;
    locationSuggestions.clear();
    await fetchCoordinates(location);
  }

  Future<void> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    isLoading(true);

    Map<String, dynamic> body = {
      "full_name": name,
      "email": email,
      "phone_number": phone,
      "password": password,
      "confirm_password": confirmPassword,
      "current_location": selectedCoordinates.join(", "),
      "role": "VENDOR",
    };
    var headers = {'Content-Type': 'application/json'};

    final response = await ApiClient.postData(
      ApiConstant.userSignupEndPoint,
      body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("response body ============> ${response.body}");
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(() => VendorEmailVerifyScreen(email: email));
    } else {
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isLoading(false);
  }

  Future<void> emailVerifed({required String email}) async {
    isVerifiedLoading(true);

    final body = {"email": email, "otp": otp.value};

    var headers = {'Content-Type': 'application/json'};

    final response = await ApiClient.postData(
      ApiConstant.userEmailVerifedEndPoint,
      body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access_token'],
      );

      currentAddress.value = response.body['data']['current_address'] ?? "";

      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(() => VerifyScreen());
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isVerifiedLoading(false);
  }

  Future<void> setupProfile({
    required String storeName,
    required String storeType,
    required String storeImage,
    required String storeLicense,
    required String bankAccountName,
    required String bankAccountNumber,
    required String bankName,
  }) async {
    isSetupLoading(true);

    List<MultipartBody> multipartBody = [];

    if (storeImage.isNotEmpty) {
      multipartBody.add(MultipartBody('shop_image', File(storeImage)));
    }

    // ---- SHOP LICENSE ----
    if (storeLicense.isNotEmpty) {
      multipartBody.add(MultipartBody('shop_license', File(storeLicense)));
    }

    Map<String, String> fromData = {
      "shop_name": storeName,
      "shop_type": storeType,
      "shop_address": currentAddress.value,
      "account_name": bankAccountName,
      "account_number": bankAccountNumber,
      "bank_name": bankName,
    };

    final response = await ApiClient.patchMultipartData(
      "/api/v1/auth/update_profile/",
      fromData,
      multipartBody: multipartBody,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(
        'Profile setup successfully, But Account not approved. Please wait for approval',
        isError: false,
      );
      //Get.offAll(() => VendorHomeScreen());
      Get.to(() => NotApprovedScreen());
    } else {
      showCustomSnackBar(
        'Some error occurred while setting up the profile.',
        isError: true,
      );
    }
    isSetupLoading(false);
  }

  Future<void> login({required String email, required String password}) async {
    isLoginLoading(true);

    try {
      Map<String, dynamic> body = {"email": email, "password": password};
      var headers = {'Content-Type': 'application/json'};

      final response = await ApiClient.postData(
        ApiConstant.userLoignEndPoint,
        body,
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;

        // ---------- SUCCESS RESPONSE ----------
        if (data["status"] == "success") {
          await PrefsHelper.setString(
            AppConstants.bearerToken,
            data['access_token'],
          );

          final vendorData = data['data'];
          bool approved = vendorData['is_approved'] ?? false;

          // Save Vendor Data
          await dataController.setVendorData(
            vendorIdD: vendorData['id'].toString(),
            vendorNameD: vendorData['full_name'] ?? "",
            vendorEmailD: vendorData['email'] ?? "",
            vendorImageD: vendorData['image'] ?? "",
            roleD: vendorData['role'] ?? "",
            currentLocationD: vendorData['current_location'] ?? "",
            currentAddressD: vendorData['current_address'] ?? "",
            shopNameD: vendorData['shop_name'] ?? "",
            shopImageD: vendorData['shop_image'] ?? "",
            shopLicenseD: vendorData['shop_license'] ?? "",
            shopTypeD: vendorData['shop_type'] ?? "",
            shopAddressD: vendorData['shop_address'] ?? "",
            rattingD: vendorData['rating'].toString(),
            bankNameD: vendorData['bank_name'] ?? "",
            accountNameD: vendorData['account_name'] ?? "",
            accountNumberD: vendorData['account_number'] ?? "",
            branchD: vendorData['branch'] ?? "",
            isApprovedD: approved,
          );

          // ---------- NOT APPROVED CHECK ----------
          if (!approved) {
            showCustomSnackBar(
              "Account not approved. Please wait for approval.",
              isError: true,
            );
            Future.delayed(Duration(milliseconds: 100), () {
              Get.to(() => NotApprovedScreen());
            });
            return;
          }

          // ---------- APPROVED → HOME ----------
          showCustomSnackBar(data['message'], isError: false);
          saveRememberedCredentials();
          Get.to(() => VendorHomeScreen());
          return;
        }
      } else {
        // ---------- ANY OTHER STATUS CODE ----------
        if (response.statusCode == 403) {
          final data = response.body;
          if (data["status"] == "error" ||
              data["message"] ==
                  "Account not approved. Please wait for approval") {
            showCustomSnackBar(data['message'], isError: true);

            Future.delayed(Duration(milliseconds: 100), () {
              Get.to(() => NotApprovedScreen());
            });
            return;
          }
        }
        // ---------- ERROR RESPONSE ----------
        else {
          showCustomSnackBar(
            response.body['message'] ?? "Something went wrong",
            isError: true,
          );
          return;
        }
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong!", isError: true);
    } finally {
      isLoginLoading(false);
    }
  }

  Future<void> _loadRememberedCredentials() async {
    isRemember.value = await PrefsHelper.getRememberMeStatus();
    if (isRemember.value) {
      emailTextController.text = await PrefsHelper.getRememberedEmail();
      passwordController.text = await PrefsHelper.getRememberedPassword();
    }
  }

  /// Save email & password if Remember Me is checked
  Future<void> saveRememberedCredentials() async {
    await PrefsHelper.saveRememberedCredentials(
      email: emailTextController.text.trim(),
      password: passwordController.text.trim(),
      isRemember: isRemember.value,
    );
  }

  Future<void> forgetPassword({required String email}) async {
    isForgetLoading(true);

    final body = {"email": email};

    var headers = {'Content-Type': 'application/json'};

    final response = await ApiClient.postData(
      ApiConstant.userForgetPasswordEndPoint,
      body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(() => VendorOtpVerifyScreen(email: email));
    } else {
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isForgetLoading(false);
  }

  Future<void> emailVerifedWithForget({required String email}) async {
    isVerificationLoading(true);

    final body = {"email": email, "otp": isForgetVerify.value};

    var headers = {'Content-Type': 'application/json'};

    final response = await ApiClient.postData(
      ApiConstant.userEmailVerifedEndPoint,
      body,
      headers: headers,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      await PrefsHelper.setString(
        AppConstants.bearerToken,
        response.body['access_token'],
      );

      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(() => VendorResetPasswordScreen());
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isVerificationLoading(false);
  }

  Future<void> resetPassword({
    required String newPassword,
    required String confirmPassword,
  }) async {
    isResetLoading(true);

    final body = {
      "new_password": newPassword,
      "confirm_password": confirmPassword,
    };

    final response = await ApiClient.postData(
      ApiConstant.userResetPasswordEndPoint,
      body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(() => VendorLoginScreen());
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isResetLoading(false);
  }
}
