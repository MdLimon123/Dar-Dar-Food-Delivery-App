import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:get/get.dart';

class RiderProfileController extends GetxController{

  Rx<File?> riderProfileImage = Rx<File?>(null);

  Future<void> pickRiderProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      riderProfileImage.value = pickedFile;
    }
  }

}


