import 'dart:convert';
import 'package:dar_dar_foodd_delivery_app/helpers/prefs_helper.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_client.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_constants.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_snackbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_email_verify_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VendorAuthController extends GetxController {
  var otp = "".obs;
  var isLoading = false.obs;
  var isVerifiedLoading = false.obs;

  final locationController = TextEditingController();

  var locationLoading = false.obs;
  var locationSuggestions = <String>[].obs;
  var selectedCoordinates = <double>[].obs;

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
          selectedCoordinates.value = [location['lng'], location['lat']];
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
      "current_location": "23.77754265037622, 90.39683198560394",
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

      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(() => VerifyScreen());
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isVerifiedLoading(false);
  }
}
