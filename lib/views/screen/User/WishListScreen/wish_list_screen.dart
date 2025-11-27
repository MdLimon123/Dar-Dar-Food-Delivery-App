import 'package:dar_dar_foodd_delivery_app/controllers/userController/card_controller.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/userController/wish_list_controller.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/cart_item.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final _wishListController = Get.put(WishListController());
  final _cartController = Get.put(CardController());

  @override
  void initState() {
    _wishListController.fetchWishListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Wish List"),

      body: Obx(
        () => _wishListController.isLoading.value
            ? Center(child: CustomLoading())
            : GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shrinkWrap: true,
                itemCount: _wishListController.wishListProduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) {
                  final productModel =
                      _wishListController.wishListProduct[index];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Color(0xFFFEFEFE), blurRadius: 1),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image.network(
                                "${ApiConstant.imageBaseUrl}${productModel.image1}",
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),

                            Positioned(
                              top: 8,
                              right: 8,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF7F7F7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Color(0xFF89B12C),
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productModel.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor,
                                ),
                              ),
                              const SizedBox(height: 5),

                              Row(
                                children: [
                                  Container(
                                    height: 18,
                                    width: 18,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          '${ApiConstant.imageBaseUrl}${productModel.image1}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    productModel.description ?? '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${productModel.currency} ${productModel.price}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF96C330),
                                    ),
                                  ),

                                  // Text(
                                  //   '\$${item['oldPrice'].toStringAsFixed(2)}',
                                  //   style: const TextStyle(
                                  //     fontSize: 12,
                                  //     color: Color(0xFFFF2600),
                                  //     fontWeight: FontWeight.w300,
                                  //     decoration: TextDecoration.lineThrough,
                                  //     decorationColor: Color(0xFFFF2600),
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      _cartController.addToCart(
                                        CartItem(
                                          id: productModel.id,
                                          name: productModel.name,
                                          image:
                                              "${ApiConstant.imageBaseUrl}${productModel.image1}",
                                          price:
                                              double.tryParse(
                                                productModel.price ?? "0",
                                              ) ??
                                              0,
                                          quantity: int.tryParse("1") ?? 1,
                                          gm: productModel.quantity ?? '',
                                        ),
                                      );
                                      Get.snackbar(
                                        "Success",
                                        "Item added to cart",
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF35E24),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
