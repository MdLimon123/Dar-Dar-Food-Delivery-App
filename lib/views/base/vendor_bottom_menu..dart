
import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



class VendorBottomMenu extends StatelessWidget {
  final int menuIndex;

  const VendorBottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? Colors.white : Color(0xFFE1E1E1);
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding: const EdgeInsets.only(top:8),
          child: SvgPicture.asset(
            image,
            height: 24.0,
            width: 24.0,
            color: colorByIndex(theme, index),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(AppIcons.homeIcon, 'Home', theme, 0),
      getItem(AppIcons.transection, 'Transection', theme, 1),
      getItem(AppIcons.notification, 'Notification', theme, 2),
      getItem(AppIcons.profile, 'Profile', theme, 3),

    ];

    return Container(

      decoration: BoxDecoration(

          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),topLeft: Radius.circular(8)
          ),
          boxShadow: const [
            BoxShadow(color:Colors.black38,spreadRadius:0,blurRadius: 10)
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),topLeft: Radius.circular(8)

        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF89B12C),
          selectedItemColor:Color(0xFFFEFEFE),
          unselectedItemColor: Color(0xFFE1E1E1),
          currentIndex: menuIndex,
          
          onTap: (value) {
            switch (value) {
              case 0:
                Get.offAndToNamed(AppRoutes.vendorHomeScreen);
                break;
              case 1:
                Get.offAndToNamed(AppRoutes.transectionScreen);
                break;
              case 2:
                Get.offAndToNamed(AppRoutes.vendorNotificationScreen);
                break;
              case 3:
                Get.offAndToNamed(AppRoutes.vendorProfileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}