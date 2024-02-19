import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:on_property/data/models/prop_user_id_model.dart';
import 'package:on_property/widgets/loading.dart';

abstract class ProfileController extends GetxController {}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();

  List<Tab> tabs = [
    Tab(
      text: "Acceptable properties".tr,
    ),
    Tab(
      text: "Properties are under review".tr,
    ),
    Tab(
      text: "Rejected properties".tr,
    )
  ];

  List<ProfileModel> data = [];
  List<PropUserIdModel> dataPropUserId = [];
  List<PropUserIdModel> dataPropUserIdAprov = [];
  List<PropUserIdModel> dataPropUserIdReview = [];
  List<PropUserIdModel> dataPropUserIdfalied = [];

  List<bool> listFavor = [];
  int ProdId = 0;

  StatusRequest statusRequest = StatusRequest.none;

  Future<List<ProfileModel>> getProfileData() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(AppLinks.getProfile +
          myServices.sharedPreferences.get("id").toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        update();
        data.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);

        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

        for (var item in responseBody) {
          data.add(ProfileModel.fromJson(item));
          update();
        }
        update();
        print("stshtttttttttttttttttttttttuuuuuuuuuuuu");
        print(data);
        print("stshtttttttttttttttttttttttuuuuuuuuuuuu");

        return data;
      } else {
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        print(response.statusCode);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      }
    } else {
      print("***********no enternet***********");
    }
    update();

    return data;
  }

  Future<List<PropUserIdModel>> getProdUserId() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(AppLinks.getPropUserId +
          myServices.sharedPreferences.get("id").toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        dataPropUserId.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

        for (var item in responseBody) {
          dataPropUserId.add(PropUserIdModel.fromJson(item));

          update();
        }
        for (var i = 0; i < dataPropUserId.length; i++) {
          listFavor.add(false);
          ;
          update();
        }
        update();
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssssxxxxxxxxxxxxxxx");

        for (var i = 0; i < dataPropUserId.length; i++) {
          if (dataPropUserId[i].status == 1) {
            dataPropUserIdAprov.add(dataPropUserId[i]);
          }
        }

        for (var i = 0; i < dataPropUserId.length; i++) {
          if (dataPropUserId[i].status == 0) {
            dataPropUserIdfalied.add(dataPropUserId[i]);
          }
        }

        for (var i = 0; i < dataPropUserId.length; i++) {
          if (dataPropUserId[i].status == 2) {
            dataPropUserIdReview.add(dataPropUserId[i]);
          }
        }
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssssxxxxxxxxxxxxxxx");
        print(dataPropUserIdAprov);
        print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssssxxxxxxxxxxxxxxx");

        return dataPropUserId;
      } else {
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        print(response.statusCode);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      }
    } else {
      print("***********no enternet***********");
    }
    update();

    return dataPropUserId;
  }

  changeValueFavorit(int i) {
    listFavor[i] = !listFavor[i];
    update();
  }

  popDeletCard() {
    Get.defaultDialog(
      titlePadding: const EdgeInsets.all(10),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      title: "waring".tr,
      backgroundColor: AppColors.whiteColor,
      content: Text("Do you want to delete the property?".tr),
      confirm: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ElevatedButton(
            onPressed: () {
              DeletProp();
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

  Future<List> DeletProp() async {
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
      var response = await http.post(Uri.parse(AppLinks.deletProp), body: {
        "user_id": myServices.sharedPreferences.get("id"),
        "property_id": ProdId.toString()
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        print("yyyuuuuuuuu8777777777777thhh");
        print(ProdId);
        print(myServices.sharedPreferences.get("id"));
        print("sjjjjjjjjjjjjjjjjjjj8276666661999999999999999999");
        statusRequest = StatusRequest.success;
        update();
        var responseBody = jsonDecode(response.body);
        if (responseBody["message"] == "Delete  successful!") {
          print(
              "sjjjjjjjjjjjjjjjjjjj8276666661999999999999nnnnnnmmmmmmmmmmmmmmmmmkoooo");

          Get.rawSnackbar(
              backgroundColor: AppColors.green,
              title: "success".tr,
              messageText: Text(
                "The property has been successfully deleted".tr,
                style: TextStyle(color: AppColors.whiteColor),
              ),
              borderColor: AppColors.oraColor,
              borderWidth: 2,
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 80));
          update();
          getProdUserId();
          update();
        }

        update();
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

  @override
  void onInit() {
    getProfileData();
    getProdUserId();
    super.onInit();
  }
}
