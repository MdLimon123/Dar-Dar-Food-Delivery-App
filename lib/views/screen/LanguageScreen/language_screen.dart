
import 'package:dar_dar_foodd_delivery_app/controllers/localization_controller.dart';
import 'package:dar_dar_foodd_delivery_app/language/language_component.dart';
import 'package:dar_dar_foodd_delivery_app/utils/app_colors.dart';
import 'package:dar_dar_foodd_delivery_app/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppbar(
        title: "Language",
      ),
      body: GetBuilder<LocalizationController>(
          builder: (localizationController) {
            return Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.separated(
                      itemCount: LanguageComponent.languages.length,
                      itemBuilder: (context, index) => ListTile(
                        onTap: () {
                          localizationController.setLanguage(Locale(
                              LanguageComponent.languages[index].languageCode,
                              LanguageComponent.languages[index].countryCode));
                          localizationController.setSelectIndex(index);
                        },
                        trailing: Radio(
                          activeColor: AppColors.primaryColor,

                          value: LanguageComponent.languages[index].languageName,
                          groupValue: LanguageComponent.languages[localizationController.selectedIndex].languageName,
                          onChanged:(value){
                            localizationController.setLanguage(Locale(
                                LanguageComponent.languages[index].languageCode,
                                LanguageComponent.languages[index].countryCode));
                            localizationController.setSelectIndex(index);
                          },

                        ),
                        title: Text(LanguageComponent.languages[index].languageName),
                      ),
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox();
                      }
                  ),
                ),
              ],
            );
          }),
    );
  }
}