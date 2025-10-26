import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/rider_bottom_menu..dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RiderTransectionScreen extends StatefulWidget {
  const RiderTransectionScreen({super.key});

  @override
  State<RiderTransectionScreen> createState() => _RiderTransectionScreenState();
}

class _RiderTransectionScreenState extends State<RiderTransectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F5F7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Transections",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textColor
          ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(4)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Order",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE1E1E1)
                        ),),
                      Text("Total Balance",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE1E1E1)
                        ),),
                      Text("Date",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE1E1E1)
                        ),),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("416",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE1E1E1)
                        ),),
                      Text("416,820",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE1E1E1)
                        ),),
                      Text("5Jun 2024",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE1E1E1)
                        ),)

                    ],
                  ),


                ],
              ),
            ),
            SizedBox(height: 24,),
            Row(
              children: [
                Text("Todays",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                  ),),
                Spacer(),
                Text("5 Jun 2024",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor
                  ),),
                SizedBox(width: 12,),
                SvgPicture.asset("assets/icons/calender.svg")
              ],
            ),
            SizedBox(height: 18,),
            Expanded(child: ListView.separated(
                itemBuilder: (context, index){
                  return   Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFFEFEFE),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 92,
                          height: 90,
                          decoration: BoxDecoration(
                              color: Color(0xFFFEFEFE),
                              borderRadius: BorderRadius.circular(4),
                              image: DecorationImage(image: AssetImage('assets/image/pizza2.jpg'),
                                  fit: BoxFit.cover)
                          ),

                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mushroom Burger",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor
                              ),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text("Total Price :450",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF6B8A22)
                                      ),),
                                    Row(
                                      children: [
                                        Text("Admin Fee :",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:Color(0xFF6B8A22)
                                          ),),
                                        Text("-50",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFE5260C)
                                          ),)
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 100,),
                                Text("\$400",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF96C330)
                                  ),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Delivery date: 05/12/2024",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF5C5C5C)
                              ),)

                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, _)=> SizedBox(height: 10,),
                itemCount: 10))
          ],
        ),
      ),
      bottomNavigationBar: RiderBottomMenu(1),
    );
  }
}
