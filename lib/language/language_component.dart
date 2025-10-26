import 'package:dar_dar_foodd_delivery_app/models/language_model.dart';

class LanguageComponent {
  static const String COUNTRY_CODE = "country_code";
  static const String LANGUAGE_CODE = "language_code";

  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: "English", languageCode: "en", countryCode: "US"),
    LanguageModel(languageName: "Arabic", languageCode: "ar", countryCode: "AR")
  ];
}