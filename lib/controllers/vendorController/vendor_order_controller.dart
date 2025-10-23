import 'package:get/get.dart';

class VendorOrderController extends GetxController{

  var currentIndex = 0.obs;

  final List<String> images = [
    'assets/image/pizza2.jpg',
    'assets/image/pizza.png',
    'assets/image/burger2.png',
    'assets/image/burger.png',
  ];

  /// go to next image
  void nextImage(){
    if(currentIndex < images.length - 1){
      currentIndex++;
    }else{
      currentIndex.value = 0;
    }
  }

  /// go to previous image
void previousImage(){
    if(currentIndex > 0){
      currentIndex--;
    }else{
      currentIndex.value = images.length - 1;
    }
}

}