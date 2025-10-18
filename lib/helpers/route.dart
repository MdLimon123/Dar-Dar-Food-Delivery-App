import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserAuth/user_login_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/user_home_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Splash/select_role_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserProfileScreen/profile_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Wallet/wallet_screen.dart';
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


 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:userHomeScreen, page: ()=>const UserHomeScreen(),transition:Transition.noTransition),
    GetPage(name:walletScreen, page: ()=>const WalletScreen(),transition:Transition.noTransition),
    GetPage(name:userProfileScreen, page: ()=>const UserProfileScreen(),transition: Transition.noTransition),
    GetPage(name:selectRoleScreen, page: ()=>const SelectRoleScreen(),transition: Transition.noTransition),
    GetPage(name:userLoginScreen, page: ()=>const UserLoginScreen(),transition: Transition.noTransition),

  ];



}