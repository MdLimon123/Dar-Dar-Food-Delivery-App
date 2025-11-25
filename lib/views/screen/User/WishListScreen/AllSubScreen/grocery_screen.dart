import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _homeController.propularAllFoodList.length,
      padding: EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        final data = _homeController.propularAllFoodList[index];
        return PopularGroceryCard(productData: data, icon: Icons.favorite);
      },
    );
  }
}
