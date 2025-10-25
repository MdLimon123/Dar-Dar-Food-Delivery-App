import 'package:dar_dar_foodd_delivery_app/controllers/riderController/rider_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderHomeScreen/rider_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RiderVerifyScreen extends StatefulWidget {
  const RiderVerifyScreen({super.key});

  @override
  State<RiderVerifyScreen> createState() => _RiderVerifyScreenState();
}

class _RiderVerifyScreenState extends State<RiderVerifyScreen> {

  final _riderAuthController = Get.put(RiderAuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F0),
      appBar: CustomAppbar(
        title: "Verify",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Text("Bank Info :",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF855BBB)
          ),),
          SizedBox(height: 12,),
          _headingText(
            title: "Bank Account Name"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Enter Bank Account Name",
          ),
          SizedBox(height: 20,),
          _headingText(
              title: "Bank Account Number"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Enter Bank Account Number",
          ),
          SizedBox(height: 20,),
          _headingText(
              title: "Bank Name"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Enter Bank Name",
          ),
          SizedBox(height: 20,),
          _headingText(
              title: "Payment Method Preferences"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Enter Payment Method Preferences",
          ),
          SizedBox(height: 20,),
          _headingText(
              title: "Driving License"
          ),
          SizedBox(height: 12,),
          Obx(() {
            final file = _riderAuthController.drivingImage.value;
            return InkWell(
              onTap: (){
                _riderAuthController.pickStoreImage( fromCamera: false);
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
          SizedBox(height: 32,),
          CustomButton(onTap: (){
            Get.to(()=> RiderHomeScreen());
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
