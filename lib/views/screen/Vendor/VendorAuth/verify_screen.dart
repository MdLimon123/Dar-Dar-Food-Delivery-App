import 'package:dar_dar_foodd_delivery_app/controllers/vendorController/vendor_auth_controller.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_button.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _vendorAuthController = Get.put(VendorAuthController());
  final _formKey = GlobalKey<FormState>();

  final storeNameController = TextEditingController();

  final storeTypeController = TextEditingController();

  final accountNameController = TextEditingController();

  final accountNumberController = TextEditingController();

  final bankNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Verify"),

      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            Text(
              "Store Info :",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF855BBB),
              ),
            ),
            SizedBox(height: 12),
            _headingText(title: "Store Name"),
            SizedBox(height: 12),
            CustomTextField(
              controller: storeNameController,
              hintText: 'Enter store name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter store name';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            _headingText(title: "Store Type"),
            SizedBox(height: 12),
            CustomTextField(
              controller: storeTypeController,
              hintText: 'Enter store type',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter store type';
                }
                return null;
              },
            ),

            SizedBox(height: 24),
            _headingText(title: "Store Image"),
            SizedBox(height: 12),

            Obx(() {
              final file = _vendorAuthController.storeImage.value;
              return InkWell(
                onTap: () {
                  _vendorAuthController.pickStoreImage(fromCamera: false);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (file == null) ...[
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/icons/default_image.svg",
                          ),
                        ),

                        Text(
                          "Image",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFC0C0C0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ] else ...[
                        Image.file(
                          file,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 24),
            _headingText(title: "Store License"),
            SizedBox(height: 12),
            Obx(() {
              final file = _vendorAuthController.licenseImage.value;
              return InkWell(
                onTap: () {
                  _vendorAuthController.pickLicenseImage(fromCamera: false);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (file == null) ...[
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SvgPicture.asset(
                            "assets/icons/default_image.svg",
                          ),
                        ),

                        Text(
                          "Image",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFC0C0C0),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ] else ...[
                        Image.file(
                          file,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 150,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 24),
            Text(
              "Bank Info :",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF855BBB),
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Bank Account Name",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 12),
            CustomTextField(
              controller: accountNameController,
              hintText: "Account Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter account name';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            _headingText(title: "Bank Account Number"),
            SizedBox(height: 12),
            CustomTextField(
              controller: accountNumberController,
              hintText: "Account Number",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter account number';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            _headingText(title: "Bank Name"),
            SizedBox(height: 12),
            CustomTextField(
              controller: bankNameController,
              hintText: "Bank Name",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter bank name';
                }
                return null;
              },
            ),
            SizedBox(height: 24),
            // _headingText(title: "Payment Method Preferences"),
            // SizedBox(height: 12),
            // CustomTextField(hintText: "Payment Method Preferences"),
            SizedBox(height: 24),

            Obx(
              () => CustomButton(
                loading: _vendorAuthController.isSetupLoading.value,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _vendorAuthController.setupProfile(
                      storeName: storeNameController.text.trim(),
                      storeType: storeTypeController.text.trim(),
                      storeImage:
                          _vendorAuthController.storeImage.value?.path ?? '',
                      storeLicense:
                          _vendorAuthController.licenseImage.value?.path ?? '',
                      bankAccountName: accountNameController.text.trim(),
                      bankAccountNumber: accountNumberController.text.trim(),
                      bankName: bankNameController.text.trim(),
                    );
                  }
                },
                text: "Submit",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _headingText({required String title}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    );
  }
}
