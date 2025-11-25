import 'dart:convert';

import 'package:dar_dar_foodd_delivery_app/models/User/cart_item.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardController extends GetxController{

 RxList<CartItem> cartItems = <CartItem>[].obs;

  /// Load cart from shared preferences
  Future<void> loadCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('cart');

    if (data != null) {
      List list = jsonDecode(data);
      cartItems.value = list.map((e) => CartItem.fromJson(e)).toList();
    }
  }

  /// Save cart to shared preferences
  Future<void> saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encoded = jsonEncode(cartItems.map((e) => e.toJson()).toList());
    await prefs.setString('cart', encoded);
  }

  /// Add to cart
  void addToCart(CartItem item) {
    int index = cartItems.indexWhere((e) => e.id == item.id);

    if (index != -1) {
      cartItems[index].quantity.value++;
    } else {
      cartItems.add(item);
    }

    saveCart();
  }

  /// Increase quantity
  void increase(int index) {
    cartItems[index].quantity.value++;
    saveCart();
  }

  /// Decrease quantity
  void decrease(int index) {
    if (cartItems[index].quantity.value > 1) {
      cartItems[index].quantity.value--;
    } else {
      cartItems.removeAt(index);
    }
    saveCart();
  }

  /// Delete item
  void removeItem(int index) {
    cartItems.removeAt(index);
    saveCart();
  }

  /// Total price
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity.value));

}