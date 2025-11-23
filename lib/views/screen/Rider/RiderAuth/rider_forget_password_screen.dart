import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderAuth/rider_otp_verify_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RiderForgetPasswordScreen extends StatefulWidget {
  const RiderForgetPasswordScreen({super.key});

  @override
  State<RiderForgetPasswordScreen> createState() => _RiderForgetPasswordScreenState();
}

class _RiderForgetPasswordScreenState extends State<RiderForgetPasswordScreen> {

  final forgotEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Forgot password",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Center(
            child: Text("Forgot Password",
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
          ),
          SizedBox(height: 12,),
          Center(
            child: Text(
              "Enter your email and we will send you a verification code",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
              ),
              textAlign: TextAlign.center,),
          ),
          SizedBox(height: 41,),
          _headingText(text: "Email"),
          SizedBox(height: 10,),
          CustomTextField(controller:forgotEmailController,
          hintText: "Enter your email",),
          SizedBox(height: 24,),
          CustomButton(onTap: (){
            Get.to(()=> RiderOtpVerifyScreen());
          },
              text: "Send Code")

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
