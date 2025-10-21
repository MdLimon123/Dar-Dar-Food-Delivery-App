import 'package:dar_dar_foodd_delivery_app/views/base/_custom_food_card.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20),
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, index) => SizedBox(height: 12),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){

          },
          child: SizedBox(
              width: 265,
              child: FoodCard(
                icon: Icons.favorite,
              )),
        );
      },
    );
  }
}
