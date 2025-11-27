import 'package:dar_dar_foodd_delivery_app/controllers/data_controller.dart';
import 'package:dar_dar_foodd_delivery_app/helpers/prefs_helper.dart';
import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_constants.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _dataController = Get.put(DataController());

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      _loadUserRoleAndNavigate();
    });

    super.initState();
  }

  Future<void> _loadUserRoleAndNavigate() async {
    await _dataController.getData();
    await _dataController.getVendorData();
    print("user id=============> ${_dataController.vendorId.value}");
    print("user role=============> ${_dataController.role.value}");

    var token = await PrefsHelper.getString(AppConstants.bearerToken);
    if (token.isNotEmpty) {
      if (_dataController.role.value == "USER") {
        Get.offAndToNamed(AppRoutes.userHomeScreen);
      } else if (_dataController.role.value == "VENDOR") {
        Get.offAndToNamed(AppRoutes.vendorHomeScreen);
      } else if (_dataController.role.value == "RIDER") {
        Get.offAndToNamed(AppRoutes.riderHomeScreen);
      } else {
        Get.offAndToNamed(AppRoutes.selectRoleScreen);
      }
    } else {
      Get.offAndToNamed(AppRoutes.selectRoleScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      body: Center(child: Image.asset(AppIcons.appLogo)),
    );
  }
}
