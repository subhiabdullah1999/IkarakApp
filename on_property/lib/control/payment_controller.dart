import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/screens/add_property.dart';
import 'package:on_property/screens/dashboard.dart';
import 'package:on_property/screens/payment.dart';
import 'package:http/http.dart' as http;

abstract class PaymentController extends GetxController {}

class PaymentControllerImp extends PaymentController {
  MyServices myServices = Get.find();
  TextEditingController? name;
  TextEditingController? note;

  TextEditingController? phoneNumber;

  late int transferOfficeId;
  late int packageId;
  late int amount;
  late String methodPayment;

  File? fileThambianl;
  File? imagefile;
  List<File> fileImages = [];
  StatusRequest statusRequest = StatusRequest.none;

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

  updatUi() {
    update();
  }

  GotoBack() {
    Get.back();
  }

  Future addPpaymentToServer() async {
    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    print("packageid :" + packageId.toString());
    print("ammount :" + amount.toString());
    print("method payment :" + methodPayment.toString());
    print("userId : " + myServices.sharedPreferences.get("id").toString());
    print("name : " + name!.text);

    print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

    Map<String, String> data = {
      "user_id": myServices.sharedPreferences.get("id").toString(),
      "package_id": packageId.toString(),
      "ammount": amount.toString(),
      "name": name!.text,
      "Note": note!.text,
      "phone_number": phoneNumber!.text,
      "payment_method": methodPayment,
    };

    if (await checkInterNet()) {
      statusRequest = StatusRequest.loading;
      update();

      try {
        var stremThon = http.ByteStream(fileThambianl!.openRead());

        stremThon.cast();

        var uri = Uri.parse(AppLinks.payment);
        var request = new http.MultipartRequest("Post", uri);
        request.fields.addAll(data);
        print("posssssssssssssssssssssssssssssssssssssttttt");

        var multipThom =
            await http.MultipartFile.fromPath("img", fileThambianl!.path);
        print("et633333333333333333333333333333333333333000000000000000000000");
        print(fileThambianl!.path);
        print("et633333333333333333333333333333333333333000000000000000000000");

        request.files.add(multipThom);

        var respons = await request.send();
        if (respons.statusCode == 200 || respons.statusCode == 201) {
          statusRequest = StatusRequest.success;
          Get.offAll(() => DashBoard());
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
                    "Payment completed successfully".tr,
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
                    "An error occurred and the payment was not successful".tr,
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
                  "An error occurred and the payment was not successful".tr,
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
                  "An error occurred and the payment was not successful".tr,
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

  @override
  void onInit() {
    transferOfficeId = Get.arguments["transferOfficeId"];
    packageId = Get.arguments["packageId"];
    amount = Get.arguments["amount"];
    methodPayment = Get.arguments["methodPayment"];
    name = TextEditingController();
    phoneNumber = TextEditingController();
    note = TextEditingController();

    print("766666665555555555555544444444");
    print(transferOfficeId);
    print(packageId);
    print(amount);
    print(methodPayment);

    print("766666665555555555555544444444");

    super.onInit();
  }
}
