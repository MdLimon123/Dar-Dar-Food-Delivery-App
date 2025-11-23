import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String image;
  final String fullName;
  final String currentAddress;
  final String phoneNumber;

  const EditProfileScreen({
    super.key,
    required this.image,
    required this.fullName,
    required,
    required this.currentAddress,
    required this.phoneNumber,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameTextController = TextEditingController();
  final locationController = TextEditingController();
  final phoneController = TextEditingController();

  final _userProfileController = Get.put(UserProfileController());

  @override
  void initState() {
    super.initState();
    _userProfileController.userProfileImage.value = File(widget.image);
    nameTextController.text = widget.fullName;
    phoneController.text = widget.phoneNumber;
    locationController.text = widget.currentAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Edit Profile"),
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
                          () =>
                              _userProfileController.userProfileImage.value !=
                                  null
                              ? Container(
                                  height: 84,
                                  width: 84,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: FileImage(
                                        _userProfileController
                                            .userProfileImage
                                            .value!,
                                      ),

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : CustomNetworkImage(
                                  imageUrl: widget.image,
                                  height: 84,
                                  boxShape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.borderColor,
                                  ),
                                  width: 84,
                                ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.fullName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF3A3A35),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.currentAddress,
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
                      onTap: () {
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
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset("assets/icons/camera.svg"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 67),
              _headingText(title: "User Name"),
              SizedBox(height: 12),
              CustomTextField(
                controller: nameTextController,
                filColor: Color(0xFFEBEBEB),
                hintText: widget.fullName,
              ),
              // SizedBox(height: 12),
              // _headingText(title: "Email"),
              // SizedBox(height: 12),
              // CustomTextField(
              //   controller: nameTextController,
              //   filColor: Color(0xFFEBEBEB),
              //   hintText: "fatmajannat@gmail.com",
              // ),
              SizedBox(height: 12),
              _headingText(title: "Contact Number"),
              SizedBox(height: 12),
              CustomTextField(
                controller: phoneController,
                filColor: Color(0xFFEBEBEB),
                hintText: widget.phoneNumber,
              ),
              SizedBox(height: 12),
              _headingText(title: "Location"),
              SizedBox(height: 12),
              CustomTextField(
                controller: locationController,
                filColor: Color(0xFFEBEBEB),
                hintText: widget.currentAddress,
              ),
              SizedBox(height: 40),
              Obx(
                () => CustomButton(
                  loading: _userProfileController.updateProfileLoading.value,
                  onTap: () {
                    _userProfileController.updateUserProfile(
                      imagePath: _userProfileController.userProfileImage.value
                          .toString(),
                      fullName: nameTextController.text.trim(),
                      phoneNumber: phoneController.text.trim(),
                      currentAddres: locationController.text.trim(),
                    );
                  },
                  text: "Save",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _headingText({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color(0xFF3A3A35),
      ),
    );
  }
}
