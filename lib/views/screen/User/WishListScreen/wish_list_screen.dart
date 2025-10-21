import 'package:dar_dar_foodd_delivery_app/controllers/userController/wish_list_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/WishListScreen/AllSubScreen/widgets/tabs_widget_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  final _wishListController = Get.put(WishListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Wish List",
      ),

      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _wishListController.tabList.length,
                itemBuilder: (context, index) {
                  return Obx(() {


                    return TabsWidgetScreen(
                      onTap: () {
                        _wishListController.tabIndex.value = index;
                      },
                      isSelected: _wishListController.isTabSelected(index),
                      tabName: _wishListController.tabList[index],

                    );
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Obx(() {
              return _wishListController
                  .tabSections[_wishListController.tabIndex.value];
            }),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(
          onTap: () {

          },
          text: "Check Out",
        ),
      ),

    );
  }
}
