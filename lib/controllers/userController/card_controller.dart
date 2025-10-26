import 'package:get/get.dart';

class CardController extends GetxController{


  RxInt quantity = 1.obs;
  double basePrice = 98.0;


  double get totalPrice => basePrice * quantity.value;


  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

}