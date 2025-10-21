import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Edit Address"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Text("Name"),
          SizedBox(height: 15),
          CustomTextField(hintText: "Write your name"),
          SizedBox(height: 12),
          Text("Contact No"),
          SizedBox(height: 15),
          CustomTextField(hintText: "+99"),
          Text("Delivery Address"),
          SizedBox(height: 12),
          CustomTextField(hintText: "Write your address", maxLine: 4),
          SizedBox(height: 249),
          CustomButton(onTap: () {

          }, text: "Confirm"),
        ],
      ),
    );
  }
}
