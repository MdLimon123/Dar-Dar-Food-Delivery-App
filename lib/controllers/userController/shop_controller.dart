import 'package:get/get.dart';

class ShopController extends GetxController{

  RxInt quantity = 1.obs;
  double basePrice = 98.0;
  double originalPrice = 198.0;

  double get totalPrice => basePrice * quantity.value;
  double get totalOriginalPrice => originalPrice * quantity.value;

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

}