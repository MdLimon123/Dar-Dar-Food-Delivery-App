import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(
        title: "Feedback",
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _customText(
            title: "Name"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Enter your name",
          ),
          SizedBox(height: 24,),
          _customText(
              title: "Description"
          ),
          SizedBox(height: 12,),
          CustomTextField(
            hintText: "Enter your description",
            maxLine: 5,
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xFF89B12C),
                  width: 1)
                ),
                child: Center(
                  child: Text("Cancel",
                  style: TextStyle(
                    color: Color(0xFF96C330),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),),
                ),
              ),
              SizedBox(width: 16,),
              Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFF89B12C),
                    borderRadius: BorderRadius.circular(8),

                ),
                child: Center(
                  child: Text("Submit",
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),),
                ),
              )
            ],
          )


        ],
      ),
    );
  }

  Widget _customText({required String title}) {
    return Text(title,
        style: TextStyle(
          color: Color(0xFF555656),
          fontSize: 14,
          fontWeight: FontWeight.w400
        ),);
  }
}
