import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllPopularFruitsScreen extends StatefulWidget {
  const AllPopularFruitsScreen({super.key});

  @override
  State<AllPopularFruitsScreen> createState() => _AllPopularFruitsScreenState();
}

class _AllPopularFruitsScreenState extends State<AllPopularFruitsScreen> {
  final searchTextController = TextEditingController();
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
      appBar: CustomAppbar(title: "Popular Fruits"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          CustomTextField(
            controller: searchTextController,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            hintText: "Search here....",
          ),
          SizedBox(height: 28,),
          GridView.builder(
            itemCount: mealItems.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
        ],
      ),
    );
  }
}
