import 'package:My_Meal_on/core/constans/appthem.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

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

  requestPermessinLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Get.snackbar("notification".tr, "permession Location".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("notification".tr,
            "Please give the site permission for the application".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar(
          "notification".tr,
          "The application cannot be used without enabling the location permission until the food reaches your address"
              .tr);
    }
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
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themEnglish;
    }
    requestPermessinLocation();

    super.onInit();
  }
}
