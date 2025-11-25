import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_mael_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularMealScreen extends StatefulWidget {
  final int id;
  const PopularMealScreen({super.key, required this.id});

  @override
  State<PopularMealScreen> createState() => _PopularMealScreenState();
}

class _PopularMealScreenState extends State<PopularMealScreen> {

 

  final _homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeController.fetchPopularFood(id: widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Popular Meal"),
      body: Obx(
        () => _homeController.isPopularMealLoading.value
            ? Center(child: CustomLoading())
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16,
                ),
                child: GridView.builder(
                  itemCount: _homeController.propularAllFoodList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.80,
                  ),
                  itemBuilder: (context, index) {
                    return MealCard(
                      productModel: _homeController.propularAllFoodList[index],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
