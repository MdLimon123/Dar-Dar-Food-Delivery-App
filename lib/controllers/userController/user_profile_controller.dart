import 'dart:convert';
import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/models/User/privacy_police_model.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/terms_and_condition_model.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/user_info_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserProfileController extends GetxController {
  var isLoading = false.obs;

  var updateProfileLoading = false.obs;

  var userInfo = UserInfoModel().obs;

  final locationController = TextEditingController();

  var locationLoading = false.obs;
  var locationSuggestions = <String>[].obs;
  var selectedCoordinates = <double>[].obs;

  Rx<File?> userProfileImage = Rx<File?>(null);

  RxList<PrivacyPolicData> privacyPolicyList = RxList<PrivacyPolicData>([]);
  RxList<TermsConditionData> termsConditionList = RxList<TermsConditionData>(
    [],
  );

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

      print('Autocomplete Response: ${response.body}');

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
      "current_location": selectedCoordinates.join(", "),
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

  Future<void> updateAddress({required String currentAddress}) async {
    updateProfileLoading(true);

    Map<String, String> fromData = {
      "current_location": selectedCoordinates.join(", "),
    };

    final response = await ApiClient.patchData(
      "/api/v1/auth/update_profile/",
      fromData,
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

  Future<void> fetchPrivacyPolicy() async {
    isLoading(true);

    final response = await ApiClient.getData(
      "/api/v1/settings/privacy_policies/",
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = PrivacyPolicyModel.fromJson(response.body);
      privacyPolicyList.value = data.data;
    } else {
      print("something we want to wrong ===========> ${response.body}");
    }
    isLoading(false);
  }

  Future<void> fetchTermsAndCondition() async {
    isLoading(true);

    final response = await ApiClient.getData(
      "/api/v1/settings/terms_conditions/",
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = TermsConditionModel.fromJson(response.body);
      termsConditionList.value = data.data;
    } else {
      print("something we want to wrong ===========> ${response.body}");
    }
    isLoading(false);
  }
}
