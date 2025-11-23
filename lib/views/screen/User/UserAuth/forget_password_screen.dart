import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final forgotEmailController = TextEditingController();

  final _userAuthController = Get.put(UserAuthController());
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Forgot password"),
      body: Form(
        key: _fromKey,
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
                  return 'Enter your name';
                }
                return null;
              },

              hintText: "Enter your email",
            ),
            SizedBox(height: 24),
            Obx(()=>
               CustomButton(
                loading: _userAuthController.isForgetLoading.value,
                onTap: () {
                  if (_fromKey.currentState!.validate()) {
                    _userAuthController.forgetPassword(
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
