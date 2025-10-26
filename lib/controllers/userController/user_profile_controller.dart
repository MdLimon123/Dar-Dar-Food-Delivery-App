import 'dart:io';

import 'package:dar_dar_foodd_delivery_app/utils/image_utils.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController{

  Rx<File?> userProfileImage = Rx<File?>(null);

  Future<void> pickUserProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      userProfileImage.value = pickedFile;
    }
  }
}