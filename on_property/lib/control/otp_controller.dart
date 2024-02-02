import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/otp_model.dart';
import 'package:on_property/data/models/sign_up_model.dart';
import 'package:on_property/screens/dashboard.dart';
import 'package:on_property/widgets/loading.dart';
import 'package:http/http.dart' as http;

abstract class OtpController extends GetxController {}

class OtpControllerImp extends OtpController {
  MyServices myServices = Get.find();

  List<OtpModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  String? otp;

  goToDashboard() {
    Get.offAllNamed("Dashboard");
  }

  Future<List<OtpModel>> VerfCode() async {
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
      print("fhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
      print(otp);
      print("rtryudhchbbbbbxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

      update();
      var response = await http.post(Uri.parse(AppLinks.otpCode), body: {
        "otp": otp,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        var responseBody = jsonDecode(response.body);
        if (responseBody["message"] == "Verification successful!") {
          Get.rawSnackbar(
              backgroundColor: AppColors.green,
              title: "success".tr,
              messageText: Text(
                "Account successfully created".tr,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              borderColor: AppColors.oraColor,
              borderWidth: 2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
          update();

          Get.offAll(() => DashBoard(
                page: 0,
              ));

          // data.clear();

          myServices.sharedPreferences
              .setString("id", responseBody['user']['id'].toString());
          myServices.sharedPreferences
              .setString("email", responseBody['user']['email'].toString());
          myServices.sharedPreferences
              .setString("mobile", responseBody['user']['mobile'].toString());
          myServices.sharedPreferences
              .setString("fname", responseBody['user']['f_name'].toString());
          myServices.sharedPreferences
              .setString("lname", responseBody['user']['l_name'].toString());

          print("gggffffffffffddddddddddddddddddddd,,,,,,,,,,,,,,,");
          print(myServices.sharedPreferences.get("otp"));
          print(myServices.sharedPreferences.get("id"));

          print("gggffffffffffddddddddddddddddddddd,,,,,,,,,,,,,,,");
        } else {
          Get.rawSnackbar(
              backgroundColor: AppColors.green,
              title: "waring".tr,
              messageText: Text(
                "Account successfully created".tr,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              borderColor: AppColors.oraColor,
              borderWidth: 2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
          update();
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
