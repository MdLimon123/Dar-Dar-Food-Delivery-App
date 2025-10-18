import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String? title;
  const CustomAppbar({super.key,  this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:Colors.white,
      elevation: 0,
      title: Text(title ?? "",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333)
      ),),
      centerTitle: true,
      leading: InkWell(
        onTap: (){
          Get.back();
        },
        child: Icon(Icons.arrow_back,color: Color(0xFF0D1C12),
          size: 20,),
      ),

    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}