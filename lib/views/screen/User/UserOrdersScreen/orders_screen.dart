import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserOrdersScreen/AllSubScreen/orders_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Orders",
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              width: double.infinity,
              decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("assets/image/dummy.jpg"),
                          fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 7,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Daily Shopping Store",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF686868)
                          ),),
                          SizedBox(height: 12,),
                          Text("Location : 775 Rolling Green Rd.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF686868)
                            ),)
                        ],
                      ),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Get.to(()=> OrdersDetailsScreen());
                        },
                        child: Container(
                          height: 34,
                          width: 75,
                          decoration: BoxDecoration(
                            color: Color(0xFF89B12C),
                            borderRadius: BorderRadius.circular(4)
                          ),
                          child: Center(
                            child: Text("Details",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFAFAFA)
                            ),),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12,),
                  Text("Delivery Receive By:",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF96C330),
                    fontSize: 12
                  ),),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 37,
                        width: 37,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage("assets/image/dummy.jpg"),
                                fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 7,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Daily Shopping Store",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF686868)
                            ),),
                          SizedBox(height: 12,),
                          Text("Location : 775 Rolling Green Rd.",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF686868)
                            ),)
                        ],
                      ),

                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) =>SizedBox(height: 12,),
          itemCount: 5),
      bottomNavigationBar: UserBottomMenu(4),
    );
  }
}
