import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:on_property/control/packges_ads_controller.dart';
import 'package:on_property/core/constans/appColors.dart';

class PackgesAds extends StatelessWidget {
  const PackgesAds({super.key});

  @override
  Widget build(BuildContext context) {
    PackgesAdsControllerImp controller = Get.put(PackgesAdsControllerImp());
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //     centerTitle: true,
      //     backgroundColor: AppColors.whiteColor,
      //     title: Text(
      //       "Choose package".tr,
      //       style: TextStyle(
      //           color: AppColors.blackColor3,
      //           fontSize: 14,
      //           fontWeight: FontWeight.w500,
      //           fontStyle: FontStyle.italic),
      //     ),
      //     leading: IconButton(
      //         onPressed: () {
      //           controller.GotoBack();
      //         },
      //         icon: Icon(
      //           Icons.arrow_back,
      //           color: AppColors.blackColor3,
      //           size: 30,
      //         ))),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text(
              "Please choose a package to be able to add your ads".tr,
              style: TextStyle(
                  color: AppColors.blackColor3,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ),
          InkWell(
            onTap: () {
              controller.packageId = 1;
              controller.amount = 100000;
              controller.GotoTransferOffice();
            },
            child: CustomContainerAd(
              imagename: "assets/images/1.png",
              countAds: "One ad",
              priceAds: "100000",
            ),
          ),
          InkWell(
            onTap: () {
              controller.packageId = 2;
              controller.amount = 250000;
              controller.GotoTransferOffice();
            },
            child: CustomContainerAd(
              imagename: "assets/images/3.png",
              countAds: "Three ads",
              priceAds: "250000",
            ),
          ),
          InkWell(
            onTap: () {
              controller.packageId = 3;
              controller.amount = 450000;
              controller.GotoTransferOffice();
            },
            child: CustomContainerAd(
              imagename: "assets/images/6.png",
              countAds: "Six ads",
              priceAds: "450000",
            ),
          ),
        ],
      ),
    ));
  }
}

class CustomContainerAd extends StatelessWidget {
  final String imagename;
  final String countAds;

  final String priceAds;

  const CustomContainerAd({
    super.key,
    required this.imagename,
    required this.countAds,
    required this.priceAds,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(PackgesAdsControllerImp());
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
            ),
            child: Column(
              children: [
                Image.asset(
                  imagename,
                  fit: BoxFit.cover,
                  height: 75,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  countAds.tr,
                  style: TextStyle(
                      color: AppColors.blackColor3,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Price".tr + ": " + priceAds,
                  style: TextStyle(
                      color: AppColors.blackColor3,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
