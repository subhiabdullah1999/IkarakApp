import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/constans/appthem.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

class LocalizationController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  Locale? language;
  List<ProfileModel> dataProfile = [];
  int cridetNumber = 0;

  ThemeData appTheme = themEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);

    // ignore: unrelated_type_equality_checks
    appTheme = locale == "ar" ? themArabic : themEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  Future<List<ProfileModel>> getProfileData() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(AppLinks.getProfile +
          myServices.sharedPreferences.get("id").toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        update();
        dataProfile.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);

        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

        for (var item in responseBody) {
          dataProfile.add(ProfileModel.fromJson(item));
          update();
        }
        cridetNumber = dataProfile[0].cridetNumber!;
        update();
        print("stshtttttttttttttttttttttttuuuuuuuuuuuu");
        print(dataProfile[0].id);
        print(dataProfile);
        print(cridetNumber);

        print("stshtttttttttttttttttttttttuuuuuuuuuuuu");

        return dataProfile;
      } else {
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        print(response.statusCode);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      }
    } else {
      print("***********no enternet***********");
    }
    update();

    return dataProfile;
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
    getProfileData();

    super.onInit();
  }
}
