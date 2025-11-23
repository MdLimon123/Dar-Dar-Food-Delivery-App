import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VendorEmailVerifyScreen extends StatefulWidget {
  final String email;
  const VendorEmailVerifyScreen({super.key, required this.email});

  @override
  State<VendorEmailVerifyScreen> createState() =>
      _VendorEmailVerifyScreenState();
}

class _VendorEmailVerifyScreenState extends State<VendorEmailVerifyScreen> {
  final _vendorAuthController = Get.put(VendorAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Verify OTP"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Center(
            child: Text(
              "Check your email",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              "We sent a reset link to contact@gmail.com Please enter the 6 digit code.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 74),
          OtpTextField(
            numberOfFields: 6,
            fieldWidth: 50,
            fieldHeight: 50,
            borderWidth: 1.2,
            borderRadius: BorderRadius.circular(12),
            cursorColor: AppColors.primaryColor,
            filled: true,
            fillColor: const Color(0xFFE6E6E6),
            borderColor: const Color(0xFF767676),
            enabledBorderColor: const Color(0xFF767676),
            focusedBorderColor: AppColors.primaryColor,
            showFieldAsBox: true,
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111111),
            ),
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              _vendorAuthController.otp.value = verificationCode;
            },
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Resend Code",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 18),
          Obx(()=>
             CustomButton(
              loading: _vendorAuthController.isVerifiedLoading.value,
              onTap: () {
                _vendorAuthController.emailVerifed(email: widget.email);
              },
              text: "Verify Code",
            ),
          ),
        ],
      ),
    );
  }
}
