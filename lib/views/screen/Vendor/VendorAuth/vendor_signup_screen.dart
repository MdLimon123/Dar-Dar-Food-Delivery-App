import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorSignupScreen extends StatefulWidget {
  const VendorSignupScreen({super.key});

  @override
  State<VendorSignupScreen> createState() => _VendorSignupScreenState();
}

class _VendorSignupScreenState extends State<VendorSignupScreen> {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  final _fromKey = GlobalKey<FormState>();
  final _vendorAuthController = Get.put(VendorAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Sign in"),
      body: Form(
        key: _fromKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          children: [
            Center(
              child: Text(
                "Hello!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: Text(
                "Welcome to Dar Dar! Please sign up to continue access",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 24),
            _headingText(text: "Full Name"),
            SizedBox(height: 12),
            CustomTextField(
              controller: nameTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your name';
                }
                return null;
              },
              hintText: "Enter your full name",
            ),
            SizedBox(height: 12),
            _headingText(text: "Email"),
            SizedBox(height: 12),
            CustomTextField(
              controller: emailTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your email';
                }
                return null;
              },
              hintText: "Enter your email",
            ),
            SizedBox(height: 12),
            _headingText(text: "Phone Number"),
            SizedBox(height: 12),
            CustomTextField(
              controller: phoneTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your phone number';
                }
                return null;
              },
              hintText: "Enter your phone number",
            ),
            SizedBox(height: 12),
            _headingText(text: "Password"),
            SizedBox(height: 12),
            CustomTextField(
              controller: passwordTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your confirm password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              maxLine: 1,
              isPassword: true,
              hintText: "Enter your password",
            ),
            SizedBox(height: 12),
            _headingText(text: "Confirm Password"),
            SizedBox(height: 12),
            CustomTextField(
              controller: confirmTextController,
              maxLine: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your confirm password';
                } else if (value != passwordTextController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              isPassword: true,
              hintText: "Confirm your password",
            ),
            SizedBox(height: 12),

            _headingText(text: "Location"),
            SizedBox(height: 12),
            Obx(() {
              return Column(
                children: [
                  TextField(
                    controller: _vendorAuthController.locationController,
                    onChanged: (value) {
                      _vendorAuthController.fetchLocationSuggestions(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                      ),
                      fillColor: Color(0xFFFEFEFE),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: 'Enter Location',
                      hintStyle: TextStyle(
                        color: const Color(0xFF545454),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  if (_vendorAuthController.locationLoading.value)
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  if (_vendorAuthController.locationSuggestions.isNotEmpty)
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ListView.builder(
                        itemCount:
                            _vendorAuthController.locationSuggestions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              _vendorAuthController.locationSuggestions[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF000000),
                              ),
                            ),
                            onTap: () {
                              _vendorAuthController.selectedLocation(
                                _vendorAuthController
                                    .locationSuggestions[index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                ],
              );
            }),

            SizedBox(height: 24),

            Obx(
              () => CustomButton(
                loading: _vendorAuthController.isLoading.value,
                onTap: () {
                  if (_fromKey.currentState!.validate()) {
                    _vendorAuthController.signup(
                      name: nameTextController.text.trim(),
                      email: emailTextController.text.trim(),
                      phone: phoneTextController.text.trim(),
                      password: passwordTextController.text.trim(),
                      confirmPassword: confirmTextController.text.trim(),
                    );
                  }
                },
                text: "Sign Up",
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => VendorLoginScreen());
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _headingText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    );
  }
}
