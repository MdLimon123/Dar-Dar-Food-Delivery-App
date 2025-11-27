import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
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
  final locationController = TextEditingController();
  final phoneController = TextEditingController();

  final _userProfileController = Get.put(UserProfileController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("==============> ${_userProfileController.userInfo.value.image}");

    nameTextController.text =
        _userProfileController.userInfo.value.fullName ?? '';
    phoneController.text =
        _userProfileController.userInfo.value.phoneNumber ?? '';
    _userProfileController.locationController.text =
        _userProfileController.userInfo.value.currentAddress ?? '';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Edit Profile"),
      body: Obx(
        () => ListView(
             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          children: [
            Container(
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
                                        border: Border.all(
                                          color: AppColors.borderColor,
                                        ),
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
                                      imageUrl:
                                          "${ApiConstant.imageBaseUrl}${_userProfileController.userInfo.value.image}",
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
                            _userProfileController.userInfo.value.fullName ?? "",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3A3A35),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _userProfileController
                                    .userInfo
                                    .value
                                    .currentAddress ??
                                "",
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
                    hintText:
                        _userProfileController.userInfo.value.fullName ?? "",
                  ),
                        
                  SizedBox(height: 12),
                  _headingText(title: "Contact Number"),
                  SizedBox(height: 12),
                  CustomTextField(
                    controller: phoneController,
                    filColor: Color(0xFFEBEBEB),
                    hintText:
                        _userProfileController.userInfo.value.phoneNumber ?? "",
                  ),
                  SizedBox(height: 12),
                  _headingText(title: "Location"),
                  SizedBox(height: 12),
                        
                  Obx(() {
                    return Column(
                      children: [
                        TextField(
                          controller: _userProfileController.locationController,
                          onChanged: (value) {
                            _userProfileController.fetchLocationSuggestions(
                              value,
                            );
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                            ),
                            fillColor: Color(0xFFFEFEFE),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            hintText: 'Enter Location',
                            hintStyle: TextStyle(
                              color: const Color(0xFF545454),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        if (_userProfileController.locationLoading.value)
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        if (_userProfileController.locationSuggestions.isNotEmpty)
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: ListView.builder(
                              itemCount: _userProfileController
                                  .locationSuggestions
                                  .length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    _userProfileController
                                        .locationSuggestions[index],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                  onTap: () {
                                    _userProfileController.selectedLocation(
                                      _userProfileController
                                          .locationSuggestions[index],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    );
                  }),
                        
               
                  SizedBox(height: 40),
                  Obx(
                    () => CustomButton(
                      loading: _userProfileController.updateProfileLoading.value,
                      onTap: () {
                        if (nameTextController.text.isEmpty) {
                          nameTextController.text =
                              _userProfileController.userInfo.value.fullName ??
                              "";
                        } else if (phoneController.text.isEmpty) {
                          phoneController.text =
                              _userProfileController.userInfo.value.phoneNumber ??
                              "";
                        } else if (locationController.text.isEmpty) {
                          phoneController.text =
                              _userProfileController
                                  .userInfo
                                  .value
                                  .currentAddress ??
                              "";
                        }
                        
                        _userProfileController.updateUserProfile(
                          imagePath:
                              _userProfileController
                                  .userProfileImage
                                  .value
                                  ?.path ??
                              "",
                          fullName: nameTextController.text.trim(),
                          phoneNumber: phoneController.text.trim(),
                          currentAddress: locationController.text.trim(),
                        );
                      },
                      text: "Save",
                    ),
                  ),
                ],
              ),
            ),
          ],
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
