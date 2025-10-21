import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Notifications",
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemBuilder: (context, index){
            return Container(
             width: double.infinity,
             padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
             decoration: BoxDecoration(
               color: Color(0xFFFFFFFF),
               borderRadius: BorderRadius.circular(10)
             ),
             child: Row(
               children: [
                 Container(
                   height: 46,
                   width: 46,
                   padding: EdgeInsets.all(10),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Color(0xFFEBF7E4),
                   ),
                   child: SvgPicture.asset('assets/icons/user.svg'),
                 ),
                 SizedBox(width: 8,),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Razco Food reply on your feedback",
                     style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.w500,
                       color: Color(0xFF6E6E6F)
                     ),),
                     SizedBox(height: 4,),
                     Text("Credit card has been linked!",
                     style: TextStyle(
                       fontSize: 14,
                       fontWeight: FontWeight.w400,
                       color: Color(0xFF555763)
                     ),),
                     SizedBox(height: 4,),
                     Text("20-Dec-2024, 3:00 PM",
                     style: TextStyle(
                       fontSize: 12,
                       fontWeight: FontWeight.w400,
                       color: Color(0xFFC3C4C6)
                     ),)
                   ],
                 )
               ],
             ),
            );
          },
          separatorBuilder:(_, _)=> SizedBox(height: 8,),
          itemCount: 5),
    );
  }
}
