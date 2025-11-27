import 'package:carousel_slider/carousel_slider.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/data_controller.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/userController/home_controller.dart';
import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/helpers/prefs_helper.dart';
import 'package:dar_dar_foodd_delivery_app/helpers/route.dart';
import 'package:dar_dar_foodd_delivery_app/models/User/banner_model.dart';
import 'package:dar_dar_foodd_delivery_app/services/api_constant.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_constants.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/_custom_food_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/bottom_menu..dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_loading.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_network_image.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/LanguageScreen/language_screen.dart';
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

  final _dataController = Get.put(DataController());

  final _homeController = Get.put(HomeController());
  final _profileController = Get.put(UserProfileController());

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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dataController.getData();
      _homeController.fetchCategory();
      _homeController.fetchAllNearbyRestaurant();
      _homeController.fetchAllGrocery();
      _profileController.fetchUserInfo();
      _homeController.fetchAllBanner();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F5),
      appBar: _customAppbar(),
      endDrawer: _customDrawer(),

      body: Obx(
        () => _homeController.isLaoding.value
            ? Center(child: CustomLoading())
            : ListView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                children: [
                  CustomTextField(
                    controller: searchTextController,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SvgPicture.asset("assets/icons/search.svg"),
                    ),
                    hintText: "Search here....",
                  ),
                  SizedBox(height: 24),

                  /// Carousel slider
                  CarouselSlider.builder(
                    itemCount: _homeController.bannerList.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                          return _buildCarouselItem(
                            _homeController.bannerList[index],
                          );
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
                    children: _homeController.bannerList.map((url) {
                      int index = _homeController.bannerList.indexOf(url);
                      return Container(
                        width: 12.0,
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
                  SizedBox(height: 24),

                  /// Categories
                  SizedBox(
                    height: 97,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 12);
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: _homeController.allCategoryList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final category = _homeController.allCategoryList[index];
                        return Container(
                          width: 86,
                          height: 97,
                          decoration: BoxDecoration(
                            color: Color(0xFFDEECBF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "${ApiConstant.imageBaseUrl}${category.image}",
                                height: 57,
                                width: 57,
                              ),
                              SizedBox(height: 2),
                              Text(
                                category.name,
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

                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Near By Restaurant",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => NearbyRestaurantScreen());
                        },
                        child: Text(
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
                  SizedBox(height: 10),

                  Obx(() {
                    if (_homeController.allNearbyRestaurantList.isEmpty) {
                      return SizedBox(
                        height: 260,
                        child: Center(child: Text("No restaurants found")),
                      );
                    }

                    return SizedBox(
                      height: 260,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            _homeController.allNearbyRestaurantList.length,
                        separatorBuilder: (_, index) => SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 265,
                            child: FoodCard(
                              onTap: () {},
                              allNearbyRestaurantModel: _homeController
                                  .allNearbyRestaurantList[index],
                            ),
                          );
                        },
                      ),
                    );
                  }),

                  SizedBox(height: 24),
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
                          Get.to(() => NearbyGroceryScreen());
                        },
                        child: Text(
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
                  SizedBox(height: 10),

                  /// Near By Grocery
                  SizedBox(
                    height: 260,
                    child: Obx(() {
                      if (_homeController.allGroceryDataList.isEmpty) {
                        return Center(child: Text("No shops available"));
                      }

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _homeController.allGroceryDataList.length,
                        separatorBuilder: (_, index) => SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 265,
                            child: GroceryCard(
                              onTap: () {
                                // Handle tap event here
                              },
                              shopData:
                                  _homeController.allGroceryDataList[index],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
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
          ///
          Obx(
            () => CustomNetworkImage(
              imageUrl:
                  "${ApiConstant.imageBaseUrl}${_profileController.userInfo.value.image}",
              height: 44,
              boxShape: BoxShape.circle,
              width: 44,
            ),
          ),

          const SizedBox(width: 8),

          /// Name + Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    _profileController.userInfo.value.fullName ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3A3A35),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    Obx(
                      () => Expanded(
                        child: Text(
                          _profileController.userInfo.value.currentAddress ??
                              "",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF3A3A35),
                          ),
                          overflow: TextOverflow.ellipsis,
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

      actions: [
        /// Notification icon
        InkWell(
          onTap: () {
            Get.to(() => NotificationScreen());
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
              child: const Icon(Icons.menu, color: Colors.black87, size: 20),
            ),
          ),
        ),
      ],
    );
  }

  /// google api key
  /// AIzaSyDNgiiIj_2_L6IHDymfGvVzOA9Jz-iFeA4

  Drawer _customDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.textColor),
            child: Image.asset(
              "assets/image/app_logo.png",
              width: 91,
              height: 70,
            ),
          ),
          _customListTile(
            onTap: () {
              Get.to(() => LanguageScreen());
            },
            title: "Language",
            icon: "assets/icons/language.svg",
            trailingIcon: "assets/icons/arrow_right.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => FaqScreen());
            },
            title: "FAQ",
            icon: "assets/icons/faq.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => PrivacyPolicyScreen());
            },
            title: "Privacy Policy",
            icon: "assets/icons/privacy.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => TermsAndConditionScreen());
            },
            title: "Terms & Conditions",
            icon: "assets/icons/terms.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => FeedbackScreen());
            },
            title: "Feedback",
            icon: "assets/icons/feedback.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => OrderHistoryScreen());
            },
            title: "History",
            icon: "assets/icons/history.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => WishListScreen());
            },
            title: "Wish List",
            icon: "assets/icons/favorite.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => UserProfileScreen());
            },
            title: "Profile",
            icon: "assets/icons/profile.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          _customListTile(
            onTap: () {
              Get.to(() => SettingsScreen());
            },
            title: "Settings",
            icon: "assets/icons/setting.svg",
          ),
          Divider(color: Color(0xFFE1E1E1)),
          SizedBox(height: 100),

          InkWell(
            onTap: () async {
              await PrefsHelper.remove(AppConstants.bearerToken);
              await PrefsHelper.remove("id");
              await PrefsHelper.remove("role");

              Get.offAllNamed(AppRoutes.selectRoleScreen);
            },
            child: Container(
              width: 168,
              padding: EdgeInsets.symmetric(horizontal: 28),
              margin: EdgeInsets.only(left: 28, right: 50, bottom: 50),
              height: 54,
              decoration: BoxDecoration(
                color: Color(0xFF89B12C),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logout.svg'),
                  SizedBox(width: 8),
                  Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customListTile({
    required String title,
    required String icon,
    String? trailingIcon,
    required Function()? onTap,
  }) {
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
    );
  }

  Widget _buildCarouselItem(BannerData banner) {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage("${ApiConstant.imageBaseUrl}${banner.image}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
