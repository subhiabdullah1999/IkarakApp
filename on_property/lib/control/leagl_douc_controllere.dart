import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LeagleDocumentsCointroller extends GetxController {}

class LeagleDocumentsCointrollerImp extends LeagleDocumentsCointroller {
  int? pdfId;
  List<Tab> tabs = [
    Tab(
      text: "Company registration certificate with Finance".tr,
    ),
    Tab(
      text: "Blackgold Lawyer Business Card".tr,
    ),
  ];

  updateUi() {
    update();
  }

  GotoBack() {
    Get.back();
  }
}
