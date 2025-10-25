import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Rider/RiderHomeScreen/AllSubScreen/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RiderNewOrderScreen extends StatelessWidget {
  const RiderNewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 23),
        color: Color(0xFFFEFEFE),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pick up Location :",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor
              ),),
            SizedBox(height: 15,),
            Row(
              children: [
                Container(
                  height: 33,
                  width: 33, 
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/image/restaurant.jpg'),
                    fit: BoxFit.cover)
                  ),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kacchi Bhai",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor
                    ),),
                    SizedBox(height: 10,),
                    Text("2464 Royal Ln. Mesa",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF767676)
                    ),)
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    Get.to(()=> MapsScreen());
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Color(0xFFFEEFE9),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset("assets/icons/arrow.svg"),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            Divider(
              thickness: 1,
              color: Color(0xFFE1E1E1),
      
            ),
            SizedBox(height: 16,),
            Text("Delivery Location :",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor
      
            ),),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color(0xFFE9E9E9),
                    shape: BoxShape.circle
                  ),
                  child: Image.asset('assets/image/location.png',
                  color: AppColors.textColor,),
                ),
                SizedBox(width: 10,),
                Text("2464 Royal Ln. Mesa",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF767676)
                ),),
                Spacer(),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Color(0xFFFEEFE9),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/icons/arrow.svg"),
                  ),
                )
              ],
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                    fit: BoxFit.cover)
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chicken Chow Mein",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quantity: 01",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF5C5C5C)
                        ),),
                        SizedBox(width: 10,),
                        Text("Price: \$400",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF96C330)
                        ),)
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 18,),
            Divider(
              thickness: 1,
              color: Color(0xFFE1E1E1),
      
            ),
            SizedBox(height: 18,),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                          fit: BoxFit.cover)
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chicken Chow Mein",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quantity: 01",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5C5C5C)
                          ),),
                        SizedBox(width: 10,),
                        Text("Price: \$400",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF96C330)
                          ),)
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 18,),
            Divider(
              thickness: 1,
              color: Color(0xFFE1E1E1),
      
            ),
            SizedBox(height: 18,),
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                          fit: BoxFit.cover)
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Chicken Chow Mein",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quantity: 01",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF5C5C5C)
                          ),),
                        SizedBox(width: 10,),
                        Text("Price: \$400",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF96C330)
                          ),)
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 50,),
            CustomButton(
              color: Color(0xFF96C330),
                onTap: (){},
                text: "Accept")
          ],
        ),
      ),
    );
  }
}
