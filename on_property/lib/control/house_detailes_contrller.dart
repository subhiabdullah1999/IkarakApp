import 'dart:convert';

import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/prod_detailes_model.dart';
import 'package:on_property/data/models/prop_user_id_model.dart';
import 'package:on_property/data/models/rent_prop_mode.dart';
import 'package:http/http.dart' as http;

abstract class HouseDetailsController extends GetxController {}

class HouseDetailsControllerImp extends HouseDetailsController {
  MyServices myServices = Get.find();

  late int propId;

  List<ProdDetailesModel> data = [];
  List<PropUserIdModel> dataPropUserId = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<List<ProdDetailesModel>> getProdDetailes() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http
          .get(Uri.parse("https://ikarak.ibits-ltd.me/api/property/$propId"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        data.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

        for (var item in responseBody) {
          data.add(ProdDetailesModel.fromJson(item));
          print("UUUUUUUUIIIIIIIIIIIIOOOOOOOOOOOOOOOOOOOOO");
          print(data);
          print("UUUUUUUUIIIIIIIIIIIIOOOOOOOOOOOOOOOOOOOOO");
          update();
        }
        update();
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

        update();
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

  @override
  void onInit() {
    propId = Get.arguments["ProdId"];
    print("dffffffffaghhhhhhhhhhhhhhhhhhhhh");
    print(propId);
    print("dffffffffaghhhhhhhhhhhhhhhhhhhhh");
    getProdDetailes();
    getProdUserId();
    super.onInit();
  }
}
