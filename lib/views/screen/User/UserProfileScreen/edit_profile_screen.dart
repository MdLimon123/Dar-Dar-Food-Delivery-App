import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameTextController = TextEditingController();

  final _userProfileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Edit Profile",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  /// Profile info (centered)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Obx(
                                ()=> Container(
                            height: 84,
                            width: 84,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _userProfileController.userProfileImage.value != null
                                    ?  FileImage(_userProfileController.userProfileImage.value!):
                                AssetImage("assets/image/dummy.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Ashiqur Rahman",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3A3A35),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Stockton, New Hampshire",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3A3A35),
                        ),
                      ),
                    ],
                  ),

                  /// Edit icon (top right)
                  Positioned(
                    top: 60,
                    right: 130,
                    child: InkWell(
                      onTap: (){
                        _userProfileController.pickUserProfileImage();
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF656565),
                              blurRadius: 4,
                              offset: Offset(0, 4)
                            )]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset("assets/icons/camera.svg"),
                        ),
                      ),
                    ),
                  )

                ],
              ),
              SizedBox(height: 67,),
              _headingText(
                  title: "User Name"
              ),
              SizedBox(height: 12,),
              CustomTextField(controller: nameTextController,
                filColor: Color(0xFFEBEBEB),
                hintText: "Full Name",),
              SizedBox(height: 12,),
              _headingText(
                  title: "Email"
              ),
              SizedBox(height: 12,),
              CustomTextField(
                controller: nameTextController,
                filColor: Color(0xFFEBEBEB),
                hintText: "fatmajannat@gmail.com",
              ),
              SizedBox(height: 12,),
              _headingText(
                  title: "Contact Number"
              ),
              SizedBox(height: 12,),
              CustomTextField(
                controller: nameTextController,
                filColor: Color(0xFFEBEBEB),
                hintText: "(704) 555-0127",
              ),
              SizedBox(height: 12,),
              _headingText(
                  title: "Location"
              ),
              SizedBox(height: 12,),
              CustomTextField(
                controller: nameTextController,
                filColor: Color(0xFFEBEBEB),
                hintText: "Stockton, New Hampshire",
              ),
              SizedBox(height: 40,),
              CustomButton(onTap: (){},
                  text: "Save")
            ],
          ),
        ),
      ),


    );
  }

  Text _headingText({required String title}) {
    return Text(title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF3A3A35),
      ),);
  }
}
