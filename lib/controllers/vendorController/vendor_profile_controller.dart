import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:get/get.dart';

class VendorProfileController extends GetxController{

  Rx<File?> vendorProfileImage = Rx<File?>(null);

  Future<void> pickVendorProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      vendorProfileImage.value = pickedFile;
    }
  }
}