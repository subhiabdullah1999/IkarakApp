import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:on_property/control/packges_ads_controller.dart';
import 'package:on_property/control/transfer_office_contrroler.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/imageassets.dart';

class TransferOffice extends StatelessWidget {
  const TransferOffice({super.key});

  @override
  Widget build(BuildContext context) {
    TransferOfficeControllerImp controller =
        Get.put(TransferOfficeControllerImp());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            "Choose a transfer office".tr,
            style: TextStyle(
                color: AppColors.blackColor3,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
              onPressed: () {
                controller.GotoBack();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.blackColor3,
                size: 30,
              ))),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Text(
              "Please select a payment office".tr,
              style: TextStyle(
                  color: AppColors.blackColor3,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          InkWell(
            onTap: () {
              controller.transferOfficeId = 1;
              controller.methodPayment = "Omt";

              controller.GotoPayment();
            },
            child: CustomContainerAd(
              imagename: "assets/images/omt.png",
            ),
          ),
          InkWell(
            onTap: () {
              controller.transferOfficeId = 2;
              controller.methodPayment = "Whish Money";
              controller.GotoPayment();
            },
            child: CustomContainerAd(
              imagename: "assets/images/wish.jpg",
            ),
          ),
          // CustomContainerAd(
          //   imagename: "assets/images/6.png",
          //   countAds: "Six ads",
          //   priceAds: "450000",
          // ),
        ],
      ),
    ));
  }
}

class CustomContainerAd extends StatelessWidget {
  final String imagename;

  const CustomContainerAd({
    super.key,
    required this.imagename,
  });

  @override
  Widget build(BuildContext context) {
    TransferOfficeControllerImp controller =
        Get.put(TransferOfficeControllerImp());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 6),
            height: 180,
            width: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.green,
                ),
                image: DecorationImage(
                    image: AssetImage(
                      imagename,
                    ),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
