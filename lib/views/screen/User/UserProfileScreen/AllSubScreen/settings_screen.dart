import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Settings",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/lock.svg'),
              SizedBox(width: 12,),
              InkWell(
                onTap: (){
                  Get.to(()=> ChangePasswordScreen());
                },
                child: Text("Change Password",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6E6E6F)
                ),),
              )
            ],
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/delete.svg'),
              SizedBox(width: 12,),
              Text("Delete Account",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6E6E6F)
                ),)
            ],
          ),
        ],
      ),
    );
  }
}
