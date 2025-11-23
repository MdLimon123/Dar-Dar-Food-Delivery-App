
import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';



class UserBottomMenu extends StatelessWidget {
  final int menuIndex;

  const UserBottomMenu(this.menuIndex, {super.key});

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
      getItem(AppIcons.shop, 'Shop', theme, 1),
      getItem(AppIcons.food, 'Food', theme, 2),
      getItem(AppIcons.cart, 'Cart', theme, 3),
      getItem(AppIcons.order, 'Orders', theme, 4),
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
                Get.offAndToNamed(AppRoutes.userHomeScreen);
                break;
              case 1:
                Get.offAndToNamed(AppRoutes.userShopScreen);
                break;
              case 2:
                Get.offAndToNamed(AppRoutes.userFoodScreen);
                break;
              case 3:
                Get.offAndToNamed(AppRoutes.userCartScreen);
                break;
              case 4:
                Get.offAndToNamed(AppRoutes.userOrderScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}