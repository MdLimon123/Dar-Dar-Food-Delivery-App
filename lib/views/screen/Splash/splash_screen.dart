import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Get.offAllNamed(AppRoutes.selectRoleScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      body: Center(
        child: Image.asset(AppIcons.appLogo),
      ),
    );
  }
}
