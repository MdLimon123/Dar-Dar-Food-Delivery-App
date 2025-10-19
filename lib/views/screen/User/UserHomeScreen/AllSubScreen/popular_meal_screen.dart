import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_mael_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';

class PopularMealScreen extends StatefulWidget {
  const PopularMealScreen({super.key});

  @override
  State<PopularMealScreen> createState() => _PopularMealScreenState();
}

class _PopularMealScreenState extends State<PopularMealScreen> {

  final List<Map<String, dynamic>> mealItems = [
    {
      'name': 'Cheesy Pan Pizza',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/burger2.png',
    },
    {
      'name': 'Strawberry Cake',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/cake.png',
    },
    {
      'name': 'Cheesy Pan Pizza',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/burger2.png',
    },
    {
      'name': 'Strawberry Cake',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/cake.png',
    },
    {
      'name': 'Cheesy Pan Pizza',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/burger2.png',
    },
    {
      'name': 'Strawberry Cake',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/cake.png',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Popular Meal",
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
            return MealCard(item: mealItems[index]);
          },
        ),
      ),
    );
  }
}


