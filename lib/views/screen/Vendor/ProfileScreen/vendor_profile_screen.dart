import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/vendor_bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/ProfileScreen/vendor_edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VendorProfileScreen extends StatefulWidget {
  const VendorProfileScreen({super.key});

  @override
  State<VendorProfileScreen> createState() => _VendorProfileScreenState();
}

class _VendorProfileScreenState extends State<VendorProfileScreen> {
  final _vendorProfileController = Get.put(VendorProfileController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vendorProfileController.fetchVendorInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (_vendorProfileController.isLoading.value) {
          return Center(child: CustomLoading());
        }
        final data = _vendorProfileController.vendorInfoModel.value;
       return ListView(
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
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 84,
                            width: 84,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Color(0xFFE1E1E1)),
                            ),
                            child: CustomNetworkImage(
                              imageUrl:"${ApiConstant.imageBaseUrl}${data.image}",
                              boxShape: BoxShape.circle,
                             height: 55,
                              width: 55),
                          ),
                        ),
                      ),

                      /// Edit icon at end
                      InkWell(
                        onTap: () {
                          Get.to(() => VendorEditProfileScreen());
                        },
                        child: SvgPicture.asset(
                          'assets/icons/edit.svg',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ],
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
                      data.currentAddress ?? "",
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
                          data.rating != null ? data.rating.toString() : "0.0",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3A3A35),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "(${data.totalRatingCount != null ? data.totalRatingCount.toString() : "0"} )",
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
                    readOnly: true,
                    hintText: data.shopName ?? "",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16),
                  _headingText(title: "Email"),
                  SizedBox(height: 8),
                  CustomTextField(
                    readOnly: true,
                    hintText: data.email ?? "",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16),
                  _headingText(title: "Contact Number"),
                  SizedBox(height: 8),
                  CustomTextField(
                    readOnly: true,
                    hintText: data.phoneNumber ?? "",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16),
                  _headingText(title: "Location"),
                  SizedBox(height: 8),
                  CustomTextField(
                    readOnly: true,
                    hintText: data.currentAddress ?? "",
                    filColor: Color(0xFFEBEBEB),
                  ),
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
                    readOnly: true,
                    hintText: data.accountNumber ?? "",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16),
                  _headingText(title: "Bank Name"),
                  SizedBox(height: 8),
                  CustomTextField(
                    readOnly: true,
                    hintText: data.bankName ?? "",
                    
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16),
                  _headingText(title: "Account Name"),
                  SizedBox(height: 8),
                  CustomTextField(
                    readOnly: true,
                    hintText: data.accountName ?? "",
                    filColor: Color(0xFFEBEBEB),
                  ),
                ],
              ),
            ),
          ],
        );
      }),

      bottomNavigationBar: VendorBottomMenu(3),
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
