import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_popular_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/AllSubScreen/all_popular_categories_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/AllSubScreen/all_popular_fruits_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PopularGroceryScreen extends StatefulWidget {
  const PopularGroceryScreen({super.key});

  @override
  State<PopularGroceryScreen> createState() => _PopularGroceryScreenState();
}

class _PopularGroceryScreenState extends State<PopularGroceryScreen> {

  final searchTextController = TextEditingController();
  final List<Map<String, dynamic>> mealItems = [
    {
      'name': 'Strawberry',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/strawberry.png',
    },
    {
      'name': 'Avocado',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/avocado.png',
    },
    {
      'name': 'Strawberry',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/strawberry.png',
    },
    {
      'name': 'Avocado',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/avocado.png',
    },
    {
      'name': 'Strawberry',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 22.00,
      'imagePath': 'assets/image/strawberry.png',
    },
    {
      'name': 'Avocado',
      'vendor': '( 30 gm)',
      'price': 25.00,
      'oldPrice': 35.00,
      'imagePath': 'assets/image/avocado.png',
    },

  ];
  int _currentIndex = 0;

  final List<Map<String, dynamic>> carouselItems = [
    {
      'title': '20%',
      'subtitle': 'New Arrivals!',
      'description': 'Get a new car discount\nonly valid this week',
      'imagePath': 'assets/image/dummyVage.png',
      'backgroundColor': const Color(0xFF1D2925),
    },
    {
      'title': '30%',
      'subtitle': 'New Arrivals!',
      'description': 'Save big on electronics\nthis weekend only',
      'imagePath': 'assets/image/dummyVage.png',
      'backgroundColor': const Color(0xFF123456),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Popular Grocery",
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        children: [
          CustomTextField(
            controller: searchTextController,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            hintText: "Search here....",
          ),
          SizedBox(height: 32,),

          /// Carousel slider
          CarouselSlider.builder(
            itemCount: carouselItems.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return _buildCarouselItem(carouselItems[index]);
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
            children: carouselItems.map((url) {
              int index = carouselItems.indexOf(url);
              return Container(
                width:  12.0,
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
          SizedBox(height: 40,),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),),
                    InkWell(
                      onTap: (){
                        Get.to(()=> AllPopularCategoriesScreen());
                      },
                      child: Text("View All",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color:Color(0xFFDD5621)
                        ),),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 97,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, _) => const SizedBox(width: 12),
                    itemCount: 5,
                    itemBuilder: (context, index) {
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
                            Image.asset(
                              'assets/image/vagetables.png',
                              height: 57,
                              width: 57,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Fruits',
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
          SizedBox(height: 27,),
          Row(
            children: [
              Text("Popular",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor
                ),),
              SizedBox(width: 5,),

              SvgPicture.asset("assets/icons/hot.svg"),
              Spacer(),
              InkWell(
                onTap: (){
                  Get.to(()=> AllPopularFruitsScreen());
                },
                child: Text("View All ",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFF35E24)
                ),),
              )
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
              return PopularGroceryCard(item: mealItems[index]);
            },
          ),
        ],
      ),
    );
  }


  Widget _buildCarouselItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: item['backgroundColor'],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // 👈 prevents Column from expanding too much
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['title'],
                    style: const TextStyle(
                      color: Color(0xFFF7F7F7),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    item['subtitle'],
                    style: const TextStyle(
                      color: Color(0xFFFEFEFE),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['description'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFEFEFE),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: AspectRatio(     // 👈 ensures image keeps proportion
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item['imagePath']),
                    fit: BoxFit.cover, // 👈 better than fill
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


