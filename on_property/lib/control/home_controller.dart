import 'dart:convert';

import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/data/models/rent_prop_mode.dart';
import 'package:http/http.dart' as http;

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  List<rentProp> data = [];
  List<String> imagePaths = [];
  StatusRequest statusRequest = StatusRequest.none;
  int ProdId = 0;
  String label = "Buy";
  int? indexListtypeprop;
  int indexTypeProp = 0;
  int indexTypePropdata = 1;
  List<String> salePrope = [
    "Apartments".tr,
    "Lands".tr,
    "Shops".tr,
    "Warehouses".tr,
    "Chalets".tr,
    "Villas".tr
  ];
  List<bool> listFavor = [];

  updateUi() {
    update();
  }

  Future<List<rentProp>> getSaletPrp() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http
          .get(Uri.parse(AppLinks.saleProp + indexTypePropdata.toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        data.clear();

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          update();
        }

        update();

        for (var i = 0; i < data.length; i++) {
          listFavor.add(false);
          ;
          update();
        }

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

  changeValueFavorit(int i) {
    listFavor[i] = !listFavor[i];
    update();
  }

  Future<List<rentProp>> getRentPrp() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http
          .get(Uri.parse(AppLinks.rentProp + indexTypePropdata.toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        data.clear();

        statusRequest = StatusRequest.success;

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          update();
        }

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

  Future<List<rentProp>> getInversPrp() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http
          .get(Uri.parse(AppLinks.inversProp + indexTypePropdata.toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        data.clear();

        statusRequest = StatusRequest.success;

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          update();
        }

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

  forBuy() {
    label = "Buy";
    indexTypeProp = 1;
    update();
  }

  forRant() {
    indexTypeProp = 2;
    label = "Rant";
    update();
  }

  forInv() {
    indexTypeProp = 3;
    label = "Inv";
    update();
  }

  @override
  void onInit() {
    // getSaletPrp();
    indexTypeProp = 0;
    super.onInit();
  }
}
