import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroceryCard extends StatelessWidget {
  const GroceryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Stack(
            children:[

              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  'assets/image/grocery.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const Positioned(
                top: 15,
                left: 15,
                child: RatingPill(rating: 4.8, count: 24),
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
                  child: const Icon(
                    Icons.favorite_border,
                    color: Color(0xFF89B12C),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text(
                  'Burger Express Mirpur',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),

                Row(
                  children: <Widget>[

                    SvgPicture.asset("assets/icons/delivery.svg"),
                    const SizedBox(width: 4),
                    const Text(
                      'Delivery Fee \$15',
                      style: TextStyle(
                        color: Color(0xFF89B12C),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 15),


                    const Icon(
                      Icons.access_time,
                      color: Color(0xFF686868),
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '15-20 min',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Text(
                  'Pizza  |  Burger  |  Pasta  |  Chicken Fry',
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