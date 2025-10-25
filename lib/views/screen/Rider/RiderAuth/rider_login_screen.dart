import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderAuth/rider_forget_password_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderAuth/rider_signup_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderHomeScreen/rider_home_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_forget_password_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderLoginScreen extends StatefulWidget {
  const RiderLoginScreen({super.key});

  @override
  State<RiderLoginScreen> createState() => _RiderLoginScreenState();
}

class _RiderLoginScreenState extends State<RiderLoginScreen> {

  final emailTextController = TextEditingController();

  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Sign in",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        children: [
          Center(
            child: Text("Hello Again!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor
            ),),
          ),
          SizedBox(height: 12,),
          Text("Welcome back to Dar Dar Please sign in to continue access",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),
          textAlign: TextAlign.center,),
          SizedBox(height: 40,),
          Center(
            child: Image.asset("assets/image/sign_up.png",
            height: 112,
            width: 112,),
          ),
          SizedBox(height: 50,),
          _headingText(
            text: "Email"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: emailTextController,
          hintText: "Enter your email ",),
          SizedBox(height: 20,),
          _headingText(
            text: "Password"
          ),
          SizedBox(height: 12,),
          CustomTextField(controller: emailTextController,
          maxLine: 1,
          isPassword: true,
          hintText: "Enter your password ",),
          SizedBox(height: 15,),
          Row(
            children: [
              Checkbox(
                  value: isCheck,
                  activeColor: AppColors.primaryColor,
                  checkColor: Colors.white,
                  side: BorderSide(color: Color(0xFF888888),
                      width: 2),
                  onChanged: (value){
                    setState(() {
                      isCheck = value!;
                    });
                  }),
              Text("Remember me",
                style: TextStyle(
                    fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA1A1A1)
                
                )),
              Spacer(),
              InkWell(
                onTap: (){
                  Get.to(()=> RiderForgetPasswordScreen());
                },
                child: Text("Forgot Password?",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                      color: Color(0xFF96C330),
                      fontSize: 12)),
              )
            ],
          ),
          SizedBox(height: 50,),
          CustomButton(onTap: (){
            Get.to(()=> RiderHomeScreen());
          },
              text: "Sign in"),
          SizedBox(height: 22,),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Don’t have account? ",
                style: TextStyle(
                    color: Color(0xFF222222),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      Get.to(()=>RiderSignupScreen());
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
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor
        ),);
  }
}
