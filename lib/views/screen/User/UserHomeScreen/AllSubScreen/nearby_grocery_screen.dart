import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_grocery_card.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:dar_dar_foodd_delivery_app/views/screen/User/UserHomeScreen/AllSubScreen/popular_grocery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NearbyGroceryScreen extends StatefulWidget {
  const NearbyGroceryScreen({super.key});

  @override
  State<NearbyGroceryScreen> createState() => _NearbyGroceryScreenState();
}

class _NearbyGroceryScreenState extends State<NearbyGroceryScreen> {
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Near By Grocery",),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          children: [
            CustomTextField(
              controller: searchTextController,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset("assets/icons/search.svg"),
              ),
              hintText: "Search here....",),
            SizedBox(height: 24,),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (_, index) => SizedBox(width: 12),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(()=> PopularGroceryScreen());
                    },
                    child: SizedBox(
                        width: 265,
                        child: GroceryCard()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
