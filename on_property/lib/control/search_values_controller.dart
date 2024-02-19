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

abstract class SearchValuesController extends GetxController {}

class SearchValueControllerImp extends SearchValuesController {
  StatusRequest statusRequest = StatusRequest.none;
  int ProdId = 0;
  late int cat_id;
  late int sub_cat_id;
  late int state_id;
  late int city_id;
  TextEditingController? nameProp;

  GotoBack() {
    Get.back();
  }

  List<SearchDataModel> dataSearch = [];
  List databody = [];

  Future<List<SearchDataModel>> getSearchData() async {
    print("90000000000000000000000000000000000000");
    print(cat_id);
    print(sub_cat_id);
    print(nameProp.toString());
    print(state_id);
    print(city_id);

    print("90000000000000000000000000000000000000");
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(
          "https://ikarak.ibits-ltd.me/api/properties/search?name=${nameProp!.text}?city_id=${city_id.toString()}?state_id=${state_id.toString()}?category_id=${cat_id.toString()}?sub_category_id=${sub_cat_id.toString()}"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        dataSearch.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        databody = responseBody["data"];
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

  @override
  void onInit() {
    cat_id = Get.arguments["category_id"];
    sub_cat_id = Get.arguments["sub_category_id"];
    state_id = Get.arguments["indexState"];
    city_id = Get.arguments["indexCity"];
    nameProp = Get.arguments["serchValue"];
    getSearchData();
    super.onInit();
  }
}
