import 'package:dar_dar_foodd_delivery_app/controllers/userController/card_controller.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/cart_item.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/polular_food_and_grocery_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MealCard extends StatelessWidget {
  final ProductData productModel;
  final IconData icon;
  final  Function()? onTap;
  MealCard({
    super.key,
    required this.productModel,
    this.icon = Icons.favorite_border,
   required this.onTap,
  });

  final _cartController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return 
    
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Color(0xFFFEFEFE), blurRadius: 1)],
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
                  onTap: onTap,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: Color(0xFF89B12C), size: 18),
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
                  productModel.name ?? '',
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            id: productModel.id ?? 0,
                            name: productModel.name ?? "",
                            image:
                                "${ApiConstant.imageBaseUrl}${productModel.image1}",
                            price:
                                double.tryParse(productModel.price ?? "0") ?? 0,
                            quantity:
                                int.tryParse("1") ??
                                1, 
                            gm:
                                productModel.quantity ??
                                '', 
                          ),
                        );

                        Get.snackbar("Success", "Item added to cart");
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
 
 
  }
}
