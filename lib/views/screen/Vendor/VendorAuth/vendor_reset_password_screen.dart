import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VendorResetPasswordScreen extends StatefulWidget {
  const VendorResetPasswordScreen({super.key});

  @override
  State<VendorResetPasswordScreen> createState() => _VendorResetPasswordScreenState();
}

class _VendorResetPasswordScreenState extends State<VendorResetPasswordScreen> {

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Reset Password",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Center(
            child: Text("Set a new password",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
          ),
          SizedBox(height: 12,),
          Center(
            child: Text("Enter your email and we will send you a verification code",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF5C5C5C)
            ),
            textAlign: TextAlign.center,),
          ),
          SizedBox(height: 35,),
          _headingText(text: "Enter New Password"),
          SizedBox(height: 10,),
          CustomTextField(controller: newPasswordController,
          maxLine: 1,
          hintText: "Enter your new password",
          isPassword: true,),
          SizedBox(height: 12,),
          CustomTextField(controller: confirmPasswordController,
          hintText: "Confirm your new password",),
          SizedBox(height: 24,),
          CustomButton(onTap: (){
            Get.to(() => VendorLoginScreen());
          },
              text: "Reset Password")

        ],
      ),
    );
  }

  Text _headingText({required String text}) {
    return Text(text,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor
      ),);
  }
}
