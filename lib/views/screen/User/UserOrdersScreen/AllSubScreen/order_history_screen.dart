import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Order History",
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          itemBuilder: (context, index){
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 11, vertical: 15),
          decoration: BoxDecoration(
            color: Color(0xFFFCFCFD),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF000000).withValues(alpha: 0.15),
                blurRadius: 4,
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Products: 3",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF555656)
              ),),
              SizedBox(height: 12,),
              Row(
                children: [
                  Text("Delivery Fee : \$25",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF555656)
                  ),),
                  SizedBox(width: 23,),
                  Text("Price: \$75",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF555656)
                    ),),
                ],
              ),
              SizedBox(height: 12,),
              Text("Date:  20-Dec-2024, 3:00 PM",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF555656)
              ),),
              SizedBox(height: 12,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFEEFE9),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/image/dummy.jpg"))
                      ),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Cameron Williamson",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor
                        ),),
                        SizedBox(height: 16,),
                        Text("+1 (470) 918 8577",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),),
                      ],
                    ),
                    SizedBox(width: 30,),
                    Container(
                      height: 34,
                      width: 98,
                      decoration: BoxDecoration(
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Center(
                        child: Text("Complete",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFAFAFA)
                        ),),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
          separatorBuilder: (context, index) => SizedBox(height: 12,),
          itemCount: 5),
    );
  }
}
