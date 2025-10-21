import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Change Password",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _headingText(
            title: "Current Password"
          ),
          SizedBox(height: 8,),
          CustomTextField(
            hintText: "Enter your current password",
          ),
          SizedBox(height: 24,),
          _headingText(
              title: "New Password"
          ),
          SizedBox(height: 8,),
          CustomTextField(
            hintText: "Enter your new password",
          ),
          SizedBox(height: 24,),
          _headingText(
              title: "Confirm Password"
          ),
          SizedBox(height: 8,),
          CustomTextField(
            hintText: "Enter your confirm password",
          ),
          SizedBox(height: 150,),
          CustomButton(onTap: (){},
              text: "Save")
        ],
      ),
    );
  }

  Widget _headingText({required String title}) {
    return Text(title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor
        ),);
  }
}
