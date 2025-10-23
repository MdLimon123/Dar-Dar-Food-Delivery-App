import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VendorOtpVerifyScreen extends StatefulWidget {
  const VendorOtpVerifyScreen({super.key});

  @override
  State<VendorOtpVerifyScreen> createState() => _VendorOtpVerifyScreenState();
}

class _VendorOtpVerifyScreenState extends State<VendorOtpVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Verify OTP"),
     body: ListView(
       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
       children: [
         Center(
           child: Text("Check your email",
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500,
             color: AppColors.textColor
           ),),
         ),
         SizedBox(height: 12,),
         Center(
           child: Text("We sent a reset link to contact@gmail.com Please enter the 6 digit code.",
           style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w400,
             color: AppColors.textColor
           ),
           textAlign: TextAlign.center,),
         ),
         SizedBox(height: 74,),
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
             // handle submit here
           },
         ),
         SizedBox(height: 10,),
         Align(
           alignment: Alignment.centerRight,
           child: Text("Resend Code",
           style: TextStyle(
             color: AppColors.primaryColor,
             fontSize: 12,
             fontWeight: FontWeight.w400,
             decoration: TextDecoration.underline,
             decorationColor: AppColors.primaryColor
           ),
           ),
         ),
         SizedBox(height: 18,),
         CustomButton(onTap: (){
           Get.to(()=> VendorResetPasswordScreen());
         },
             text: "Verify Code")

       ],
     ),
    );
  }
}
