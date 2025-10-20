import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllPopularCategoriesScreen extends StatefulWidget {
  const AllPopularCategoriesScreen({super.key});

  @override
  State<AllPopularCategoriesScreen> createState() => _AllPopularCategoriesScreenState();
}

class _AllPopularCategoriesScreenState extends State<AllPopularCategoriesScreen> {

  final searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "All Categories",),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          CustomTextField(
            controller: searchTextController,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset("assets/icons/search.svg"),
            ),
            hintText: "Search here....",
          ),
          const SizedBox(height: 16),

          GridView.builder(
            itemCount: 12,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index){
              return Column(
                children: [
                  Container(
                    height: 51,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(image: AssetImage('assets/image/vagetables.png')),
                      boxShadow: [
                        BoxShadow(
                          color:Colors.black.withValues(alpha: 0.25),
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        )
                      ]
                    ),

                  ),
                  SizedBox(height: 8,),
                  Text("Fruits",
                  style: TextStyle(
                    color: Color(0xFF929394),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),)
                ],
              );
              })

        ],
      ),
    );
  }
}
