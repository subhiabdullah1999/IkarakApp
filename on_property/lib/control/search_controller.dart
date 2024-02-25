import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/data/models/city_state_model.dart';
import 'package:on_property/data/models/search_model.dart';
import 'package:on_property/data/models/state_model.dart';
import 'package:on_property/screens/search_values.dart';

abstract class SearchController extends GetxController {}

class SearchControllerImp extends SearchController {
  TextEditingController? serchValue;
  StatusRequest statusRequest = StatusRequest.none;
  int category_id = 1;
  int sub_category_id = 1;
  String typeProp = "sale";
  int? indexState = 1;
  int? indexCity = 1;
  int i = 0;
  int iii = 0;
  List<StateModel> data = [];
  List<CityStateModel> dataCity = [];
  List<String> salePrope = [
    "Apartments".tr,
    "Lands".tr,
    "Shops".tr,
    "Warehouses".tr,
    "Chalets".tr,
    "Villas".tr
  ];
  int selectedProp = 0;

  List<dynamic> dataNameState = [];
  List<dynamic> dataNameStateCity = [];

  List<SearchDataModel> dataSearch = [];

  updatUi() {
    update();
  }

  Future<List<SearchDataModel>> getSearchData() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(
          "https://ikarak.ibits-ltd.me/api/properties/search?name=%D9%85%D8%B2%D8%B1%D8%B9%D8%A9"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        dataSearch.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        List databody = responseBody["data"];
        print("999999999999999999999999999999933333333333333333333333333");
        print(databody);
        print("999999999999999999999999999999933333333333333333333333333");

        for (var item in databody) {
          dataSearch.add(SearchDataModel.fromJson(item));
          print("UUUUUUUUIIIIIIIIIIIIOOOOOOOOOOOOOOOOOOOOO");
          print(dataSearch);
          print("UUUUUUUUIIIIIIIIIIIIOOOOOOOOOOOOOOOOOOOOO");
          update();
        }
        update();
        return dataSearch;
      } else {
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        print(response.statusCode);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      }
    } else {
      print("***********no enternet***********");
    }
    update();

    return dataSearch;
  }

  Future<List<StateModel>> getStateData() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(AppLinks.state));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        data.clear();
        dataNameState.clear();

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          data.add(StateModel.fromJson(item));

          update();
        }

        addStateNameToList();

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

  Future<List<CityStateModel>> getStateCityData() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(
          Uri.parse("https://ikarak.ibits-ltd.me/api/city/state/$indexState"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        dataCity.clear();
        dataNameState.clear();

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          dataCity.add(CityStateModel.fromJson(item));

          update();
        }

        addStateCityNameToList();

        return dataCity;
      } else {
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        print(response.statusCode);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      }
    } else {
      print("***********no enternet***********");
    }
    update();

    return dataCity;
  }

  addStateNameToList() {
    for (var i = 0; i < data.length; i++) {
      dataNameState.add(data[i].name!);
    }

    update();
    return dataNameState;
  }

  addStateCityNameToList() {
    for (var i = 0; i < dataCity.length; i++) {
      dataNameStateCity.add(dataCity[i].name!);
    }

    update();
    return dataNameStateCity;
  }

  goToResultSearch() {
    Get.to(() => SearchValues(), arguments: {
      "category_id": category_id,
      "sub_category_id": sub_category_id,
      "serchValue": serchValue,
      "indexCity": indexCity,
      "indexState": indexState
    });
    print("djsuiiiiiiiiiiiiiiiiyy8333333333");
    print(serchValue);
    print("djsuiiiiiiiiiiiiiiiiyy8333333333");
  }

  @override
  void onInit() {
    serchValue = TextEditingController();
    getSearchData();
    getStateData();

    super.onInit();
  }
}
