import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/sign_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:on_property/screens/dashboard.dart';
import 'package:on_property/screens/sign_in.dart';
import 'package:on_property/widgets/loading.dart';

abstract class SignInController extends GetxController {}

class SignInControllerImp extends SignInController {
  GlobalKey<FormState> formstateSignIn = GlobalKey<FormState>();
  MyServices myServices = Get.find();

  late TextEditingController phoneNumber;
  late TextEditingController password;
  bool isShowwPassword = true;

  List<SignInModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  updateUi() {
    update();
  }

  showPassword() {
    isShowwPassword = isShowwPassword == false ? true : false;
    update();
  }

  signInVisit() {
    Get.off(() => DashBoard());
    myServices.sharedPreferences.setBool("visit", true);
  }

  Future<List<SignInModel>> logInUser() async {
    var formdata = formstateSignIn.currentState;

    if (formdata!.validate()) {
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
        var response = await http.post(Uri.parse(AppLinks.login),
            body: {"mobile": phoneNumber.text, "password": password.text});
        if (response.statusCode == 200 || response.statusCode == 201) {
          statusRequest = StatusRequest.success;
          Get.rawSnackbar(
              backgroundColor: AppColors.green,
              title: "success".tr,
              messageText: Text(
                "You have been logged in successfully".tr,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              borderColor: AppColors.oraColor,
              borderWidth: 2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
          update();

          Get.offAll(() => DashBoard());

          // data.clear();

          var responseBody = jsonDecode(response.body);
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
          print(myServices.sharedPreferences.get("id"));
          print("gggffffffffffddddddddddddddddddddd,,,,,,,,,,,,,,,");

          return data;
        } else {
          if (response.statusCode == 401) {
            Get.back();
            update();
            Get.defaultDialog(
              titlePadding: const EdgeInsets.all(10),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              title: "waring".tr,
              backgroundColor: AppColors.whiteColor,
              content: Text("phone_or_pass_error".tr),
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
          } else {
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
    }

    update();

    return data;
  }

  @override
  void onInit() {
    password = TextEditingController();
    phoneNumber = TextEditingController();

    checkInterNet();

    super.onInit();
  }
}
