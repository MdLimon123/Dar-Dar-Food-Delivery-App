import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CompleteOrderScreen extends StatefulWidget {
  const CompleteOrderScreen({super.key});

  @override
  State<CompleteOrderScreen> createState() => _CompleteOrderScreenState();
}

class _CompleteOrderScreenState extends State<CompleteOrderScreen> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );


    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Complete Order",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 70,),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: SvgPicture.asset(
                  'assets/icons/complete.svg',
                  width: 105,
                  height: 105,
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Center(
            child: Text("Order Completed",
            style: TextStyle(
              fontSize: 20, 
              fontWeight: FontWeight.w500,
              color: Color(0xFF555656)
            ),),
          ),
          SizedBox(height: 14,),
          _customText(
            title: 'Name: User Name'
          ),
          SizedBox(height: 10,),
          _customText(title: "Contact No:+9900000000"),
          SizedBox(height: 10,),
          _customText(title: "Address: 13th Street. 47 W 13th St, New York, NY 10011"),
          SizedBox(height: 10,),
          _customText(title: "Delivery Date: 04/04/2024"),
          SizedBox(height: 10,),
          _customText(title: "Delivery Time: 04:00 pm"),
          SizedBox(height: 18,),
          Center(child: Text(" Your order has been completed",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5B52A3)
          ),)),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Rating shop",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF89B12C)
              ),),
              SizedBox(width: 5,),
              SvgPicture.asset(
                'assets/icons/star.svg',
              )
            ],
          ),
          SizedBox(height: 83,),
          InkWell(
            onTap: (){
              Get.to(()=> UserHomeScreen());
            },
            child: Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFF35E24),
                width: 1)
              ),
              child: Center(
                child: Text("Back to Home",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF35E24)
                ),),
              ),
            ),
          ),
          SizedBox(height: 10,),
          CustomButton(onTap: (){},
              text: "Order History")
        ],
      ),
    );
  }

  Widget _customText({required String title}) {
    return Center(
          child: Text(title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF6E6E6F)
          ),),
        );
  }
}


// Name: User Name
// Contact No:+9900000000
// Address: 13th Street. 47 W 13th St,
//     New York, NY 10011
//
// Delivery Date: 04/04/2024
// Delivery Time: 04:00 pm
//
// Your order has been completed