import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final nameTextController = TextEditingController();

  final _userProfileController = Get.put(UserProfileController());

  @override
  void initState() {
    _userProfileController.fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Profile"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Obx(() {
          if (_userProfileController.isLoading.value) {
            return Center(child: CustomLoading());
          }
          final data = _userProfileController.userInfo.value;

          return Container(
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: (data.image == null || data.image!.isEmpty)
                              ? Container(
                                  height: 84,
                                  width: 84,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/image/dummy.jpg",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : CustomNetworkImage(
                                  imageUrl:
                                      "${ApiConstant.imageBaseUrl}${data.image}",
                                  boxShape: BoxShape.circle,
                                  height: 84,
                                  width: 84,
                                ),
                        ),

                        const SizedBox(height: 12),
                        Text(
                          "${data.fullName}",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF3A3A35),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${data.currentAddress}",
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
                      top: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            () => EditProfileScreen(
                              image: '${ApiConstant.imageBaseUrl}${data.image}',
                              fullName: '${data.fullName}',
                              currentAddress: '${data.currentAddress}',
                              phoneNumber: '${data.phoneNumber}',
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/icons/edit.svg',
                          height: 20,
                          width: 20,
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
                  readOnly: true,
                  hintText: "${data.fullName}",
                ),
                SizedBox(height: 12),
                _headingText(title: "Email"),
                SizedBox(height: 12),
                CustomTextField(
                  controller: nameTextController,
                  filColor: Color(0xFFEBEBEB),
                  hintText: "${data.email}",
                  readOnly: true,
                ),
                SizedBox(height: 12),
                _headingText(title: "Contact Number"),
                SizedBox(height: 12),
                CustomTextField(
                  controller: nameTextController,
                  filColor: Color(0xFFEBEBEB),
                  hintText: "${data.phoneNumber}",
                  readOnly: true,
                ),
                SizedBox(height: 12),
                _headingText(title: "Location"),
                SizedBox(height: 12),
                CustomTextField(
                  controller: nameTextController,
                  filColor: Color(0xFFEBEBEB),
                  hintText: "${data.currentAddress}",
                  readOnly: true,
                ),
              ],
            ),
          );
        }),
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
