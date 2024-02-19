import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/screens/sign_in.dart';
import 'package:on_property/widgets/loading.dart';
import 'package:http/http.dart' as http;

abstract class SettingsController extends GetxController {}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();

  List data = [];
  StatusRequest statusRequest = StatusRequest.none;
  popDeletAccount() {
    Get.defaultDialog(
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      title: "waring".tr,
      backgroundColor: AppColors.whiteColor,
      content: Text("Do you want to delete your account?".tr),
      confirm: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
            onPressed: () {
              deletAccount();
              Get.back(canPop: false);
            },
            child: Text("delete".tr)),
      ),
      cancel: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
            onPressed: () {
              Get.back(canPop: false);
            },
            child: Text("back".tr)),
      ),
    );
  }

  Future<List> deletAccount() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      Get.defaultDialog(
        titlePadding: const EdgeInsets.all(10),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        title: "Loading".tr,
        backgroundColor: AppColors.whiteColor,
        content: Loading(),
      );

      update();
      var response = await http.post(Uri.parse(AppLinks.deletAccount), body: {
        "user_id": myServices.sharedPreferences.get("id"),
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("sjjjjjjjjjjjjjjjjjjj8276666661999999999999999999");
        statusRequest = StatusRequest.success;
        var responseBody = jsonDecode(response.body);
        if (responseBody["message"] == "Delete  successful!") {
          print("sjjjjjjjjjjjjjjjjjjj8276666661999999999999999999");

          Get.rawSnackbar(
              backgroundColor: AppColors.green,
              title: "success".tr,
              messageText: Text(
                "The account has been successfully deleted".tr,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              borderColor: AppColors.oraColor,
              borderWidth: 2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
          update();

          Get.offAll(() => SignIn());

          // data.clear();
          myServices.sharedPreferences.clear();
        } else if (responseBody["message"] == "User Not Found!") {
          Get.back();
          Get.rawSnackbar(
              backgroundColor: Colors.red,
              title: "waring".tr,
              messageText: Text(
                "Account not found".tr,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              borderColor: AppColors.oraColor,
              borderWidth: 2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
        }

        return data;
      } else {
        {
          Get.back();

          Get.defaultDialog(
            titlePadding: const EdgeInsets.all(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            title: "waring".tr,
            backgroundColor: AppColors.whiteColor,
            content: Text("An unexpected error occurred".tr),
            confirm: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Get.back(canPop: false);
                  },
                  child: Text("ok".tr)),
            ),
          );
          update();
        }
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        print(response.statusCode);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      }
    } else {
      print("***********no enternet***********");
      Get.rawSnackbar(
          backgroundColor: AppColors.redcolor,
          title: "waring".tr,
          messageText: Text(
            "Check your internet connection".tr,
            style: TextStyle(color: AppColors.whiteColor),
          ),
          borderColor: AppColors.oraColor,
          borderWidth: 2,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
      update();
    }
    update();

    update();

    return data;
  }
}
