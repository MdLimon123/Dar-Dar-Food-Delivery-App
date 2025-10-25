import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:get/get.dart';

class RiderAuthController extends GetxController{
  Rx<File?> drivingImage = Rx<File?>(null);


  Future<void> pickStoreImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      drivingImage.value = pickedFile;
    }
  }

}