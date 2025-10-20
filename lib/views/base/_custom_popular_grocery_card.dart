import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/AllSubScreen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularGroceryCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const PopularGroceryCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        Get.to(()=> ProductDetailsScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFEFEFE),
              blurRadius: 1,
            ),
          ],

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Stack(
              children: [
                ClipRRect(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    item['imagePath'],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0xFF89B12C),
                      size: 18,
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
                    item['name'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
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
                            image: DecorationImage(image: AssetImage('assets/image/burger2.png'),
                                fit: BoxFit.cover)
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        item['vendor'],
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Text(
                        '\$${item['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF96C330)
                        ),
                      ),

                      Text(
                        '\$${item['oldPrice'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF2600),
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Color(0xFFFF2600),
                        ),
                      ),

                      InkWell(
                        onTap: (){

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
      ),
    );
  }
}