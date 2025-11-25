import 'package:dar_dar_foodd_delivery_app/models/User/all_nearby_restaurant_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_rating_screen.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final IconData icon;
  final AllNearbyRestaurantModel allNearbyRestaurantModel;

  const FoodCard({
    super.key,
    this.icon = Icons.favorite_border,
    required this.allNearbyRestaurantModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 5),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.network(
                  "${ApiConstant.imageBaseUrl}${allNearbyRestaurantModel.shopImage}",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 15,
                left: 15,
                child: RatingPill(
                  rating: allNearbyRestaurantModel.rating,
                  count: 24,
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Color(0xFF89B12C), size: 24),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allNearbyRestaurantModel.shopName,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),

                Row(
                  children: <Widget>[
                    // SvgPicture.asset("assets/icons/delivery.svg"),
                    // const SizedBox(width: 4),
                    // const Text(
                    //   'Delivery Fee \$15',
                    //   style: TextStyle(
                    //     color: Color(0xFF89B12C),
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w400,
                    //   ),
                    // ),
                    // const SizedBox(width: 15),
                    const Icon(
                      Icons.access_time,
                      color: Color(0xFF686868),
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      allNearbyRestaurantModel.estimateDeliveryTime,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  '${allNearbyRestaurantModel.subcategories[0].name}  |  ${allNearbyRestaurantModel.subcategories[1].name}  |  Pasta  |  Chicken Fry',
                  style: TextStyle(
                    color: Color(0xFF686868),
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
