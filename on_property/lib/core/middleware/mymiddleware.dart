import 'package:My_Meal_on/core/constans/appNameRouts.dart';
import 'package:My_Meal_on/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoutsName.homebuttonApbar);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoutsName.login);
    }
  }
}
