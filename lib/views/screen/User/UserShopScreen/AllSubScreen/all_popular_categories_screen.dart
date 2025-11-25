import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/userController/shop_controller.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllPopularCategoriesScreen extends StatefulWidget {
  final int id;
  const AllPopularCategoriesScreen({super.key, required this.id});

  @override
  State<AllPopularCategoriesScreen> createState() =>
      _AllPopularCategoriesScreenState();
}

class _AllPopularCategoriesScreenState
    extends State<AllPopularCategoriesScreen> {
  final searchTextController = TextEditingController();

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
      appBar: CustomAppbar(title: "All Categories"),

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
                  const SizedBox(height: 16),

                  GridView.builder(
                    itemCount: _homeController.vendorCategoryList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) {
                      final data = _homeController.vendorCategoryList[index];
                      return Column(
                        children: [
                          Container(
                            height: 51,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "${ApiConstant.imageBaseUrl}${data.image}",
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            data.name ?? "",
                            style: TextStyle(
                              color: Color(0xFF929394),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
