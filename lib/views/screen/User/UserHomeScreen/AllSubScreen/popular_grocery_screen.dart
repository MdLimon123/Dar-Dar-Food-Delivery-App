import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/userController/shop_controller.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/shop_banner_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/AllSubScreen/all_popular_categories_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/AllSubScreen/all_popular_fruits_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PopularGroceryScreen extends StatefulWidget {
  final int id;
  const PopularGroceryScreen({super.key, required this.id});

  @override
  State<PopularGroceryScreen> createState() => _PopularGroceryScreenState();
}

class _PopularGroceryScreenState extends State<PopularGroceryScreen> {
  final searchTextController = TextEditingController();

  final _shopController = Get.put(ShopController());
  final _homeController = Get.put(HomeController());

 
  int _currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _shopController.fetchShopBanner(id: widget.id);
      _homeController.fetchPopularFood(id: widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Popular Grocery"),
      body: Obx(
        () => _shopController.isLoading.value
            ? Center(child: CustomLoading())
            : ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16,
                ),
                children: [
                  CustomTextField(
                    controller: searchTextController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                    hintText: "Search here....",
                  ),
                  SizedBox(height: 32),

                  /// Carousel slider
                  CarouselSlider.builder(
                    itemCount: _shopController.shopBannerList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                          return _buildCarouselItem(
                            _shopController.shopBannerList[index],
                          );
                        },
                    options: CarouselOptions(
                      height: 150.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.85,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                  /// Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _shopController.shopBannerList.map((url) {
                      int index = _shopController.shopBannerList.indexOf(url);
                      return Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Color(0xFF89B12C)
                              : Color(0xFFDEECBF),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Popular Categories",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => AllPopularCategoriesScreen(
                                  id: widget.id,
                                ));
                              },
                              child: Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFDD5621),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 97,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: 12),
                            itemCount:
                                _homeController.vendorCategoryList.length,
                            itemBuilder: (context, index) {
                              final category =
                                  _homeController.vendorCategoryList[index];
                              return Container(
                                width: 86,
                                height: 97,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDEECBF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      '${ApiConstant.imageBaseUrl}${category.image}',
                                      height: 57,
                                      width: 57,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      category.name ?? "",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Popular grocery items
                  SizedBox(height: 27),
                  Row(
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(width: 5),

                      SvgPicture.asset("assets/icons/hot.svg"),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.to(() => AllPopularFruitsScreen(
                            id: widget.id,
                          ));
                        },
                        child: Text(
                          "View All ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFF35E24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Most ordered right now",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF686868),
                    ),
                  ),
                  SizedBox(height: 24),
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

  Widget _buildCarouselItem(ShopBannerData banner) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage("${ApiConstant.imageBaseUrl}${banner.image}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
