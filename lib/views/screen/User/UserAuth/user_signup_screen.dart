import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserAuth/user_login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSignupScreen extends StatefulWidget {
  const UserSignupScreen({super.key});

  @override
  State<UserSignupScreen> createState() => _UserSignupScreenState();
}

class _UserSignupScreenState extends State<UserSignupScreen> {

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Sign in",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        children: [
          Center(
            child: Text("Hello!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
          ),
          SizedBox(height: 12,),
          Center(
            child: Text("Welcome to Dar Dar! Please sign up to continue access",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
            ),
            textAlign: TextAlign.center,),
          ),
          SizedBox(height: 24,),
          _headingText(
            text: "Full Name"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: nameTextController,
          hintText: "Enter your full name",),
          SizedBox(height: 12,),
          _headingText(
              text: "Email"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: emailTextController,
            hintText: "Enter your email",),
          SizedBox(height: 12,),
          _headingText(
              text: "Phone Number"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: passwordTextController,
            hintText: "Enter your phone number",),
          SizedBox(height: 12,),
          _headingText(
              text: "Password"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: passwordTextController,
            maxLine: 1,
            isPassword: true,
            hintText: "Enter your password",),
          SizedBox(height: 12,),
          _headingText(
              text: "Confirm Password"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            controller: confirmTextController,
            maxLine: 1,
            isPassword: true,
            hintText: "Confirm your password",),
          SizedBox(height: 24,),

          CustomButton(onTap: (){},
              text: "Sign Up"),
          SizedBox(height: 12,),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: "Sign In",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(()=>UserLoginScreen());
                      },
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

  Text _headingText({required String text}) {
    return Text(text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,

        ),);
  }
}
