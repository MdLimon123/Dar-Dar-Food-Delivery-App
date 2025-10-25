import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RiderEditProfileScreen extends StatefulWidget {
  const RiderEditProfileScreen({super.key});

  @override
  State<RiderEditProfileScreen> createState() => _RiderEditProfileScreenState();
}

class _RiderEditProfileScreenState extends State<RiderEditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF0F0F0),
        appBar: CustomAppbar(
          title: "Edit Profile",
        ),
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
                        Container(
                          height: 84,
                          width: 84,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/image/dummy.jpg')),
                            border: Border.all(color: Color(0xFFE1E1E1)),
                          ),

                        ),
                        Positioned(
                          child: SvgPicture.asset('assets/icons/camera.svg',
                            height: 20,
                            width: 20,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12,),
                  Center(
                    child: Text("Restaurant Location",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF3A3A35)
                      ),),
                  ),
                  SizedBox(height: 4,),
                  Center(
                    child:Text("Stockton, New Hampshire",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3A3A35)
                      ),),
                  ),

                  SizedBox(height: 32,),
                  _headingText(
                      title: "Restaurant Name"
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    hintText: "Enter Restaurant Name",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16,),
                  _headingText(
                      title: "Email"
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    hintText: "Enter Email",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16,),
                  _headingText(
                      title: "Contact Number"
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    hintText: "Enter Contact Number",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16,),
                  _headingText(
                      title: "Location"
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    hintText: "Enter Location",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 42,),
                  Text("Bank Account Info :",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF96C330)
                    ),),
                  SizedBox(height: 12,),
                  _headingText(
                      title: "Bank Account Number"
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    hintText: "Enter Bank Account Number",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16,),
                  _headingText(
                      title: "Bank Name"
                  ),
                  SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Enter Bank Name",
                    filColor: Color(0xFFEBEBEB),
                  ),
                  SizedBox(height: 16,),
                  _headingText(
                      title: "Payment Method Preferences"
                  ),
                  SizedBox(height: 8,),
                  CustomTextField(
                    hintText: "Enter Payment Method Preferences",
                    filColor: Color(0xFFEBEBEB),
                  ),

                  SizedBox(height: 50,),
                  CustomButton(onTap: (){},
                      text: "Save")

                ],
              ),
            ),
          ],
        )
    );
  }

  Text _headingText({required String title}) {
    return Text(title,
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xFF3A3A35)
      ),);
  }

}
