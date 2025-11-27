import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorResetPasswordScreen extends StatefulWidget {
  const VendorResetPasswordScreen({super.key});

  @override
  State<VendorResetPasswordScreen> createState() =>
      _VendorResetPasswordScreenState();
}

class _VendorResetPasswordScreenState extends State<VendorResetPasswordScreen> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _vendorAuthController = Get.put(VendorAuthController());

  final _fromKey = GlobalKey<FormState>();

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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your new password";
                }
                return null;
              },
              hintText: "Enter your new password",
              isPassword: true,
            ),
            SizedBox(height: 12),
            CustomTextField(
              controller: confirmPasswordController,
              maxLine: 1,
              isPassword: true,
              validator: (value) => value == null || value.isEmpty
                  ? "Please confirm your new password"
                  : value != newPasswordController.text
                  ? "Passwords do not match"
                  : null,
              hintText: "Confirm your new password",
            ),
            SizedBox(height: 24),
            Obx(
              () => CustomButton(
                loading: _vendorAuthController.isResetLoading.value,
                onTap: () {
                  if (_fromKey.currentState!.validate()) {
                    _vendorAuthController.resetPassword(
                      newPassword: newPasswordController.text,
                      confirmPassword: confirmPasswordController.text,
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
