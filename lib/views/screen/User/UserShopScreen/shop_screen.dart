import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/nearby_grocery_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/popular_grocery_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/AllSubScreen/all_popular_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  final searchTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: _customAppbar(),
      // body: ListView(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      //   children: [
      //     CustomTextField(
      //       controller: searchTextController,
      //       prefixIcon: Padding(
      //         padding: const EdgeInsets.only(left: 8.0),
      //         child: SvgPicture.asset("assets/icons/search.svg"),
      //       ),
      //       hintText: "Search here....",),
      //     SizedBox(height: 16,),
      //    Container(
      //      width: double.infinity,
      //      color: Colors.white,
      //      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //      child:  Column(
      //        mainAxisAlignment: MainAxisAlignment.start,
      //        crossAxisAlignment: CrossAxisAlignment.start,
      //        children: [
      //          Text("Popular Categories"),
      //          SizedBox(height: 12,),
      //          SizedBox(
      //            height: 97,
      //            child: ListView.separated(
      //                separatorBuilder: (context, index){
      //                  return SizedBox(width: 12,);
      //                },
      //                scrollDirection: Axis.horizontal,
      //                itemCount: 5,
      //                shrinkWrap: true,
      //                itemBuilder:(context, index){
      //                  return Container(
      //                    width: 86,
      //                    height: 97,
      //                    decoration: BoxDecoration(
      //                        color: Color(0xFFDEECBF),
      //                        borderRadius: BorderRadius.circular(8)
      //                    ),
      //                    child: Column(
      //                      crossAxisAlignment: CrossAxisAlignment.center,
      //                      mainAxisAlignment: MainAxisAlignment.center,
      //                      children: [
      //                        Image.asset('assets/image/vagetables.png',
      //                          height: 57,
      //                          width: 57,),
      //                        SizedBox(height: 2,),
      //                        Text('Fruits',
      //                          style: TextStyle(
      //                              fontSize: 12,
      //                              fontWeight: FontWeight.w400,
      //                              color: AppColors.textColor
      //                          ),)
      //                      ],
      //                    ),
      //                  );
      //                }),
      //          )
      //        ],
      //      ),
      //    ),
      //     SizedBox(height: 16,),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Text("Near By Grocery",
      //           style: TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.w600,
      //               color: AppColors.textColor
      //           ),),
      //         InkWell(
      //           onTap: (){
      //
      //           },
      //           child: Text("View All",
      //             style: TextStyle(
      //                 fontSize: 12,
      //                 fontWeight: FontWeight.w400,
      //                 color: Color(0xFFF35E24)
      //             ),),
      //         )
      //       ],
      //     ),
      //     SizedBox(height: 24,),
      //     /// Near By Grocery
      //     SizedBox(
      //       height: 260,
      //       child: ListView.separated(
      //         itemCount: 5,
      //         separatorBuilder: (_, index) => SizedBox(height: 12),
      //         itemBuilder: (context, index) {
      //           return SizedBox(
      //               width: 265,
      //               child: GroceryCard());
      //         },
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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

          /// Popular Categories
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

          const SizedBox(height: 16),

          /// Near By Grocery Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Near By Grocery",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> NearbyGroceryScreen());
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFF35E24),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          /// Near By Grocery List
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.to(()=> PopularGroceryScreen());
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 260,
                  child: GroceryCard(),
                ),
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: UserBottomMenu(1),
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
       ]

    );
  }
}
