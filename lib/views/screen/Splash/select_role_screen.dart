import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_icons.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(AppIcons.appLogo),
            ),
            const SizedBox(height: 50),
            CustomButton(onTap: (){
              Get.offAllNamed(AppRoutes.userLoginScreen);
            },
                text: "User"),
            SizedBox(height: 10,),
            CustomButton(onTap: (){
              Get.offAllNamed(AppRoutes.vendorLoginScreen);
            },
                text: "Vendor"),
            SizedBox(height: 10,),
            CustomButton(onTap: (){},
                text: "Rider")

          ],
        ),
      ),
    );
  }
}
