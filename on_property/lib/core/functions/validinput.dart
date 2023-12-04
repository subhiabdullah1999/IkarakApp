import 'dart:math';

import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "valid_username".tr;
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "valid_email".tr;
    }
  }

  if (val.isEmpty) {
    return "valid_empte".tr;
  }

  if (val.length < min) {
    return "${"valid_min".tr}$min";
  }

  if (val.length > max) {
    return "${"valid_max".tr}$max";
  }
}
