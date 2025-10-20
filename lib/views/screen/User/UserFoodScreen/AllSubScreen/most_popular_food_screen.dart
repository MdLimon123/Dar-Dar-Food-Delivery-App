import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_mael_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MostPopularFoodScreen extends StatefulWidget {
  const MostPopularFoodScreen({super.key});

  @override
  State<MostPopularFoodScreen> createState() => _MostPopularFoodScreenState();
}

class _MostPopularFoodScreenState extends State<MostPopularFoodScreen> {
  final List<Map<String, dynamic>> mealItems = [
    {
      'name': 'Cheesy Pan Pizza',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/burger2.png',
    },
    {
      'name': 'Strawberry Cake',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/cake.png',
    },
    {
      'name': 'Cheesy Pan Pizza',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/burger2.png',
    },
    {
      'name': 'Strawberry Cake',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/cake.png',
    },
    {
      'name': 'Cheesy Pan Pizza',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/burger2.png',
    },
    {
      'name': 'Strawberry Cake',
      'vendor': 'Testy treat',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/cake.png',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      appBar: CustomAppbar(title: "Burger Express Mirpur",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage("assets/image/restaurant.jpg"),
              fit: BoxFit.cover)
            ),
          ),
          SizedBox(height: 12,),
          Center(
            child: Text("Burger Express Mirpur",
            style: TextStyle(
              color: Color(0xFF5C5C5C),
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Location :",
              style: TextStyle(
                color: Color(0xFF5C5C5C),
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),),
            SizedBox(width: 4,),
              Text("775 Rolling Green Rd.",
              style: TextStyle(
                color: Color(0xFF686868),
                fontSize: 12,
                fontWeight: FontWeight.w300
              ),),
              SizedBox(width: 16,),
              Container(
                height: 14,
                width: 1,
                color: Color(0xFFAFAFAF),
              ),
              SizedBox(width: 16,),
              SvgPicture.asset('assets/icons/clock.svg'),
              SizedBox(width: 4,),
              Text("15-20 min",
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 12,
                fontWeight: FontWeight.w500
              ),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Contact Info :",
                style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),),
              SizedBox(width: 4,),
              Text("+9 5255124778",
                style: TextStyle(
                    color: Color(0xFF686868),
                    fontSize: 12,
                    fontWeight: FontWeight.w300
                ),),
              SizedBox(width: 16,),
              Container(
                height: 14,
                width: 1,
                color: Color(0xFFAFAFAF),
              ),
              SizedBox(width: 16,),
              Text("Rating :",
              style: TextStyle(
                color: Color(0xFF5C5C5C),
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),),
              SvgPicture.asset('assets/icons/star.svg'),
              SizedBox(width: 8,),
              Text("4.8",
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                ),),
              SizedBox(width: 10,),
              Text("(24)",
                style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),)
            ],
          ),
          SizedBox(height: 57,),
          SizedBox(
            height: 97,
            child: ListView.separated(
                separatorBuilder: (context, index){
                  return SizedBox(width: 12,);
                },
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder:(context, index){
                  return Container(
                    width: 86,
                    height: 97,
                    decoration: BoxDecoration(
                        color: Color(0xFFDEECBF),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/image/pizza.png',
                          height: 57,
                          width: 57,),
                        SizedBox(height: 2,),
                        Text('Pizza',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor
                          ),)
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(height: 34,),
          Row(
            children: [
              Text("Popular",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor
              ),),
              SizedBox(width: 5,),
           
              SvgPicture.asset("assets/icons/hot.svg")
            ],
          ),
          SizedBox(height: 12,),
          Text("Most ordered right now",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Color(0xFF686868)
          ),),
          SizedBox(height: 24,),
          GridView.builder(
            itemCount: mealItems.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.80,
            ),
            itemBuilder: (context, index) {
              return MealCard(item: mealItems[index]);
            },
          )
        ],
      ),
    );
  }
}
