import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserCardScreen/AllSubScreen/edit_address_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserCardScreen/AllSubScreen/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      appBar: CustomAppbar(title: "Check Out",),
      body: ListView(
        children: [
          SizedBox(height: 14,),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                    ),),
                    InkWell(
                      onTap: (){
                        Get.to(()=> EditAddressScreen());
                      },
                      child: Container(
                        height: 32,
                        width: 114,
                        decoration: BoxDecoration(
                          color: Color(0xFF5B52A3),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(child: Text("Edit Address",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                        ),)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4,),
                Text("Name: User Name",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
                ),),
                SizedBox(height: 4,),
                Text("Contact No:+9900000000",
                    style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor
                )),
                SizedBox(height: 4,),
                Text("13th Street. 47 W 13th St, New York, NY 10011 ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor
                    ) )
              ],
            ),

          ),
          SizedBox(height: 11,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("Payment Option",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF555656)
            ),),
          ),
          SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              padding: EdgeInsets.all(16),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Card",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6E6E6F)
                  ),),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F5F7),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFB7B8B9),
                      width: 1)
                    ),
                    
                  ),

                ],
              ),
            ),
          ),
          SizedBox(height: 28,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sub Total",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),),
                Text("\$715.00",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),)
              ],
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Fee:",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),),
                Text("\$50.00",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                  ),)
              ],
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Color(0xFFE1E1E1),
              height: 1,
            ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5B52A3)
                  ),),
                Text("\$771.00",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF5B52A3)
                  ),)
              ],
            ),
          ),
          SizedBox(height: 237,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(onTap: (){
              Get.to(()=> PaymentScreen());
            },
                text: "Check Out"),
          )

        ],
      ),
    );
  }
}
