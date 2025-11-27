import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_forget_password_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorLoginScreen extends StatefulWidget {
  const VendorLoginScreen({super.key});

  @override
  State<VendorLoginScreen> createState() => _VendorLoginScreenState();
}

class _VendorLoginScreenState extends State<VendorLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _vendorAuthController = Get.put(VendorAuthController());

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Sign in"),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          children: [
            Center(
              child: Text(
                "Hello Again!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor,
                ),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Welcome back to Dar Dar Please sign in to continue access",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Center(
              child: Image.asset(
                "assets/image/sign_up.png",
                height: 112,
                width: 112,
              ),
            ),
            SizedBox(height: 50),
            _headingText(text: "Email"),
            SizedBox(height: 12),
            CustomTextField(
              controller: _vendorAuthController.emailTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email";
                }
                return null;
              },
              hintText: "Enter your email ",
            ),
            SizedBox(height: 20),
            _headingText(text: "Password"),
            SizedBox(height: 12),
            CustomTextField(
              controller: _vendorAuthController.passwordController,
              maxLine: 1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your password";
                }
                return null;
              },
              isPassword: true,
              hintText: "Enter your password ",
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: _vendorAuthController.isRemember.value,
                    activeColor: AppColors.primaryColor,
                    checkColor: Colors.white,
                    side: BorderSide(color: Color(0xFF888888), width: 2),
                    onChanged: (value) {
                      _vendorAuthController.isRemember.value = value!;
                    },
                  ),
                ),
                Text(
                  "Remember me",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFA1A1A1),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(() => VendorForgetPasswordScreen());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF96C330),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Obx(
              () => CustomButton(
                loading: _vendorAuthController.isLoginLoading.value,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _vendorAuthController.login(
                      email: _vendorAuthController.emailTextController.text
                          .trim(),
                      password:
                          _vendorAuthController.passwordController.text.trim(),
                    );
                  }
               
                },
                text: "Sign in",
              ),
            ),
            SizedBox(height: 22),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don’t have account? ",
                  style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => VendorSignupScreen());
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
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    );
  }
}
