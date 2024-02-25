import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_property/control/dashboardcontroller.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/models/city_state_model.dart';
import 'package:on_property/data/models/state_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:on_property/screens/packges_ads.dart';

abstract class AddPropController extends GetxController {}

class AddPropControllerImp extends AddPropController {
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstateAddProp = GlobalKey<FormState>();

  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();

  late TextEditingController price;
  late TextEditingController descr;
  late TextEditingController titel;
  late TextEditingController address;
  late TextEditingController email;
  late TextEditingController area;
  File? fileThambianl;

  List<File> fileImages = [];

  Position? position;

  CameraPosition? kGooglePlex;

  int test = 0;

  int? indexState = 1;
  int? indexCity = 1;
  int i = 0;
  int iii = 0;

  int category_id = 1;
  int sub_category_id = 1;
  int garage = 0;
  String bed = "0";
  String bathrom = "0";
  String typeProp = "sale";
  bool showMap = false;
  List<Marker> markers = [];
  List<String> salePrope = [
    "Apartments".tr,
    "Lands".tr,
    "Shops".tr,
    "Warehouses".tr,
    "Chalets".tr,
    "Villas".tr
  ];
  int selectedProp = 0;
  List<StateModel> data = [];
  List<CityStateModel> dataCity = [];

  List<dynamic> dataNameState = [];
  List<dynamic> dataNameStateCity = [];

  StatusRequest statusRequest = StatusRequest.none;
  double? lat;
  double? lang;

  File? imagefile;

  updatUi() {
    update();
  }

  ChoseImageFromeGelaryOreCamwra() async {
    Get.defaultDialog(
        title: "Image source",
        radius: 10,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      getImageFromCamera();
                      Get.back();
                    },
                    icon: Icon(
                      Icons.camera_alt_sharp,
                      size: 40,
                      color: AppColors.green,
                    )),
                Text("Camera".tr)
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      getImageFromGellary();
                      Get.back();
                    },
                    icon: Icon(
                      Icons.image,
                      size: 40,
                      color: AppColors.green,
                    )),
                Text("Gellary".tr)
              ],
            )
          ],
        ));
    update();
  }

  ChoseImageFromeGelaryOreCameraTambinal() async {
    Get.defaultDialog(
        title: "Image source",
        radius: 10,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      getImageThaminalFromCamera();
                      Get.back();
                    },
                    icon: Icon(
                      Icons.camera_alt_sharp,
                      size: 40,
                      color: AppColors.green,
                    )),
                Text("Camera".tr)
              ],
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      getImageThaminalFromGellary();
                      Get.back();
                    },
                    icon: Icon(
                      Icons.image,
                      size: 40,
                      color: AppColors.green,
                    )),
                Text("Gellary".tr)
              ],
            )
          ],
        ));
    update();
  }

  Future getImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      imagefile = File(image.path);
      fileImages.add(File(
        image.path,
      ));
    }
    update();
  }

  Future getImageThaminalFromCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      fileThambianl = File(image.path);
      update();
    }
    update();
  }

  Future getImageFromGellary() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagefile = File(image.path);
      fileImages.add(File(
        image.path,
      ));
    }
    update();
  }

  Future getImageThaminalFromGellary() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      fileThambianl = File(image.path);
      updatUi();
    }
    update();
  }

  getCurentLocation() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    statusRequest = StatusRequest.none;
    update();
  }

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    lang = latLng.longitude;
    update();
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

  Future addPropToServer() async {
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print("category_id :" + category_id.toString());
    print("sub_Cat :" + sub_category_id.toString());
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    Map<String, String> data = {
      "user_id": myServices.sharedPreferences.get("id").toString(),
      "category_id": category_id.toString(),
      "price": price.text,
      "lat": lat.toString(),
      "lon": lang.toString(),
      "sub_category_id": sub_category_id.toString(),
      "type": typeProp,
      "city_id": indexCity.toString(),
      "state_id": indexState.toString(),
      "description": descr.text,
      "title": titel.text,
      "bed": bed,
      "garage": garage.toString(),
      "bath": bathrom,
      "room_size": "0",
      "content": "0",
      "floor": "0",
    };

    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();

      try {
        var strem = http.ByteStream(imagefile!.openRead());
        var stremThon = http.ByteStream(fileThambianl!.openRead());

        strem.cast();
        stremThon.cast();

        var length = await imagefile!.length();
        var lengthThom = await fileThambianl!.length();

        var uri = Uri.parse(AppLinks.addProp);
        var request = new http.MultipartRequest("Post", uri);
        request.fields.addAll(data);
        for (var i = 0; i < fileImages.length; i++) {
          var multip =
              await http.MultipartFile.fromPath("images[]", fileImages[i].path);
          request.files.add(multip);
          print("et633333333333333333333333333333333333333");
          print(multip);
          print("et633333333333333333333333333333333333333");
        }

        var multipThom =
            await http.MultipartFile.fromPath("thumbnail", fileThambianl!.path);
        print("et633333333333333333333333333333333333333000000000000000000000");
        print(fileThambianl!.path);
        print("et633333333333333333333333333333333333333000000000000000000000");

        request.files.add(multipThom);

        var respons = await request.send();
        if (respons.statusCode == 200 || respons.statusCode == 201) {
          statusRequest = StatusRequest.success;
          update();

          Get.rawSnackbar(
              backgroundColor: AppColors.whiteColor3,
              title: "",
              messageText: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.green,
                      child: Icon(
                        Icons.done,
                        color: AppColors.whiteColor,
                        size: 30,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Add property Done".tr,
                    style: TextStyle(
                        color: AppColors.blackColor3,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ));

          update();

          print("succccccccccccccccccccccccccccccccccces");

          print("succccccccccccccccccccccccccccccccccces");

          return respons;
        } else {
          Get.rawSnackbar(
              backgroundColor: AppColors.whiteColor3,
              title: "",
              messageText: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.redcolor,
                      child: Icon(
                        Icons.error,
                        color: AppColors.whiteColor,
                        size: 30,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "An error occurred, adding the property did not succeed".tr,
                    style: TextStyle(
                        color: AppColors.blackColor3,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ));

          update();
          print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
          print(respons.statusCode);
          statusRequest = StatusRequest.faliure;
          update();

          print("dhhhhhhhhhaydegecbbbbbbbbbbbbbbbbbbbbbbbbbbbbbyyyyyyyrr");

          update();
        }
        statusRequest = StatusRequest.offlinefaliure;
        Get.rawSnackbar(
            backgroundColor: AppColors.whiteColor3,
            title: "",
            messageText: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.redcolor,
                    child: Icon(
                      Icons.error,
                      color: AppColors.whiteColor,
                      size: 30,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "An error occurred, adding the property did not succeed".tr,
                  style: TextStyle(
                      color: AppColors.blackColor3,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ));
        update();
      } catch (e) {
        Get.rawSnackbar(
            backgroundColor: AppColors.whiteColor3,
            title: "",
            messageText: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.redcolor,
                    child: Icon(
                      Icons.error,
                      color: AppColors.whiteColor,
                      size: 30,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "An error occurred, adding the property did not succeed".tr,
                  style: TextStyle(
                      color: AppColors.blackColor3,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ));
        update();
        statusRequest = StatusRequest.serverfaliure;
        update();

        print("Ddddddddddddddddddddddd");
        print(e);
      }

      update();

      return data;
    } else {
      print("***********no enternet***********");
    }
  }

  goToPackgesAds() {
    Get.to(() => PackgesAds());
  }

  @override
  void onInit() {
    price = TextEditingController();
    email = TextEditingController();
    area = TextEditingController();
    address = TextEditingController();
    titel = TextEditingController();
    descr = TextEditingController();
    getStateData();
    super.onInit();
  }
}
