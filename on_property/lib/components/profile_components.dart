import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/components/home_componets.dart';
import 'package:on_property/control/profile_controller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/screens/house_details.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstHalf extends StatefulWidget {
  const FirstHalf({super.key});

  @override
  State<FirstHalf> createState() => _FirstHalfState();
}

class _FirstHalfState extends State<FirstHalf>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());

    return GetBuilder<ProfileControllerImp>(
        builder: (controller) => Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  controller.data[0].image == null
                      ? CircleAvatar(
                          maxRadius: 60,
                          backgroundColor: AppColors.green,
                        )
                      : CircleAvatar(
                          maxRadius: 60,
                          backgroundImage:
                              NetworkImage(controller.data[0].image.toString()),
                        ),
                  Text(
                    controller.data[0].fName.toString() +
                        " " +
                        controller.data[0].lName.toString(),
                    style: kh1,
                  ),
                  controller.data[0].email != null
                      ? Text(
                          'Email'.tr +
                              ": " +
                              controller.data[0].email.toString(),
                          style: TextStyle(color: Colors.grey),
                        )
                      : SizedBox(),
                  controller.data[0].email != null
                      ? Text(
                          'Phone Number'.tr +
                              ": " +
                              controller.data[0].mobile.toString(),
                          style: TextStyle(color: Colors.grey),
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "mailto:" + controller.data[0].email.toString()));
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primaryColor),
                          child: Center(
                            child: Text(
                              'Message'.tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "tel:" + controller.data[0].mobile.toString()));
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: primaryColor),
                          child: Center(
                            child: Text(
                              "call".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(),
                  ),
                  // Container(
                  //   height: 40,
                  //   width: double.infinity,
                  //   margin: EdgeInsets.symmetric(horizontal: 30),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.pushNamed(context, 'Followers');
                  //         },
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               '500',
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'Followers',
                  //               style: TextStyle(color: Colors.grey),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       GestureDetector(
                  //         onTap: () {
                  //           Navigator.pushNamed(context, 'Properties');
                  //         },
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               '60',
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'Properties',
                  //               style: TextStyle(color: Colors.grey),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 30,
                  //       ),
                  //       GestureDetector(
                  //         onTap: () => Navigator.pushNamed(context, 'Following'),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               '60',
                  //               style: TextStyle(fontWeight: FontWeight.bold),
                  //             ),
                  //             Text(
                  //               'Followings',
                  //               style: TextStyle(color: Colors.grey),
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  //   child: Divider(),
                  // ),
                ],
              ),
            ));
  }
}

// firstHalf(BuildContext context) {

//   return ;
// }

anotherList() {
  Get.put(ProfileControllerImp());
  return GetBuilder<ProfileControllerImp>(
      builder: (controller) => ListView.builder(
          itemCount: controller.dataPropUserId.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return index == 0
                ? FirstHalf()
                : GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'HouseDetails');
                    },
                    child: thirdComponent(index));
          }));
}

class ProfileCustom extends StatefulWidget {
  const ProfileCustom({super.key});

  @override
  State<ProfileCustom> createState() => _ProfileCustomState();
}

class _ProfileCustomState extends State<ProfileCustom>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileControllerImp>(
        builder: (controller) => Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 10.0),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controller.data[0].image == null
                            ? CircleAvatar(
                                maxRadius: 60,
                                backgroundColor: AppColors.green,
                              )
                            : CircleAvatar(
                                maxRadius: 60,
                                backgroundImage: NetworkImage(
                                    controller.data[0].image.toString()),
                              ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          controller.data[0].fName.toString() +
                              " " +
                              controller.data[0].lName.toString(),
                          style: kh1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        controller.data[0].email != null
                            ? Text(
                                'Email'.tr +
                                    ": " +
                                    controller.data[0].email.toString(),
                                style: TextStyle(color: Colors.grey),
                              )
                            : SizedBox(),
                        controller.data[0].email != null
                            ? Text(
                                'Phone Number'.tr +
                                    ": " +
                                    controller.data[0].mobile.toString(),
                                style: TextStyle(color: Colors.grey),
                              )
                            : SizedBox(),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () async {
                        //         await launchUrl(Uri.parse("mailto:" +
                        //             controller.data[0].email.toString()));
                        //       },
                        //       child: Container(
                        //         height: 30,
                        //         width: 100,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(30),
                        //             color: primaryColor),
                        //         child: Center(
                        //           child: Text(
                        //             'Message'.tr,
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     GestureDetector(
                        //       onTap: () async {
                        //         await launchUrl(Uri.parse("tel:" +
                        //             controller.data[0].mobile.toString()));
                        //       },
                        //       child: Container(
                        //         height: 30,
                        //         width: 100,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(30),
                        //             color: primaryColor),
                        //         child: Center(
                        //           child: Text(
                        //             "call".tr,
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Divider(),
                        ),
                        // Container(
                        //   height: 40,
                        //   width: double.infinity,
                        //   margin: EdgeInsets.symmetric(horizontal: 30),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       GestureDetector(
                        //         onTap: () {
                        //           Navigator.pushNamed(context, 'Followers');
                        //         },
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text(
                        //               '500',
                        //               style: TextStyle(fontWeight: FontWeight.bold),
                        //             ),
                        //             Text(
                        //               'Followers',
                        //               style: TextStyle(color: Colors.grey),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 30,
                        //       ),
                        //       GestureDetector(
                        //         onTap: () {
                        //           Navigator.pushNamed(context, 'Properties');
                        //         },
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text(
                        //               '60',
                        //               style: TextStyle(fontWeight: FontWeight.bold),
                        //             ),
                        //             Text(
                        //               'Properties',
                        //               style: TextStyle(color: Colors.grey),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 30,
                        //       ),
                        //       GestureDetector(
                        //         onTap: () => Navigator.pushNamed(context, 'Following'),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Text(
                        //               '60',
                        //               style: TextStyle(fontWeight: FontWeight.bold),
                        //             ),
                        //             Text(
                        //               'Followings',
                        //               style: TextStyle(color: Colors.grey),
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        //   child: Divider(),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: TabBar(
                    controller: tabController,
                    tabs: controller.tabs,
                    labelColor: AppColors.blackColor3,
                    indicatorColor: AppColors.green,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TabBarView(controller: tabController, children: [
                      PropAprovid(),
                      ReviewProp(),
                      RejectedProp(),
                    ]),
                  ),
                ),
                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //   child: Text(
                //     "Acceptable properties".tr,
                //     style: Theme.of(context)
                //         .textTheme
                //         .titleLarge!
                //         .copyWith(color: AppColors.blackColor3, fontSize: 14),
                //   ),
                // ),

                // Padding(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //   child: Text(
                //     "Rejected properties".tr,
                //     style: Theme.of(context)
                //         .textTheme
                //         .titleLarge!
                //         .copyWith(color: AppColors.blackColor3, fontSize: 14),
                //   ),
                // ),
              ],
            ));
  }
}

class PropAprovid extends StatelessWidget {
  const PropAprovid({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    return controller.dataPropUserIdAprov.isEmpty
        ? Center(
            child: Text(
              "You have not added any property".tr,
              style: TextStyle(
                  color: AppColors.redcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          )
        : SizedBox(
            child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.dataPropUserId.length,
                gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.9)),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(controller.dataPropUserId[index].id.toString()),
                    direction: DismissDirection.horizontal,
                    // confirmDismiss: (direction) => controller.popDeletCard(),
                    onDismissed: (direction) {
                      controller.ProdId =
                          controller.dataPropUserId[index].id!.toInt();
                      if (direction == DismissDirection.endToStart) {
                        controller.popDeletCard();
                      } else if (direction == DismissDirection.startToEnd) {
                        controller.popDeletCard();
                      }
                    },
                    child: GestureDetector(
                        onTap: () {
                          controller.ProdId =
                              controller.dataPropUserId[index].id!.toInt();
                          Get.to(() => HouseDetails(),
                              arguments: {"ProdId": controller.ProdId});
                        },
                        child: Card(
                          margin: EdgeInsets.only(
                              bottom: 10.0, left: 8.0, right: 8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 85,
                                  margin: EdgeInsets.only(
                                      right: 18.0,
                                      top: 8.0,
                                      left: 8.0,
                                      bottom: 8.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              AppLinks.serverNameImgeThumbnail +
                                                  controller
                                                      .dataPropUserId[index]
                                                      .thumbnail
                                                      .toString()))),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: 8.0,
                                        right: 8.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),

                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  controller
                                                      .dataPropUserId[index]
                                                      .title
                                                      .toString(),
                                                  style: kh2.copyWith(
                                                      fontSize: 14,
                                                      color: AppColors.green,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Text(
                                                  "\$ " +
                                                      controller
                                                          .dataPropUserId[index]
                                                          .price
                                                          .toString(),
                                                  style: kh2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          controller.dataPropUserId[index]
                                                      .country!.name !=
                                                  null
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      controller
                                                              .dataPropUserId[
                                                                  index]
                                                              .country!
                                                              .name
                                                              .toString() +
                                                          " , ",
                                                      //+ controller
                                                      //     .data[index].city!.name
                                                      //     .toString(),
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13),
                                                    ),
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    controller
                                                                .dataPropUserId[
                                                                    index]
                                                                .city ==
                                                            null
                                                        ? Text("")
                                                        : Text(
                                                            controller
                                                                .dataPropUserId[
                                                                    index]
                                                                .city!
                                                                .name
                                                                .toString(),

                                                            //+ controller
                                                            //     .data[index].city!.name
                                                            //     .toString(),
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 13),
                                                          ),
                                                  ],
                                                )
                                              : Text(""),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          // IntrinsicHeight(
                                          //   child: Row(
                                          //     children: [
                                          //       Text(
                                          //         controller.data[index]
                                          //             .propertyDetails!.bed
                                          //             .toString(),
                                          //         style: TextStyle(
                                          //             fontWeight: FontWeight.bold),
                                          //       ),
                                          //       Text(
                                          //         ' beds'.tr,
                                          //       ),
                                          //       VerticalDivider(
                                          //         width: 10,
                                          //         color: Colors.grey,
                                          //       ),
                                          //       Text(
                                          //         controller.data[index]
                                          //             .propertyDetails!.bed
                                          //             .toString(),
                                          //         style: TextStyle(
                                          //             fontWeight: FontWeight.bold),
                                          //       ),
                                          //       Text(
                                          //         ' baths'.tr,
                                          //       ),
                                          //       VerticalDivider(
                                          //         width: 10,
                                          //         color: Colors.green,
                                          //       ),
                                          //       Text(
                                          //         controller.data[index]
                                          //             .propertyDetails!.floor
                                          //             .toString(),
                                          //         style: TextStyle(
                                          //             fontWeight: FontWeight.bold),
                                          //       ),
                                          //       // Text(
                                          //       //   'floor'.tr,
                                          //       // ),
                                          //     ],
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   height: 3,
                                          // ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  maxRadius: 5,
                                                  backgroundColor: Colors.green,
                                                ),
                                                Text(
                                                  " property for ".tr +
                                                      controller
                                                          .dataPropUserId[index]
                                                          .type
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                                Spacer(),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller.ProdId =
                                                            controller
                                                                .dataPropUserId[
                                                                    index]
                                                                .id!
                                                                .toInt();
                                                        controller
                                                            .popDeletCard();
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: AppColors
                                                                .whiteColor3),
                                                        child: Icon(
                                                          Icons
                                                              .delete_forever_outlined,
                                                          size: 25,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 15,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .changeValueFavorit(
                                                                index);
                                                      },
                                                      child: Container(
                                                        child:
                                                            controller.listFavor[
                                                                        index] ==
                                                                    true
                                                                ? Icon(
                                                                    Icons
                                                                        .favorite,
                                                                    color:
                                                                        primaryColor,
                                                                    size: 22,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .favorite_border,
                                                                    size: 22,
                                                                  ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        )),
                  );
                }),
          );
    // Padding(
    //   padding:
    //       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //   child: Text(
    //     "Properties are under review".tr,
    //     style: Theme.of(context)
    //         .textTheme
    //         .titleLarge!
    //         .copyWith(color: AppColors.blackColor3, fontSize: 14),
    //   ),
    // ),;
  }
}

class ReviewProp extends StatelessWidget {
  const ReviewProp({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = Get.put(ProfileControllerImp());
    return controller.dataPropUserIdReview.isEmpty
        ? Center(
            child: Text(
              "You have not added any property".tr,
              style: TextStyle(
                  color: AppColors.redcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          )
        : SizedBox(
            child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.dataPropUserId.length,
                gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.9)),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        controller.ProdId =
                            controller.dataPropUserId[index].id!.toInt();
                        Get.to(() => HouseDetails(),
                            arguments: {"ProdId": controller.ProdId});
                      },
                      child: Card(
                        margin: EdgeInsets.only(
                            bottom: 10.0, left: 8.0, right: 8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 85,
                                margin: EdgeInsets.only(
                                    right: 18.0,
                                    top: 8.0,
                                    left: 8.0,
                                    bottom: 8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            AppLinks.serverNameImgeThumbnail +
                                                controller.dataPropUserId[index]
                                                    .thumbnail
                                                    .toString()))),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      right: 8.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller
                                                    .dataPropUserId[index].title
                                                    .toString(),
                                                style: kh2.copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.green,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$ " +
                                                    controller
                                                        .dataPropUserId[index]
                                                        .price
                                                        .toString(),
                                                style: kh2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        controller.dataPropUserId[index]
                                                    .country!.name !=
                                                null
                                            ? Row(
                                                children: [
                                                  Text(
                                                    controller
                                                            .dataPropUserId[
                                                                index]
                                                            .country!
                                                            .name
                                                            .toString() +
                                                        " , ",
                                                    //+ controller
                                                    //     .data[index].city!.name
                                                    //     .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  controller
                                                              .dataPropUserId[
                                                                  index]
                                                              .city ==
                                                          null
                                                      ? Text("")
                                                      : Text(
                                                          controller
                                                              .dataPropUserId[
                                                                  index]
                                                              .city!
                                                              .name
                                                              .toString(),

                                                          //+ controller
                                                          //     .data[index].city!.name
                                                          //     .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 13),
                                                        ),
                                                ],
                                              )
                                            : Text(""),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // IntrinsicHeight(
                                        //   child: Row(
                                        //     children: [
                                        //       Text(
                                        //         controller.data[index]
                                        //             .propertyDetails!.bed
                                        //             .toString(),
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //       Text(
                                        //         ' beds'.tr,
                                        //       ),
                                        //       VerticalDivider(
                                        //         width: 10,
                                        //         color: Colors.grey,
                                        //       ),
                                        //       Text(
                                        //         controller.data[index]
                                        //             .propertyDetails!.bed
                                        //             .toString(),
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //       Text(
                                        //         ' baths'.tr,
                                        //       ),
                                        //       VerticalDivider(
                                        //         width: 10,
                                        //         color: Colors.green,
                                        //       ),
                                        //       Text(
                                        //         controller.data[index]
                                        //             .propertyDetails!.floor
                                        //             .toString(),
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //       // Text(
                                        //       //   'floor'.tr,
                                        //       // ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 3,
                                        // ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                maxRadius: 5,
                                                backgroundColor: Colors.green,
                                              ),
                                              Text(
                                                " property for ".tr +
                                                    controller
                                                        .dataPropUserId[index]
                                                        .type
                                                        .toString(),
                                                style: TextStyle(fontSize: 11),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .whiteColor3),
                                                      child: Icon(
                                                        Icons
                                                            .delete_forever_outlined,
                                                        size: 25,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .changeValueFavorit(
                                                              index);
                                                    },
                                                    child: Container(
                                                      child:
                                                          controller.listFavor[
                                                                      index] ==
                                                                  true
                                                              ? Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color:
                                                                      primaryColor,
                                                                  size: 22,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  size: 22,
                                                                ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ));
                }),
          );
  }
}

class RejectedProp extends StatelessWidget {
  const RejectedProp({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controller = ProfileControllerImp();
    return controller.dataPropUserIdfalied.isEmpty
        ? Center(
            child: Text(
              "You have not added any property".tr,
              style: TextStyle(
                  color: AppColors.redcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          )
        : SizedBox(
            child: GridView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: controller.dataPropUserId.length,
                gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 2.9)),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        controller.ProdId =
                            controller.dataPropUserId[index].id!.toInt();
                        Get.to(() => HouseDetails(),
                            arguments: {"ProdId": controller.ProdId});
                      },
                      child: Card(
                        margin: EdgeInsets.only(
                            bottom: 10.0, left: 8.0, right: 8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 85,
                                margin: EdgeInsets.only(
                                    right: 18.0,
                                    top: 8.0,
                                    left: 8.0,
                                    bottom: 8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            AppLinks.serverNameImgeThumbnail +
                                                controller.dataPropUserId[index]
                                                    .thumbnail
                                                    .toString()))),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      right: 8.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),

                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                controller
                                                    .dataPropUserId[index].title
                                                    .toString(),
                                                style: kh2.copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.green,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                "\$ " +
                                                    controller
                                                        .dataPropUserId[index]
                                                        .price
                                                        .toString(),
                                                style: kh2,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        controller.dataPropUserId[index]
                                                    .country!.name !=
                                                null
                                            ? Row(
                                                children: [
                                                  Text(
                                                    controller
                                                            .dataPropUserId[
                                                                index]
                                                            .country!
                                                            .name
                                                            .toString() +
                                                        " , ",
                                                    //+ controller
                                                    //     .data[index].city!.name
                                                    //     .toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  controller
                                                              .dataPropUserId[
                                                                  index]
                                                              .city ==
                                                          null
                                                      ? Text("")
                                                      : Text(
                                                          controller
                                                              .dataPropUserId[
                                                                  index]
                                                              .city!
                                                              .name
                                                              .toString(),

                                                          //+ controller
                                                          //     .data[index].city!.name
                                                          //     .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 13),
                                                        ),
                                                ],
                                              )
                                            : Text(""),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        // IntrinsicHeight(
                                        //   child: Row(
                                        //     children: [
                                        //       Text(
                                        //         controller.data[index]
                                        //             .propertyDetails!.bed
                                        //             .toString(),
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //       Text(
                                        //         ' beds'.tr,
                                        //       ),
                                        //       VerticalDivider(
                                        //         width: 10,
                                        //         color: Colors.grey,
                                        //       ),
                                        //       Text(
                                        //         controller.data[index]
                                        //             .propertyDetails!.bed
                                        //             .toString(),
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //       Text(
                                        //         ' baths'.tr,
                                        //       ),
                                        //       VerticalDivider(
                                        //         width: 10,
                                        //         color: Colors.green,
                                        //       ),
                                        //       Text(
                                        //         controller.data[index]
                                        //             .propertyDetails!.floor
                                        //             .toString(),
                                        //         style: TextStyle(
                                        //             fontWeight: FontWeight.bold),
                                        //       ),
                                        //       // Text(
                                        //       //   'floor'.tr,
                                        //       // ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   height: 3,
                                        // ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                maxRadius: 5,
                                                backgroundColor: Colors.green,
                                              ),
                                              Text(
                                                " property for ".tr +
                                                    controller
                                                        .dataPropUserId[index]
                                                        .type
                                                        .toString(),
                                                style: TextStyle(fontSize: 11),
                                              ),
                                              Spacer(),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {},
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: AppColors
                                                              .whiteColor3),
                                                      child: Icon(
                                                        Icons
                                                            .delete_forever_outlined,
                                                        size: 25,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .changeValueFavorit(
                                                              index);
                                                    },
                                                    child: Container(
                                                      child:
                                                          controller.listFavor[
                                                                      index] ==
                                                                  true
                                                              ? Icon(
                                                                  Icons
                                                                      .favorite,
                                                                  color:
                                                                      primaryColor,
                                                                  size: 22,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  size: 22,
                                                                ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ));
                }),
          );
  }
}
