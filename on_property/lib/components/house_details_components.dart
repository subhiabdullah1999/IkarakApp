import 'package:carousel_nullsafety/carousel_nullsafety.dart' as carusel;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_property/control/house_detailes_contrller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/constans/applinks.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../screens/locationForHouseDetails.dart';

Stack customCarousal(BuildContext context) {
  Get.put(HouseDetailsControllerImp());
  return Stack(
    children: [
      Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            child: carusel.Carousel(
              dotSize: 4,
              dotBgColor: Colors.transparent,
              borderRadius: false,
              showIndicator: true,
              noRadiusForIndicator: false,
              images: [
                ExactAssetImage(
                  'assets/images/carousal1.jpg',
                ),
                ExactAssetImage('assets/images/carousal2.jpg'),
                ExactAssetImage('assets/images/carousal3.jpg'),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
      Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: primaryColor),
              child: Center(
                  child: Text(
                'For Sale',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hilton House',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'New York, USA   ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
                SvgPicture.asset(
                  'assets/icons/squareft.svg',
                  color: Colors.white,
                ),
                Text(
                  '  750 (Sq Fts)',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 11),
                ),
              ],
            )
          ],
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.32,
        left: MediaQuery.of(context).size.width - 50,
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            child: Icon(
              Icons.favorite,
              color: primaryColor,
            ),
            backgroundColor: Colors.grey[100],
          ),
        ),
      )
    ],
  );
}

class FirstCompOfDetails extends StatelessWidget {
  const FirstCompOfDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HouseDetailsControllerImp());
    return GetBuilder<HouseDetailsControllerImp>(
        builder: (controllerImp) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controllerImp.data[0].title!,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      Column(
                        children: [
                          Text(
                            'Price '.tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                          Text(
                            '\$ ' + controllerImp.data[0].price.toString(),
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  // controllerImp.data[0].subCategoryId == 2 ||
                  //         controllerImp.data[0].subCategoryId == 3 ||
                  //         controllerImp.data[0].subCategoryId == 4
                  //     ? SizedBox()
                  //     :
                  Container(
                    height: 80,
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/bed.svg',
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controllerImp.data[0].propertyDetails!.bed
                                          .toString() +
                                      ' beds'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/washroom.svg',
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controllerImp.data[0].propertyDetails!.bath
                                          .toString() +
                                      ' baths'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/kitchen.svg',
                                  height: 20,
                                  color: primaryColor,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  controllerImp.data[0].propertyDetails!.garage
                                          .toString() +
                                      ' kitchens'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ));
  }
}

// Container firstCompOfDetails(BuildContext context) {
//   HouseDetailsControllerImp controllerImp =
//       Get.put(HouseDetailsControllerImp());
// return
// Container(
//   height: MediaQuery.of(context).size.height * 0.23,
//   padding: EdgeInsets.all(10.0),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             controllerImp.data[0].title!,
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16),
//           ),
//           Column(
//             children: [
//               Text(
//                 'Price '.tr,
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 16),
//               ),
//               Text(
//                 '\$ ' + controllerImp.data[0].price.toString(),
//                 style: TextStyle(
//                     color: primaryColor,
//                     fontSize: 28,
//                     fontWeight: FontWeight.w500),
//               ),
//             ],
//           ),
//         ],
//       ),
//       Divider(),
//       controllerImp.data[0].subCategoryId == 2 ||
//               controllerImp.data[0].subCategoryId == 3 ||
//               controllerImp.data[0].subCategoryId == 4
//           ? SizedBox()
//           : Container(
//               height: 80,
//               padding: EdgeInsets.symmetric(horizontal: 18.0),
//               child: IntrinsicHeight(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/bed.svg',
//                             color: primaryColor,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             controllerImp.data[0].propertyDetails!.bed
//                                     .toString() +
//                                 ' beds'.tr,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 13,
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: VerticalDivider(),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/washroom.svg',
//                             color: primaryColor,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             controllerImp.data[0].propertyDetails!.bath
//                                     .toString() +
//                                 ' baths'.tr,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: VerticalDivider(),
//                     ),
//                     Expanded(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             'assets/icons/kitchen.svg',
//                             height: 20,
//                             color: primaryColor,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Text(
//                             controllerImp.data[0].propertyDetails!.garage
//                                     .toString() +
//                                 ' kitchens'.tr,
//                             style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//       Divider(),
//     ],
//   ),
// );
// }

Container secondComponentOfDetails(BuildContext context) {
  HouseDetailsControllerImp controllerImp =
      Get.put(HouseDetailsControllerImp());
  return Container(
    padding: EdgeInsets.only(left: 8.0),
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description'.tr,
          style: kh1,
        ),
        Text(controllerImp.data[0].description.toString()),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],
    ),
  );
}

Container thirdComponentOfPhotos(BuildContext context) {
  HouseDetailsControllerImp controllerImp =
      Get.put(HouseDetailsControllerImp());
  return Container(
    height: MediaQuery.of(context).size.height * 0.28,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Photos'.tr,
            style: kh1,
          ),
        ),
        Container(
          height: 100,
          child: listForThirdComp(),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        )
      ],
    ),
  );
}

ListView listForThirdComp() {
  HouseDetailsControllerImp controller = Get.put(HouseDetailsControllerImp());
  List<String> urlImages = [
    'assets/images/house.jpg',
    'assets/images/house1.jpg',
    'assets/images/house2.jpg',
    'assets/images/house3.jpg',
    'assets/images/house4.jpg',
    'assets/images/house5.jpg'
  ];
  return ListView.builder(
      itemCount: urlImages.length + 1,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            index == 0
                ? SizedBox(
                    width: 8,
                  )
                : Container(
                    margin: EdgeInsets.only(right: 8.0),
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                AppLinks.serverNameImgeThumbnail +
                                    controller.data[0].thumbnail!))),
                  ),
          ],
        );
      });
}

Container fourthComponent(BuildContext context) {
  HouseDetailsControllerImp controllerImp =
      Get.put(HouseDetailsControllerImp());
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.25,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Property Details',
          style: kh1,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            Text(
              '    BosPhorus Views',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            Text(
              '    Telephone',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            Text(
              '    Family Villa',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/check.svg',
              height: 20,
              color: primaryColor,
            ),
            Text(
              '    Internet',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],
    ),
  );
}

Container fifthComponent(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location'.tr,
          style: kh1,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.red,
          ),
          child: GoogleMappCustom(),
        ),
        SizedBox(
          height: 10,
        ),
        Divider()
      ],
    ),
  );
}

Container sixthComponent(BuildContext context) {
  HouseDetailsControllerImp controllerImp =
      Get.put(HouseDetailsControllerImp());

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    height: MediaQuery.of(context).size.height * 0.35,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us'.tr,
          style: kh1,
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: controllerImp.data[0].user!.image == null
              ? CircleAvatar(
                  maxRadius: 45,
                  backgroundColor: AppColors.green,
                )
              : CircleAvatar(
                  maxRadius: 45,
                  backgroundImage: NetworkImage(
                      controllerImp.data[0].user!.image.toString()),
                ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
            child: Text(
          controllerImp.data[0].user!.fName.toString(),
          style: TextStyle(
              color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16),
        )),
        Center(
            child: Text(
          controllerImp.data[0].user!.type.toString(),
          style: TextStyle(color: Colors.black, fontSize: 13),
        )),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    "tel:" + controllerImp.data[0].user!.mobile.toString()));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_in_talk,
                      color: primaryColor,
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "call".tr,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse("https://wa.me/" +
                    controllerImp.data[0].user!.mobile.toString()));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mark_chat_read_outlined,
                      color: primaryColor,
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'wahtsapp',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () async {
                await launchUrl(Uri.parse(
                    "mailto:" + controllerImp.data[0].user!.email.toString()));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[200]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mail,
                      color: primaryColor,
                      size: 17,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Message'.tr,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

class GoogleMappCustom extends StatefulWidget {
  const GoogleMappCustom({super.key});

  @override
  State<GoogleMappCustom> createState() => _GoogleMappCustomState();
}

class _GoogleMappCustomState extends State<GoogleMappCustom> {
  HouseDetailsControllerImp controllerImp =
      Get.put(HouseDetailsControllerImp());
  LatLng center = const LatLng(33.86, 35.72);
  GoogleMapController? _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
          zoomGesturesEnabled: true,
          markers: {
            Marker(
                markerId: MarkerId(controllerImp.data[0].id.toString()),
                position: LatLng(33.86, 35.72),
                // position: LatLng(double.parse(controllerImp.data[0].lat!),
                //     double.parse(controllerImp.data[0].lat!)),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                    title: controllerImp.data[0].state!.name,
                    snippet: controllerImp.data[0].city!.name))
          },
          initialCameraPosition: CameraPosition(target: center, zoom: 6.1),
          mapType: MapType.terrain,
          onMapCreated: (controller) {
            setState(() {
              _controller = controller;
            });
          },
          onTap: (coordinates) =>
              _controller!.animateCamera(CameraUpdate.newLatLng(coordinates))),
    );
  }
}
