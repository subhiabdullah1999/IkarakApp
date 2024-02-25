import 'dart:convert';

import 'package:get/get.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/profile_model.dart';
import 'package:http/http.dart' as http;

abstract class DrawerController extends GetxController {}

class DrawerControllerImp extends DrawerController {
  MyServices myServices = Get.find();
  List<ProfileModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  int cridetNumber = 0;

  Future<List<ProfileModel>> getProfileData() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http.get(Uri.parse(AppLinks.getProfile + "1"));
      if (response.statusCode == 200 || response.statusCode == 201) {
        statusRequest = StatusRequest.success;
        data.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);

        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

        for (var item in responseBody) {
          data.add(ProfileModel.fromJson(item));
          update();
        }
        cridetNumber = data[0].cridetNumber!;

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

  @override
  void onInit() {
    getProfileData();
    super.onInit();
  }
}
