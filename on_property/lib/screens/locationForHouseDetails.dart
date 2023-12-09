import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_property/control/loc_hous_detailes_controler.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/utils/colorscheme.dart';

class LocationForHouseDetails extends StatefulWidget {
  @override
  _LocationForHouseDetailsState createState() =>
      _LocationForHouseDetailsState();
}

Future<void> scanQR() async {
  String barcodeScners;
  try {
    barcodeScners = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "cancel", true, ScanMode.QR);
    debugPrint(barcodeScners);
  } on PlatformException {
    barcodeScners = "failed to get platform version";
  }
}

class _LocationForHouseDetailsState extends State<LocationForHouseDetails> {
  final Set<Marker> _markers = {};
  static const LatLng _center = const LatLng(33.8547, 35.8623);
  LatLng _lastMapPosition = _center;

  GoogleMapController? _controller;

  @override
  void initState() {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(33.888630, 35.495480),
          icon: BitmapDescriptor.defaultMarker));
      _markers.add(Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(11.6758, 92.7624),
          icon: BitmapDescriptor.defaultMarker));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    Get.put(LocationHousDetailescontrollerImp());
    return SafeArea(
        child: GetBuilder<LocationHousDetailescontrollerImp>(
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                  zoomGesturesEnabled: true,
                  markers: _markers,
                  initialCameraPosition:
                      CameraPosition(target: _center, zoom: 8.0),
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  onTap: (coordinates) => _controller!
                      .animateCamera(CameraUpdate.newLatLng(coordinates))),
            ),
            Positioned(
              right: 1,
              top: 15,
              child: GetBuilder<LocationHousDetailescontrollerImp>(
                builder: (controller) => InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        context: context,
                        builder: (context) {
                          controller.typeSearch = "type";
                          return BottomSheet(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25))),
                              onClosing: () {},
                              builder: (context) {
                                return GetBuilder<
                                    LocationHousDetailescontrollerImp>(
                                  builder: (controller) => ListView(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 30),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                controller.typeIkar();
                                              },
                                              child: Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    // color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                      color: controller
                                                                  .typeSearch ==
                                                              "type"
                                                          ? primaryColor
                                                          : Colors.grey,
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/search1.svg',
                                                      // color: typeSearch == "type"
                                                      //     ? primaryColor
                                                      //     : Colors.grey,
                                                      height: 32,
                                                      width: 32,
                                                    ),
                                                    Text(
                                                      "Property Type".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.mobileNumber();
                                              },
                                              child: Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    // color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                      color: controller
                                                                  .typeSearch ==
                                                              "mobile"
                                                          ? primaryColor
                                                          : Colors.grey,
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/mobile.svg',
                                                      // color: Colors.green,
                                                      height: 32,
                                                      width: 32,
                                                    ),
                                                    Text(
                                                      'Phone Number'.tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                controller.gR();
                                                scanQR();
                                              },
                                              child: Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    // color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                      color: controller
                                                                  .typeSearch ==
                                                              "QR"
                                                          ? primaryColor
                                                          : Colors.grey,
                                                    )),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      'assets/icons/QR.svg',
                                                      // color: Colors.green,
                                                      height: 32,
                                                      width: 32,
                                                    ),
                                                    Text(
                                                      "QR code".tr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                          fontStyle:
                                                              FontStyle.italic),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      controller.typeSearch == "type"
                                          ? Container(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  bottom: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "View marketing requests"
                                                            .tr,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle: FontStyle
                                                                .italic),
                                                      ),
                                                      Switch(
                                                        value: true,
                                                        onChanged: (bool t) {},
                                                        activeColor:
                                                            primaryColor,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "the address".tr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          25),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          25))),
                                                          context: context,
                                                          builder: (context) {
                                                            return BottomSheet(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                25),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                25))),
                                                                onClosing:
                                                                    () {},
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              20,
                                                                          vertical:
                                                                              20),
                                                                      height:
                                                                          200,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              25)),
                                                                      child:
                                                                          ListView(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {},
                                                                                child: Container(
                                                                                  height: 50,
                                                                                  width: 70,
                                                                                  decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(15)),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Ok".tr,
                                                                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "map location".tr,
                                                                                      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 8,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.arrow_forward,
                                                                                      color: primaryColor,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.symmetric(vertical: 5),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  "city".tr,
                                                                                  style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () {
                                                                                    showModalBottomSheet(
                                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return BottomSheet(
                                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                                                                                              onClosing: () {},
                                                                                              builder: (context) {
                                                                                                return Container(
                                                                                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                                                                                    height: 200,
                                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                                                                                                    child: ListView(
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                          children: [
                                                                                                            InkWell(
                                                                                                              onTap: () {
                                                                                                                Navigator.of(context).pop();
                                                                                                              },
                                                                                                              child: Row(
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    "city".tr,
                                                                                                                    style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                                                                                                                  ),
                                                                                                                  SizedBox(
                                                                                                                    width: 8,
                                                                                                                  ),
                                                                                                                  Icon(
                                                                                                                    Icons.arrow_forward,
                                                                                                                    color: primaryColor,
                                                                                                                  )
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Container(
                                                                                                          padding: EdgeInsets.symmetric(vertical: 5),
                                                                                                          child: Column(
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                "city".tr,
                                                                                                                style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                                                                                                              ),
                                                                                                              TextFormField(
                                                                                                                decoration: InputDecoration(
                                                                                                                    label: Text("Select city".tr),
                                                                                                                    prefix: SvgPicture.asset(
                                                                                                                      'assets/icons/search1.svg',
                                                                                                                      color: primaryColor,
                                                                                                                      height: 20,
                                                                                                                      width: 20,
                                                                                                                    ),
                                                                                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                                                                                                              )
                                                                                                            ],
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                    ));
                                                                                              });
                                                                                        });
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                                                    height: 55,
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color.fromARGB(255, 197, 207, 212)),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Select city".tr,
                                                                                          style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ));
                                                                });
                                                          });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      height: 55,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Color.fromARGB(
                                                              255,
                                                              197,
                                                              207,
                                                              212)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/pin.svg',
                                                            color: primaryColor,
                                                            height: 20,
                                                            width: 20,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "Select the city, property type, all destinations"
                                                                .tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Property Type".tr,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      showModalBottomSheet(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          25),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          25))),
                                                          context: context,
                                                          builder: (context) {
                                                            return BottomSheet(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.only(
                                                                        topLeft:
                                                                            Radius.circular(
                                                                                25),
                                                                        topRight:
                                                                            Radius.circular(
                                                                                25))),
                                                                onClosing:
                                                                    () {},
                                                                builder:
                                                                    (context) {
                                                                  return Container(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              20,
                                                                          vertical:
                                                                              20),
                                                                      height:
                                                                          200,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              25)),
                                                                      child:
                                                                          ListView(
                                                                        children: [
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {},
                                                                                child: Container(
                                                                                  height: 50,
                                                                                  width: 70,
                                                                                  decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(15)),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      "Ok".tr,
                                                                                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  Navigator.of(context).pop();
                                                                                },
                                                                                child: Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      "Property Type".tr,
                                                                                      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 8,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.arrow_forward,
                                                                                      color: primaryColor,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ));
                                                                });
                                                          });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      height: 55,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Color.fromARGB(
                                                              255,
                                                              197,
                                                              207,
                                                              212)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "All for rent".tr,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          : Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "ادخل رقم صاحب الاعلان",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FontStyle.italic),
                                                  ),
                                                  TextFormField(
                                                    keyboardType:
                                                        TextInputType.phone,
                                                    decoration: InputDecoration(
                                                        label: Text("الرقم"),
                                                        prefix:
                                                            SvgPicture.asset(
                                                          'assets/icons/mobile.svg',
                                                          color: primaryColor,
                                                          height: 20,
                                                          width: 20,
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10))),
                                                  )
                                                ],
                                              ),
                                            ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              bottom: 20, left: 10, right: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Center(
                                            child: Text(
                                              "Search".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        });
                  },
                  child: Container(
                    height: 50,
                    width: 78,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/search1.svg',
                          // color: Colors.white,
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          "Search".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 5,
              bottom: 15,
              child: Column(
                mainAxisAlignment:
                    myServices.sharedPreferences.getString("lang") == "ar"
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                crossAxisAlignment:
                    myServices.sharedPreferences.getString("lang") == "ar"
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'Wishlist');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: SvgPicture.asset(
                        'assets/icons/heart.svg',
                        // color: Colors.white,
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'Home');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: 50,
                      width: 133,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: primaryColor,
                          )),
                      child: Row(
                        children: [
                          myServices.sharedPreferences.getString("lang") == "ar"
                              ? SvgPicture.asset(
                                  'assets/icons/menu2.svg',
                                  // color: Colors.white,
                                  height: 30,
                                  width: 18,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/menu.svg',
                                  // color: Colors.white,
                                  height: 30,
                                  width: 18,
                                ),
                          Text(
                            "Show menu".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
