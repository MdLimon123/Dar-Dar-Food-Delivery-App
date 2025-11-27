import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AllPopularFruitsScreen extends StatefulWidget {
  final int id;
  const AllPopularFruitsScreen({super.key, required this.id});

  @override
  State<AllPopularFruitsScreen> createState() => _AllPopularFruitsScreenState();
}

class _AllPopularFruitsScreenState extends State<AllPopularFruitsScreen> {
  final _homeController = Get.put(HomeController());

  final searchTextController = TextEditingController();
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
      appBar: CustomAppbar(title: "Popular Fruits"),

      body: Obx(
        () => _homeController.isPopularMealLoading.value
            ? Center(child: CustomLoading())
            : ListView(
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
                  SizedBox(height: 28),
                  GridView.builder(
                    itemCount: _homeController.propularAllFoodList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.80,
                        ),
                    itemBuilder: (context, index) {
                      final data = _homeController.propularAllFoodList[index];
                      return PopularGroceryCard(productData: data,
                      onTap: () {
                        _homeController.wishFovariteItem(id:  data.id ?? 0);
                      },
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
