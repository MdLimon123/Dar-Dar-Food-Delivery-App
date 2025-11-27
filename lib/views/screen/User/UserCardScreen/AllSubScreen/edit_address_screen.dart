import 'package:dar_dar_foodd_delivery_app/controllers/userController/user_profile_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAddressScreen extends StatefulWidget {
  final String currentAddress;

  const EditAddressScreen({super.key, required this.currentAddress});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final TextEditingController addressController = TextEditingController();
  final _profileController = Get.put(UserProfileController());

  @override
  void initState() {
    super.initState();
    _profileController.locationController.text = widget.currentAddress;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Edit Address"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          // Text("Name"),
          // SizedBox(height: 15),
          // CustomTextField(hintText: "Write your name"),
          // SizedBox(height: 12),
          // Text("Contact No"),
          // SizedBox(height: 15),
          // CustomTextField(hintText: "+99"),
          Text("Delivery Address"),
          SizedBox(height: 12),

          Obx(() {
            return Column(
              children: [
                TextField(
                  maxLines: 4,
                  controller: _profileController.locationController,
                  onChanged: (value) {
                    _profileController.fetchLocationSuggestions(value);
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                    ),

                    fillColor: Color(0xFFFEFEFE),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(color: Color(0xFFEBEBEB)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    hintText: 'Enter Location',
                    hintStyle: TextStyle(
                      color: const Color(0xFF545454),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (_profileController.locationLoading.value)
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                if (_profileController.locationSuggestions.isNotEmpty)
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ListView.builder(
                      itemCount: _profileController.locationSuggestions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            _profileController.locationSuggestions[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF000000),
                            ),
                          ),
                          onTap: () {
                            _profileController.selectedLocation(
                              _profileController.locationSuggestions[index],
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            );
          }),

          SizedBox(height: 249),
          Obx(
            () => CustomButton(
              loading: _profileController.updateProfileLoading.value,
              onTap: () {
                _profileController.updateAddress(
                  currentAddress: addressController.text,
                );
              },
              text: "Confirm",
            ),
          ),
        ],
      ),
    );
  }
}
