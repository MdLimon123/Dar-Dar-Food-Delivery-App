import 'package:dar_dar_foodd_delivery_app/views/screen/User/WishListScreen/AllSubScreen/grocery_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/WishListScreen/AllSubScreen/product_screen.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/WishListScreen/AllSubScreen/restaurant_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListController extends GetxController{

  var tabIndex = 0.obs;

  List<String> tabList = [
    'Restaurant',
    'Grocery',
    'Products'
  ].obs;

  List<Widget> tabSections = [
    RestaurantScreen(),
    GroceryScreen(),
    ProductScreen()
  ].obs;

  bool isTabSelected(int index){
    if(tabIndex == index){
      return true;
    }
    return false;
  }

}