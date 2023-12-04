import 'package:My_Meal_on/core/services/services.dart';
import 'package:get/get.dart';

translationData(nameAr, nameEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return nameAr;
  } else {
    return nameEn;
  }
}
