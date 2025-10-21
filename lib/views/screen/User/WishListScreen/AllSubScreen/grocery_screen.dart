import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:flutter/material.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
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
    return  GridView.builder(
      itemCount: mealItems.length,
      padding: EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        return PopularGroceryCard(item: mealItems[index],
        icon: Icons.favorite,);
      },
    );
  }
}
