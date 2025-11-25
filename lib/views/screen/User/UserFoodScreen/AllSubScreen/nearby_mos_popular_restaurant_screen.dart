import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_food_card.dart'
    show FoodCard;
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserFoodScreen/AllSubScreen/most_popular_food_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NearbyMostPopularRestaurantScreen extends StatefulWidget {
  const NearbyMostPopularRestaurantScreen({super.key});

  @override
  State<NearbyMostPopularRestaurantScreen> createState() =>
      _NearbyMostPopularRestaurantScreenState();
}

class _NearbyMostPopularRestaurantScreenState
    extends State<NearbyMostPopularRestaurantScreen> {
  final searchTextController = TextEditingController();
  final _homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeController.fetchAllNearbyRestaurant();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Near By Restaurant"),

      body: Obx(
        () => _homeController.isLaoding.value
            ? Center(child: CustomLoading())
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: searchTextController,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SvgPicture.asset("assets/icons/search.svg"),
                      ),
                      hintText: "Search here....",
                    ),
                    SizedBox(height: 24),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount:
                            _homeController.allNearbyRestaurantList.length,
                        separatorBuilder: (_, index) => SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final data =
                              _homeController.allNearbyRestaurantList[index];
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => MostPopularFoodScreen(
                                  id: data.id,
                                  shopName: data.shopName,
                                  shopImage: data.shopImage!,
                               
                                  rating: data.rating,
                                ),
                              );
                            },
                            child: SizedBox(
                              width: 265,
                              child: FoodCard(
                                allNearbyRestaurantModel: _homeController
                                    .allNearbyRestaurantList[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
