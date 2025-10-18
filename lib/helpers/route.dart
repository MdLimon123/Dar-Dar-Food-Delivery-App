import 'package:dar_dar_foodd_delivery_app/views/screen/Home/home_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Profile/profile_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Splash/select_role_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/Wallet/wallet_screen.dart';
import 'package:get/get.dart';
import '../views/screen/Splash/splash_screen.dart';
class AppRoutes{

  static String splashScreen="/splash_screen";
  static String selectRoleScreen = "/select_role_screen";
  static String homeScreen="/home_screen";
  static String profileScreen="/profile_screen";
  static String walletScreen="/wallet_screen";

 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:homeScreen, page: ()=>const HomeScreen(),transition:Transition.noTransition),
    GetPage(name:walletScreen, page: ()=>const WalletScreen(),transition:Transition.noTransition),
    GetPage(name:profileScreen, page: ()=>const ProfileScreen(),transition: Transition.noTransition),
    GetPage(name:selectRoleScreen, page: ()=>const SelectRoleScreen(),transition: Transition.noTransition),

  ];



}