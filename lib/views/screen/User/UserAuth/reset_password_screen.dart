import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _fromKey = GlobalKey<FormState>();

  final _authController = Get.put(UserAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Reset Password"),
      body: Form(
        key: _fromKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Center(
              child: Text(
                "Set a new password",
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
                "Enter your email and we will send you a verification code",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5C5C5C),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 35),
            _headingText(text: "Enter New Password"),
            SizedBox(height: 10),
            CustomTextField(
              controller: newPasswordController,
              maxLine: 1,
              hintText: "Enter your new password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your confirm password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              isPassword: true,
            ),
            SizedBox(height: 12),
            CustomTextField(
              controller: confirmPasswordController,
              hintText: "Confirm your new password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your confirm password';
                } else if (value != confirmPasswordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            Obx(
              () => CustomButton(
                loading: _authController.isResetLoading.value,
                onTap: () {
                  if (_fromKey.currentState!.validate()) {
                    _authController.resetPassword(
                      newPassword: newPasswordController.text.trim(),
                      confirmPassword: confirmPasswordController.text.trim(),
                    );
                  }
                },
                text: "Reset Password",
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
