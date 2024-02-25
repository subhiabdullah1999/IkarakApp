import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/data/dataSource/remote/test_data.dart';
import 'package:on_property/data/models/rent_prop_mode.dart';
import 'package:http/http.dart' as http;
import 'package:on_property/screens/house_details.dart';
import 'package:on_property/screens/search_properties.dart';
import 'package:on_property/screens/search_property.dart';
import 'package:on_property/utils/app_assets.dart';

abstract class LocationHousDetailescontroller extends GetxController {
  typeIkar();
}

class LocationHousDetailescontrollerImp extends LocationHousDetailescontroller {
  String typeSearch = "type";
  String label = "Buy";

  MyServices myServices = Get.find();
  TestData testData = TestData(Get.find());
  final Set<Marker> markers = {};
  // static const LatLng center =
  //     const LatLng(33.46675390901982, 5.59770658590086);

  List<rentProp> data = [];
  StatusRequest statusRequest = StatusRequest.none;

  int ProdId = 0;
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
  int? indexListtypeprop;

  updatUi() {
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
        markers.clear();

        var responseBody = jsonDecode(response.body);
        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
        print(responseBody);

        print("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");

        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          update();
        }

        for (var i = 0; i < data.length; i++) {
          // await await BitmapDescriptor.fromAssetImage(
          //         ImageConfiguration(),
          //         "assets/images/pin1.png")
          //     .then((myMarker) {
          //   print("yyygjhghjghgku9900000000000000000022222222222222222");

          // markers.add(Marker(
          //     markerId: MarkerId(data[i].propertyDetails!.id.toString()),
          //     position: LatLng(
          //         double.parse(data[i].lat!), double.parse(data[i].lon!)),
          //     icon: myMarker,
          //     infoWindow: InfoWindow(
          //         onTap: () {
          //           ProdId = data[i].id!.toInt();
          //           Get.to(() => HouseDetails(),
          //               arguments: {"ProdId": ProdId});
          //         },
          //         title: 'Title'.tr + ": " + data[i].title.toString(),
          //         snippet: 'Price '.tr + ": " + data[i].price.toString())));
          // });
          markers.add(Marker(
              markerId: MarkerId(data[i].propertyDetails!.id.toString()),
              position: LatLng(
                  double.parse(data[i].lat!), double.parse(data[i].lon!)),
              icon: BitmapDescriptor.defaultMarkerWithHue(120),
              infoWindow: InfoWindow(
                  onTap: () {
                    ProdId = data[i].id!.toInt();
                    Get.to(() => HouseDetails(), arguments: {"ProdId": ProdId});
                  },
                  title: 'Title'.tr + ": " + data[i].title.toString(),
                  snippet: 'Price '.tr + ": " + data[i].price.toString())));

          ;
          print("KIUYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
          print(double.parse(data[i].lat!));
          print(data.length);
          print("KIUYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");

          update();
        }
        update();
        print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
        print(data);
        print(data[1].lat);
        print(data[1].lon);
        print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
        print(markers);
        print("::::::::::::::::::::::::::::");
        print("::::::::::::::::::::::::::::");
        print(data.length);
        print(markers);

        print("::::::::::::::::::::::::::::");
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

  Future<List<rentProp>> getRentPrp() async {
    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await http
          .get(Uri.parse(AppLinks.rentProp + indexTypePropdata.toString()));
      if (response.statusCode == 200 || response.statusCode == 201) {
        data.clear();
        markers.clear();
        statusRequest = StatusRequest.success;

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          update();
        }
        for (var i = 0; i < data.length; i++) {
          markers.add(Marker(
              markerId: MarkerId(data[i].propertyDetails!.id.toString()),
              position: LatLng(
                  double.parse(data[i].lat!), double.parse(data[i].lon!)),
              icon: BitmapDescriptor.defaultMarkerWithHue(255),
              infoWindow: InfoWindow(
                  onTap: () {
                    ProdId = data[i].id!.toInt();

                    Get.to(HouseDetails(), arguments: {"ProdId": ProdId});
                  },
                  title: 'Title'.tr + ": " + data[i].title.toString(),
                  snippet: 'Price '.tr + ": " + data[i].price.toString())));
          print("KIUYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
          print(double.parse(data[i].lat!));
          update();
        }
        print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
        print(data);
        print(data[0].lat);
        print(data[0].lon);
        print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
        print(markers);
        print("::::::::::::::::::::::::::::");
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
        markers.clear();
        statusRequest = StatusRequest.success;

        var responseBody = jsonDecode(response.body);

        for (var item in responseBody) {
          data.add(rentProp.fromJson(item));
          update();
        }
        for (var i = 0; i < data.length; i++) {
          markers.add(Marker(
              markerId: MarkerId(
                data[i].propertyDetails!.id.toString(),
              ),
              position: LatLng(
                  double.parse(data[i].lat!), double.parse(data[i].lon!)),
              icon: BitmapDescriptor.defaultMarkerWithHue(5),
              infoWindow: InfoWindow(
                  onTap: () {
                    ProdId = data[i].id!.toInt();

                    Get.to(HouseDetails(), arguments: {"ProdId": ProdId});
                  },
                  title: 'Title'.tr + ": " + data[i].title.toString(),
                  snippet: 'Price '.tr + ": " + data[i].price.toString())));
          print("KIUYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
          print(double.parse(data[i].lat!));
          update();
        }
        print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
        print(data);
        print(data[0].lat);
        print(data[0].lon);
        print("JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJ");
        print(markers);
        print("::::::::::::::::::::::::::::");
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

  goToSearch() {
    Get.to(() => SearchProperty());
  }

  @override
  typeIkar() {
    typeSearch = "type";
    update();
  }

  mobileNumber() {
    typeSearch = "mobile";
    update();
  }

  gR() {
    typeSearch = "QR";
    update();
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
    checkInterNet();

    // getSaletPrp();
    indexTypeProp = 0;
    super.onInit();
  }
}
