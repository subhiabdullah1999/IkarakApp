import 'package:get/get.dart';
import 'package:on_property/core/services/services.dart';

translationData(nameAr, nameEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return nameAr;
  } else {
    return nameEn;
  }
}
