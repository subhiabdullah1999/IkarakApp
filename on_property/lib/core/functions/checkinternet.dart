import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/core/constans/appColors.dart';

checkInterNet() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print("****************network****************");
      print("نجح الاتصال بالانترنت");
      return true;
    }
  } on SocketException catch (_) {
    print("****************network****************");
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
  }

  return false;
}
