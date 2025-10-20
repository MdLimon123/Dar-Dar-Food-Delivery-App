import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_food_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserFoodScreen/AllSubScreen/most_popular_food_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserFoodScreen/AllSubScreen/nearby_mos_popular_restaurant_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/nearby_restaurant_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/popular_meal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {

  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F5),
      appBar: _customAppbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          CustomTextField(
            controller: searchTextController,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            hintText: "Search here....",),
          SizedBox(height: 24,),
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
          SizedBox(height: 24,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Near By Restaurant",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor
                ),),
              InkWell(
                onTap: (){
                  Get.to(()=> NearbyMostPopularRestaurantScreen());
                },
                child: Text("View All",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFF35E24)
                  ),),
              )
            ],
          ),
          SizedBox(height: 16,),
          /// near by restaurant
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              separatorBuilder: (_, index) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.to(()=> MostPopularFoodScreen());
                  },
                  child: SizedBox(
                      width: 265,
                      child: FoodCard()),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: UserBottomMenu(2),
    );
  }


  AppBar _customAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          /// Profile photo
          Container(
            height: 44,
            width: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/image/dummy.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),

          /// Name + Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ashiqur Rahman",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3A3A35),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF5C5C5C),
                      size: 16,
                    ),
                    const SizedBox(width: 3),
                    Expanded(
                      child: Text(
                        "San Fernando Warehouse",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3A3A35),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      actions: [
        /// Notification icon
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              height: 22,
              width: 22,
            ),
          ),
        ),

        // const SizedBox(width: 8),
        //
        // Builder(
        //   builder: (context) => InkWell(
        //     onTap: () {
        //       Scaffold.of(context).openEndDrawer();
        //     },
        //     child: Container(
        //       height: 36,
        //       width: 36,
        //       margin: const EdgeInsets.only(right: 8),
        //       decoration: const BoxDecoration(
        //         shape: BoxShape.circle,
        //         color: Color(0xFFEDEDED),
        //       ),
        //       child: const Icon(
        //         Icons.menu,
        //         color: Colors.black87,
        //         size: 20,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
