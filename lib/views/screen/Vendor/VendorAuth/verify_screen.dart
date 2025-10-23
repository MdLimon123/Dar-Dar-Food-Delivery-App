import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/setup_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {

  final _setupProfileController = Get.put(SetupProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Verify",
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Text("Store Info :",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF855BBB)
          ),),
          SizedBox(height: 24,),
          _headingText(
            title: "Phone Number"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: 'Enter your phone number',
          ),
          SizedBox(height: 24,),
          _headingText(
            title: "Store Location"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Store Name",
          ),
          SizedBox(height: 24,),
          _headingText(title: "Store Image"),
          SizedBox(height: 12,),

          Obx(() {
            final file = _setupProfileController.storeImage.value;
            return InkWell(
              onTap: (){
                _setupProfileController.pickStoreImage( fromCamera: false);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(file == null)...[

                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          "assets/icons/default_image.svg",

                        ),
                      ),

                      Text(
                        "Image",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC0C0C0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ] else ...[
                      Image.file(file,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,)
                    ]
                  ],
                ),
              ),
            );

          }),
          SizedBox(height: 24,),
          _headingText(title: "Store License"),
          SizedBox(height: 12,),
          Obx(() {
            final file = _setupProfileController.licenseImage.value;
            return InkWell(
              onTap: (){
                _setupProfileController.pickLicenseImage( fromCamera: false);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if(file == null)...[

                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          "assets/icons/default_image.svg",

                        ),
                      ),

                      Text(
                        "Image",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC0C0C0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ] else ...[
                      Image.file(file,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 150,)
                    ]
                  ],
                ),
              ),
            );

          }),
          SizedBox(height: 24,),
          Text("Bank Info :",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF855BBB)
          ),),
          SizedBox(height: 12,),
          Text("Bank Account Name",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor
          ),),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Account Name",
          ),
          SizedBox(height: 24,),
          _headingText(title: "Bank Account Number"),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Account Number"),
          SizedBox(height: 24,),
          _headingText(title: "Bank Name"),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Bank Name"),
          SizedBox(height: 24,),
          _headingText(title: "Payment Method Preferences"),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Payment Method Preferences"),
          SizedBox(height: 24,),

          CustomButton(onTap: (){

            Get.offAllNamed(AppRoutes.vendorHomeScreen);
          },
              text: "Submit")

        ],
      ),

    );
  }

  Text _headingText({required String title}) {
    return Text(title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor
        ),);
  }
}
