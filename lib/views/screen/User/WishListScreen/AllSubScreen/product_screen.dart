import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_mael_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _homeController = Get.put(HomeController());


  @override
  void initState() {
    _homeController.fetchPopularFood(id: 11);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _homeController.propularAllFoodList.length,
      padding: EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.80,
      ),
      itemBuilder: (context, index) {
        return MealCard(productModel: _homeController.propularAllFoodList[index],
        onTap: () {
          _homeController.wishFovariteItem(
              id: _homeController.propularAllFoodList[index].id!);
        },);
      },
    );
  }
}
