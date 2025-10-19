import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';

class PopularGroceryScreen extends StatefulWidget {
  const PopularGroceryScreen({super.key});

  @override
  State<PopularGroceryScreen> createState() => _PopularGroceryScreenState();
}

class _PopularGroceryScreenState extends State<PopularGroceryScreen> {

  final List<Map<String, dynamic>> mealItems = [
    {
      'name': 'Strawberry',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/strawberry.png',
    },
    {
      'name': 'Avocado',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/avocado.png',
    },
    {
      'name': 'Strawberry',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/strawberry.png',
    },
    {
      'name': 'Avocado',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/avocado.png',
    },
    {
      'name': 'Strawberry',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/strawberry.png',
    },
    {
      'name': 'Avocado',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/avocado.png',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Popular Grocery",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: GridView.builder(
          itemCount: mealItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.80,
          ),
          itemBuilder: (context, index) {
            return PopularGroceryCard(item: mealItems[index]);
          },
        ),
      ),
    );
  }
}


