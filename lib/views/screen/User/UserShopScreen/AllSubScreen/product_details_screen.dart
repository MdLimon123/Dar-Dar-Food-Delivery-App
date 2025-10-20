import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      appBar: CustomAppbar(title: "Product Details",),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            color: Color(0xFFFFFFFF),
            child: Center(
              child: Image.asset('assets/image/strawberry.png',
              width: 190,
              height: 147,),
            ),
          ),
          SizedBox(height: 40,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("\$98",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF89B12C)
                    ),),
                    SizedBox(width: 4,),
                    Text("\$198",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFFC11415),
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Color(0xFFC11415),
                    ),),
                    SizedBox(width: 10,),
                    Text("/500gm",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF686868)
                    ),),
                    SizedBox(width: 50,),
                    Container(
                      height: 32,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Color(0xFFEFEEF6),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset('assets/icons/mines.svg'),
                      ),
                    ),
                   SizedBox(width: 8,),
                    Container(
                      height: 32,
                      width: 53,
                      decoration: BoxDecoration(
                          color: Color(0xFFEFEEF6),
                          borderRadius: BorderRadius.circular(4)
                      ),
                   child: Center(
                     child: Text("1",
                     style: TextStyle(
                       fontSize: 16,
                       fontWeight: FontWeight.w400,
                       color: Color(0xFF555656)
                     ),),
                   ),
                    ),
                    SizedBox(width: 8,),
                    Container(
                      height: 32,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xFFEFEEF6),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Icon(Icons.add),
                    ),
                    
                  ],
                ),
                SizedBox(height: 12,),
                Text("Fresh Strawberry",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor
                ),),
                SizedBox(height: 12,),
                Text("Products Details ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF555656)
                ),),
                SizedBox(height: 12,),
                Text("Every 500 gm of product will contain 10-12 pcs of Strawberry..Strawberries are delicious, vibrant red fruits known for their sweet flavor and juicy texture. They belong to the genus Fragaria and are widely more...",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF929394)
                ),),
                SizedBox(height: 32,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFF89B12C), width: 1)
                        ),
                        child: Center(
                          child: Text("Buy Now",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF89B12C)
                            ),),
                        ),
                      ),
                    ),
                    SizedBox(width: 17,),
                    Expanded(
                      child: Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF89B12C)
                        ),
                        child: Center(
                          child: Text("Add to cart",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white
                            ),),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),


        ],
      ),
    );
  }
}
