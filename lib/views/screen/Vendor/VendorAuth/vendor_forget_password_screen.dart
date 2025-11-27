import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorForgetPasswordScreen extends StatefulWidget {
  const VendorForgetPasswordScreen({super.key});

  @override
  State<VendorForgetPasswordScreen> createState() =>
      _VendorForgetPasswordScreenState();
}

class _VendorForgetPasswordScreenState
    extends State<VendorForgetPasswordScreen> {
  final forgotEmailController = TextEditingController();
  final _vendorAuthController = Get.put(VendorAuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Forgot password"),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Center(
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
                  color: AppColors.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 41),
            _headingText(text: "Email"),
            SizedBox(height: 10),
            CustomTextField(
              controller: forgotEmailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your email";
                }
                return null;
              },
              hintText: "Enter your email",
            ),
            SizedBox(height: 24),
            Obx(
              () => CustomButton(
                loading: _vendorAuthController.isForgetLoading.value,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _vendorAuthController.forgetPassword(
                      email: forgotEmailController.text.trim(),
                    );
                  }
                },
                text: "Send Code",
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
