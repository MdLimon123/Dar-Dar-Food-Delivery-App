import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_food_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/LanguageScreen/language_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Splash/select_role_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/Notification/notification_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/nearby_grocery_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/nearby_restaurant_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserOrdersScreen/AllSubScreen/order_history_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/faq_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/feedback_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/privacy_policy_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/settings_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/AllSubScreen/terms_and_conditon_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/profile_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/WishListScreen/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {

  final searchTextController = TextEditingController();

  int _currentIndex = 0;


  final List<Map<String, dynamic>> carouselItems = [
    {
      'title': '20%',
      'subtitle': 'Top deals!',
      'description': 'Get a new car discount\nonly valid this week',
      'imagePath': 'assets/image/burger.png',
      'backgroundColor': const Color(0xFF1D2925),
    },
    {
      'title': '30%',
      'subtitle': 'Hot Offers',
      'description': 'Save big on electronics\nthis weekend only',
      'imagePath': 'assets/image/pizza.png',
      'backgroundColor': const Color(0xFF123456),
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      appBar: _customAppbar(),
      endDrawer: _customDrawer(),
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
           SizedBox(height: 24,),
           /// Categories
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
                   Get.to(()=> NearbyRestaurantScreen());
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
           SizedBox(height: 10,),
           /// near by restaurant
           SizedBox(
             height: 260,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: 5,
               separatorBuilder: (_, index) => SizedBox(width: 12),
               itemBuilder: (context, index) {
                 return SizedBox(
                   width: 265,
                     child: FoodCard());
               },
             ),
           ),
           SizedBox(height: 24,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Near By Grocery",
                 style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                     color: AppColors.textColor
                 ),),
               InkWell(
                 onTap: (){
                   Get.to(()=> NearbyGroceryScreen());
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
           SizedBox(height: 10,),
           /// Near By Grocery
           SizedBox(
             height: 260,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemCount: 5,
               separatorBuilder: (_, index) => SizedBox(width: 12),
               itemBuilder: (context, index) {
                 return SizedBox(
                     width: 265,
                     child: GroceryCard());
               },
             ),
           ),

         ],
       ),
       bottomNavigationBar: UserBottomMenu(0),
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
          onTap: () {
            Get.to(()=> NotificationScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/icons/notification.svg",
              height: 22,
              width: 22,
            ),
          ),
        ),

        const SizedBox(width: 8),

        Builder(
          builder: (context) => InkWell(
            onTap: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: Container(
              height: 36,
              width: 36,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEDEDED),
              ),
              child: const Icon(
                Icons.menu,
                color: Colors.black87,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Drawer _customDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Image.asset("assets/image/app_logo.png",width: 91,
            height: 70,),
          ),
          _customListTile(
             onTap: (){
               Get.to(()=> LanguageScreen());
             },
           title: "Language",
           icon: "assets/icons/language.svg",
           trailingIcon:  "assets/icons/arrow_right.svg"
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
              onTap: (){
                Get.to(()=> FaqScreen());
              },
              title: "FAQ",
              icon: "assets/icons/faq.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> PrivacyPolicyScreen());
            },
            title: "Privacy Policy",
            icon: "assets/icons/privacy.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> TermsAndConditionScreen());
            },
            title: "Terms & Conditions",
            icon: "assets/icons/terms.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> FeedbackScreen());
            },
            title: "Feedback",
            icon: "assets/icons/feedback.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> OrderHistoryScreen());
            },
            title: "History",
            icon: "assets/icons/history.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> WishListScreen());
            },
            title: "Wish List",
            icon: "assets/icons/favorite.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> UserProfileScreen());
            },
            title: "Profile",
            icon: "assets/icons/profile.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: (){
              Get.to(()=> SettingsScreen());
            },
            title: "Settings",
            icon: "assets/icons/setting.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          SizedBox(height: 100,),
          InkWell(
            onTap: (){
              Get.to(()=> SelectRoleScreen());
            },
            child: Container(
              width: 168,
              padding: EdgeInsets.symmetric(horizontal: 28),
              margin: EdgeInsets.only(left: 28, right: 50, bottom: 50),
              height: 54,
              decoration: BoxDecoration(
                color: Color(0xFF89B12C),
                borderRadius: BorderRadius.circular(4)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logout.svg'),
                  SizedBox(width: 8,),
                  Text('Logout',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),)
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
  Widget _customListTile({required String title, required String icon, String? trailingIcon, required Function()? onTap,}) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
      ),
      trailing: trailingIcon != null ? SvgPicture.asset(trailingIcon) : null,
    );}



  Widget _buildCarouselItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: item['backgroundColor'],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
            child: AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item['imagePath']),
                    fit: BoxFit.cover,
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

