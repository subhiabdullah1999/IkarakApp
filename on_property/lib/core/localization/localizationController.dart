import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/constans/appthem.dart';
import 'package:on_property/core/services/services.dart';

class LocalizationController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);

    // ignore: unrelated_type_equality_checks
    appTheme = locale == "ar" ? themArabic : themEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrifLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrifLang == "ar") {
      language = const Locale("ar");
      appTheme = themArabic;
    } else if (sharedPrifLang == "en") {
      language = const Locale("en");
      appTheme = themEnglish;
    } else {
      language = Locale("ar");
      myServices.sharedPreferences.setString("lang", "ar");
      appTheme = themEnglish;
    }

    super.onInit();
  }
}
