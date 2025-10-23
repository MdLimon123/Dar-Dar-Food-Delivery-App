import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserAuth/user_login_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserCardScreen/card_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserFoodScreen/food_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/user_home_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Splash/select_role_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserOrdersScreen/orders_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/profile_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserShopScreen/shop_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/NotificationScreen/vendor_notification_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/ProfileScreen/vendor_profile_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/TransectionScreen/transection_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorAuth/vendor_login_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Vendor/VendorHomeScreen/vendor_home_screen.dart';
import 'package:get/get.dart';
import '../views/screen/Splash/splash_screen.dart';
class AppRoutes{

  static String splashScreen="/splash_screen";
  static String selectRoleScreen = "/select_role_screen";
  static String userHomeScreen="/user_home_screen";
  static String userProfileScreen="/user_profile_screen";
  static String walletScreen="/wallet_screen";

  /// user routing
  static String userLoginScreen = "/user_login_screen";
  static String userShopScreen = "/user_shop_screen";
  static String userCartScreen = "/user_cart_screen";
  static String userOrderScreen = "/user_order_screen";
  static String userFoodScreen = "/user_food_screen";

  /// vendor routing

  static String vendorLoginScreen = "/vendor_login_screen";
  static String vendorHomeScreen = "/vendor_home_screen";
  static String vendorProfileScreen = "/vendor_profile_screen";
  static String vendorNotificationScreen = "/vendor_notification_screen";
  static String transectionScreen = "/transection_screen";



 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:userHomeScreen, page: ()=>const UserHomeScreen(),transition:Transition.noTransition),
    GetPage(name:userProfileScreen, page: ()=>const UserProfileScreen(),transition: Transition.noTransition),
    GetPage(name:selectRoleScreen, page: ()=>const SelectRoleScreen(),transition: Transition.noTransition),
    GetPage(name:userLoginScreen, page: ()=>const UserLoginScreen(),transition: Transition.noTransition),
    GetPage(name:userShopScreen, page: ()=>const ShopScreen(),transition: Transition.noTransition),
    GetPage(name:userCartScreen, page: ()=>const CardScreen(),transition: Transition.noTransition),
    GetPage(name:userOrderScreen, page: ()=>const OrdersScreen(),transition: Transition.noTransition),
    GetPage(name:userFoodScreen, page: ()=>const FoodScreen(),transition: Transition.noTransition),
   GetPage(name: vendorLoginScreen, page: ()=>const VendorLoginScreen(),transition: Transition.noTransition),
   GetPage(name: vendorHomeScreen, page: ()=>const VendorHomeScreen(),transition: Transition.noTransition),
   GetPage(name: vendorProfileScreen, page: ()=>const VendorProfileScreen(),transition: Transition.noTransition),
   GetPage(name: vendorNotificationScreen, page: ()=>const VendorNotificationScreen(),transition: Transition.noTransition),
   GetPage(name: transectionScreen, page: ()=>const TransectionScreen(),transition: Transition.noTransition),

  ];



}