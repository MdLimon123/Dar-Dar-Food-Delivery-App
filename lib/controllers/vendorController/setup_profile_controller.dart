
import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:get/get.dart';

class SetupProfileController extends GetxController{

  Rx<File?> storeImage = Rx<File?>(null);

  Rx<File?> licenseImage = Rx<File?>(null);

  Future<void> pickStoreImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      storeImage.value = pickedFile;
    }
  }

  Future<void> pickLicenseImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      licenseImage.value = pickedFile;
    }
  }

}