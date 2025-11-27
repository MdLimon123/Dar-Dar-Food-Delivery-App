import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VendorEditProfileScreen extends StatefulWidget {
  const VendorEditProfileScreen({super.key});

  @override
  State<VendorEditProfileScreen> createState() =>
      _VendorEditProfileScreenState();
}

class _VendorEditProfileScreenState extends State<VendorEditProfileScreen> {
  final _vendorProfileController = Get.put(VendorProfileController());

  final restaurantNameController = TextEditingController();
  final contactNumberController = TextEditingController();

  final bankAccountNumberController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    restaurantNameController.text =
        _vendorProfileController.vendorInfoModel.value.shopName ?? "";
    contactNumberController.text =
        _vendorProfileController.vendorInfoModel.value.phoneNumber ?? "";
    bankAccountNumberController.text =
        _vendorProfileController.vendorInfoModel.value.accountNumber ?? "";
    bankNameController.text =
        _vendorProfileController.vendorInfoModel.value.bankName ?? "";
    accountNameController.text =
        _vendorProfileController.vendorInfoModel.value.accountName ?? "";

    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: CustomAppbar(title: "Edit Profile"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF9F9F9),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Obx(
                        () =>
                            _vendorProfileController.vendorProfileImage.value !=
                                null
                            ? Container(
                                height: 84,
                                width: 84,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        _vendorProfileController
                                                .vendorProfileImage
                                                .value !=
                                            null
                                        ? FileImage(
                                            _vendorProfileController
                                                .vendorProfileImage
                                                .value!,
                                          )
                                        : AssetImage(
                                            'assets/image/location.png',
                                          ),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(color: Color(0xFFE1E1E1)),
                                ),
                              )
                            : CustomNetworkImage(
                                imageUrl:
                                    "${ApiConstant.imageBaseUrl}${_vendorProfileController.vendorInfoModel.value.image}",
                                height: 84,
                                boxShape: BoxShape.circle,
                                width: 84,
                              ),
                      ),
                      Positioned(
                        child: InkWell(
                          onTap: () {
                            _vendorProfileController.pickVendorProfileImage();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/camera.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Center(
                  child: Text(
                    "Restaurant Location",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3A3A35),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                  child: Text(
                    "${_vendorProfileController.vendorInfoModel.value.currentAddress}",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3A3A35),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3A3A35),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "${_vendorProfileController.vendorInfoModel.value.totalRatingCount}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, color: Color(0xFFFFAE00)),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                _headingText(title: "Restaurant Name"),
                SizedBox(height: 8),
                CustomTextField(
                  controller: restaurantNameController,
                  hintText:
                      _vendorProfileController.vendorInfoModel.value.shopName ??
                      "Enter Restaurant Name",
                  filColor: Color(0xFFEBEBEB),
                ),
                // SizedBox(height: 16,),
                // _headingText(
                //     title: "Email"
                // ),
                // SizedBox(height: 8,),
                // CustomTextField(
                //   hintText: "Enter Email",
                //   filColor: Color(0xFFEBEBEB),
                // ),
                SizedBox(height: 16),
                _headingText(title: "Contact Number"),
                SizedBox(height: 8),
                CustomTextField(
                  controller: contactNumberController,
                  hintText:
                      _vendorProfileController
                          .vendorInfoModel
                          .value
                          .phoneNumber ??
                      "Enter Contact Number",
                  filColor: Color(0xFFEBEBEB),
                ),
                SizedBox(height: 16),
                _headingText(title: "Location"),

                SizedBox(height: 42),
                Text(
                  "Bank Account Info :",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF96C330),
                  ),
                ),
                SizedBox(height: 12),
                _headingText(title: "Bank Account Number"),
                SizedBox(height: 8),
                CustomTextField(
                  hintText:
                      _vendorProfileController
                          .vendorInfoModel
                          .value
                          .accountNumber ??
                      "Enter Bank Account Number",
                  controller: bankAccountNumberController,
                  filColor: Color(0xFFEBEBEB),
                ),
                SizedBox(height: 16),
                _headingText(title: "Bank Name"),
                SizedBox(height: 8),
                CustomTextField(
                  hintText:
                      _vendorProfileController.vendorInfoModel.value.bankName ??
                      "Enter Bank Name",
                  controller: bankNameController,
                  filColor: Color(0xFFEBEBEB),
                ),
                SizedBox(height: 16),
                _headingText(title: "Account Name"),
                SizedBox(height: 8),
                CustomTextField(
                  hintText:
                      _vendorProfileController
                          .vendorInfoModel
                          .value
                          .accountName ??
                      "Enter Account Name",
                  controller: accountNameController,
                  filColor: Color(0xFFEBEBEB),
                ),

                SizedBox(height: 50),
                Obx(()=>
                   CustomButton(
                    loading: _vendorProfileController.updateProfileLoading.value,
                    onTap: () {
                      if (restaurantNameController.text.isEmpty) {
                        restaurantNameController.text =
                            _vendorProfileController
                                .vendorInfoModel
                                .value
                                .shopName ??
                            "";
                      } else if (contactNumberController.text.isEmpty) {
                        contactNumberController.text =
                            _vendorProfileController
                                .vendorInfoModel
                                .value
                                .phoneNumber ??
                            "";
                      } else if (bankAccountNumberController.text.isEmpty) {
                        bankAccountNumberController.text =
                            _vendorProfileController
                                .vendorInfoModel
                                .value
                                .accountNumber ??
                            "";
                      } else if (bankNameController.text.isEmpty) {
                        bankNameController.text =
                            _vendorProfileController
                                .vendorInfoModel
                                .value
                                .bankName ??
                            "";
                      } else if (accountNameController.text.isEmpty) {
                        accountNameController.text =
                            _vendorProfileController
                                .vendorInfoModel
                                .value
                                .accountName ??
                            "";
                      }
                  
                      _vendorProfileController.updateVendorProfile(
                        profileImage:
                            _vendorProfileController
                                .vendorProfileImage
                                .value
                                ?.path ??
                            "",
                        shopName: restaurantNameController.text,
                        contactNumber: contactNumberController.text,
                        bankAccountNumber: bankAccountNumberController.text,
                        bankName: bankNameController.text,
                        accountName: accountNameController.text,
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
