import 'dart:convert';

import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/dataSource/remote/test_data.dart';
import 'package:on_property/data/models/rent_prop_mode.dart';
import 'package:http/http.dart' as http;

abstract class LocationController extends GetxController {}

class LocationControllerImp extends LocationController {
  MyServices myServices = Get.find();
  TestData testData = TestData(Get.find());

  List<rentProp> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  Future<List<rentProp>> getRentPrp() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      var response = await http.get(Uri.parse(AppLinks.rentProp));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;

        var responseBody = jsonDecode(response.body);
        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
          print(data);
          print(data[0].lat);
          print(data[0].lon);
          print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");

          return data;
        }
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

  @override
  void onInit() {
    checkInterNet();
    // getRentProp();
    getRentPrp();
    super.onInit();
  }
}
