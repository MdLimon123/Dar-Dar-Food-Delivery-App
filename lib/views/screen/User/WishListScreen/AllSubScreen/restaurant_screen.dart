import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: _homeController.allNearbyRestaurantList.length,
      separatorBuilder: (_, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          child: SizedBox(width: 265, child: FoodCard(icon: Icons.favorite,
          allNearbyRestaurantModel: _homeController.allNearbyRestaurantList[index],)),
        );
      },
    );
  }
}
