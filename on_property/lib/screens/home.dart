import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:on_property/components/carousal.dart';
import 'package:on_property/components/home_componets.dart';
import 'package:on_property/components/textfield_with_filter.dart';
import 'package:on_property/control/home_controller.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/utils/constants.dart';
import 'package:on_property/widgets/loading.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "Dashboard", (route) => false);
            },
            child: CircleAvatar(
              radius: 32,
              backgroundColor: Colors.black87,
              child: SvgPicture.asset(
                'assets/icons/map.svg',
                color: Colors.white,
                height: 32,
                width: 32,
              ),
            ),
          ),
          body: GetBuilder<HomeControllerImp>(
            builder: (controller) => Stack(
              children: [
                controller.statusRequest == StatusRequest.loading
                    ? Positioned(
                        top: MediaQuery.of(context).size.height / 3,
                        // bottom: MediaQuery.of(context).size.height / 2,
                        // left: MediaQuery.of(context).size.width / 2,
                        right: MediaQuery.of(context).size.width / 3.5,
                        child: Loading())
                    : Container(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textFieldWithFilter(context: context),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 18.0,
                                    bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Latest Projects'.tr,
                                      style: kh3,
                                    ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     Navigator.pushNamed(
                                    //         context, 'SeeAllScreen');
                                    //   },
                                    //   child: Text(
                                    //     'SEE ALL'.tr,
                                    //     style: TextStyle(
                                    //         fontWeight: FontWeight.bold,
                                    //         color: primaryColor),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              // listForSecondComponent(),

                              /*.............Carousal..........................*/

                              // appCarousal(context),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       left: 8.0, right: 8.0, top: 30.0, bottom: 10),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: [
                              //       Text(
                              //         'Properties Near You'.tr,
                              //         style: kh3,
                              //       ),
                              //       GestureDetector(
                              //         onTap: () {
                              //           Navigator.pushNamed(context, 'SeeAllScreen');
                              //         },
                              //         child: Text(
                              //           'SEE ALL'.tr,
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: primaryColor),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  height: 75,
                                  width: MediaQuery.of(context).size.width - 20,
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.forBuy();

                                          controller.indexListtypeprop = null;
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/buy.svg',
                                                    height: 30,
                                                    width: 30,
                                                    color: controller.label ==
                                                            "Buy"
                                                        ? primaryColor
                                                        : AppColors.gry),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  'For sale'.tr,
                                                  style: TextStyle(
                                                      color: controller.label ==
                                                              "Buy"
                                                          ? primaryColor
                                                          : AppColors.gry,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: VerticalDivider(
                                          color: AppColors.blackColors4,
                                          endIndent: 15,
                                          indent: 15,
                                          thickness: 1.3,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.forRant();

                                          controller.indexListtypeprop = null;
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/reant.svg',
                                                    height: 30,
                                                    width: 30,
                                                    color: controller.label ==
                                                            "Rant"
                                                        ? primaryColor
                                                        : AppColors.gry),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  'For Rent'.tr,
                                                  style: TextStyle(
                                                      color: controller.label ==
                                                              "Rant"
                                                          ? primaryColor
                                                          : AppColors.gry,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: VerticalDivider(
                                          color: AppColors.blackColors4,
                                          endIndent: 15,
                                          indent: 15,
                                          thickness: 1.3,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.forInv();

                                          // showDialog(
                                          //     context: context,
                                          //     builder: (builder) {
                                          //       return Container(
                                          //         margin: EdgeInsets.only(top: 120),
                                          //         child: AlertDialog(
                                          //           alignment: Alignment.topCenter,
                                          //           content: Container(
                                          //             height: 100,
                                          //             child: SingleChildScrollView(
                                          //               child: Column(
                                          //                 children: [],
                                          //               ),
                                          //             ),
                                          //           ),
                                          //         ),
                                          //       );
                                          //     });

                                          controller.indexListtypeprop = null;
                                        },
                                        child: Container(
                                          child: Center(
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/icons/investment-insurance-svgrepo-com.svg',
                                                    height: 30,
                                                    width: 30,
                                                    color: controller.label ==
                                                            "Inv"
                                                        ? primaryColor
                                                        : AppColors.gry),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  'For investment'.tr,
                                                  style: TextStyle(
                                                      color: controller.label ==
                                                              "Inv"
                                                          ? primaryColor
                                                          : AppColors.gry,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              controller.indexTypeProp == 1
                                  ? Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      height: Get.height - 280,
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.whiteColor,
                                          border: Border.all(
                                              color: AppColors.green)),
                                      child: GridView.builder(
                                          itemCount:
                                              controller.salePrope.length,
                                          scrollDirection: Axis.vertical,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1,
                                            childAspectRatio: 4,
                                          ),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.indexTypePropdata =
                                                    index + 1;
                                                controller.indexListtypeprop =
                                                    index;
                                                controller.indexTypeProp = 0;
                                                controller.update();
                                                controller.getSaletPrp();
                                              },
                                              child: Card(
                                                child: Container(
                                                  margin: EdgeInsets.all(2),
                                                  width: 30,
                                                  height: 82,
                                                  color: controller
                                                              .indexListtypeprop ==
                                                          index
                                                      ? AppColors.green
                                                      : AppColors.whiteColor,
                                                  child: Center(
                                                    child: Text(
                                                      controller
                                                          .salePrope[index],
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: controller
                                                                      .indexListtypeprop ==
                                                                  index
                                                              ? AppColors
                                                                  .whiteColor
                                                              : AppColors
                                                                  .blackColor3),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                    )
                                  : controller.indexTypeProp == 2
                                      ? Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          height: Get.height - 280,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColors.whiteColor,
                                              border: Border.all(
                                                  color: AppColors.green)),
                                          child: GridView.builder(
                                              itemCount:
                                                  controller.salePrope.length,
                                              scrollDirection: Axis.vertical,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                childAspectRatio: 4,
                                              ),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    controller
                                                            .indexTypePropdata =
                                                        index + 1;
                                                    controller
                                                            .indexListtypeprop =
                                                        index;
                                                    controller.indexTypeProp =
                                                        0;
                                                    controller.getRentPrp();
                                                    controller.update();
                                                  },
                                                  child: Card(
                                                    child: Container(
                                                      margin: EdgeInsets.all(2),
                                                      width: 30,
                                                      height: 82,
                                                      color: controller
                                                                  .indexListtypeprop ==
                                                              index
                                                          ? AppColors.green
                                                          : AppColors
                                                              .whiteColor,
                                                      child: Center(
                                                        child: Text(
                                                          controller
                                                              .salePrope[index],
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: controller
                                                                          .indexListtypeprop ==
                                                                      index
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : AppColors
                                                                      .blackColor3),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      : controller.indexTypeProp == 3
                                          ? Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              height: Get.height - 280,
                                              width: Get.width,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColors.whiteColor,
                                                  border: Border.all(
                                                      color: AppColors.green)),
                                              child: GridView.builder(
                                                  itemCount: controller
                                                      .salePrope.length,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 1,
                                                    childAspectRatio: 4,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        controller
                                                                .indexTypePropdata =
                                                            index + 1;
                                                        controller
                                                                .indexListtypeprop =
                                                            index;
                                                        controller
                                                            .indexTypeProp = 0;
                                                        controller
                                                            .getInversPrp();
                                                        controller.update();
                                                      },
                                                      child: Card(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(2),
                                                          width: 30,
                                                          height: 82,
                                                          color: controller
                                                                      .indexListtypeprop ==
                                                                  index
                                                              ? AppColors.green
                                                              : AppColors
                                                                  .whiteColor,
                                                          child: Center(
                                                            child: Text(
                                                              controller
                                                                      .salePrope[
                                                                  index],
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  color: controller
                                                                              .indexListtypeprop ==
                                                                          index
                                                                      ? AppColors
                                                                          .whiteColor
                                                                      : AppColors
                                                                          .blackColor3),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            )
                                          : SizedBox(),
                              Container(
                                child: ListForThirdComponent(),
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}
