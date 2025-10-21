import 'package:dar_dar_foodd_delivery_app/views/base/_custom_mael_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
    return GridView.builder(
      itemCount: mealItems.length,
      padding: EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        return MealCard(item: mealItems[index],
        icon: Icons.favorite,);
      },

    );

  }
}
