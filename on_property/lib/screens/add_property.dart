import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:on_property/components/add_property_comp.dart';
import 'package:on_property/control/add_prop_controller.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/banner_for_add_property.dart';
import 'package:on_property/widgets/bathrooms_container.dart';
import 'package:on_property/widgets/bedrooms_container.dart';
import 'package:on_property/widgets/custom_button.dart';

class AddProperty extends StatefulWidget {
  @override
  _AddPropertyState createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  List searchPropertyCategories = [true, true, true, true];
  List selectedSearchPropertyCategories = [false, false, false, false];
  bool selectedColorForPropertyType1 = true;
  bool selectedColorForPropertyType2 = false;
  bool selectedColorForPropertyType3 = false;
  dynamic selectedView;

  dynamic _provinceValue;

  dynamic _cityValue;
  final List<dynamic> _countryCode = ['+1', '+92', "+61", '+31', '+51', '269'];
  dynamic _countryValue;

  @override
  void initState() {
    super.initState();

    selectedView = 0;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(AddPropControllerImp());
    List<Widget> propertyViews = [
      _residentialView(),
      _commercialView(),
      _industrialView()
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AddPropControllerImp>(
            builder: (controller) => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BannerForAddProperty(),
                      _titleAndDescription(),
                      // _areaField(),
                      _priceField(),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'Property Type'.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      CustomTypeProp(),
                      // _rowOfButtons(),
                      // Container(
                      //   child: propertyViews[selectedView],
                      // ),
                      /*...........................Bedrooms.......................*/
                      controller.sub_category_id == 1 ||
                              controller.sub_category_id == 5 ||
                              controller.sub_category_id == 6
                          ? BedroomsContainer()
                          : SizedBox(),

                      controller.sub_category_id == 1 ||
                              controller.sub_category_id == 5 ||
                              controller.sub_category_id == 6
                          ? BathroomContainer()
                          : SizedBox(),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          "Choose the main image".tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GetBuilder<AddPropControllerImp>(
                        builder: (controller) => Container(
                            height: 150,
                            margin: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8.0),
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xfffafafa),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: controller.fileThambianl == null
                                ? InkWell(
                                    onTap: () {
                                      controller
                                          .ChoseImageFromeGelaryOreCameraTambinal();
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 150,
                                    width: double.infinity,
                                    child: Image.file(
                                      controller.fileThambianl!,
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Text(
                          'Select Images'.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /* ..................Grid View........................*/
                      _customGridView(),
                      SizedBox(
                        height: 10,
                      ),
                      /*........................Text of Country PKR and Change History...........*/
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          children: [
                            Text(
                              'Country  '.tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                            Text(
                              '(LB)',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                            Spacer(),
                            // Text(
                            //   'Change Country'.tr,
                            //   style: TextStyle(color: primaryColor, fontSize: 17),
                            // )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        child:
                            addPropertyTextField('Address', controller.address),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: AddPropertyTextField(
                            initialValue: controller
                                        .myServices.sharedPreferences
                                        .get("email") ==
                                    null
                                ? 'Email'.tr
                                : controller.myServices.sharedPreferences
                                    .get("email")
                                    .toString(),
                          )
                          // addPropertyTextField('Email'.tr, controller.email,),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                          child: _countryCodeAndPhoneNumberField()),
                      SizedBox(
                        height: 10,
                      ),
                      _rowOfDropDowns(),
                      SizedBox(
                        height: 30,
                      ),
                      /*.......................Submit Button.................................*/
                      GetBuilder<AddPropControllerImp>(
                          builder: (controller) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: controller.statusRequest ==
                                        StatusRequest.loading
                                    ? Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            color: primaryColor),
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: AppColors.whiteColor,
                                        )),
                                      )
                                    : CustomButton(
                                        title: 'SUBMIT NOW'.tr,
                                        callback: () {
                                          controller.addPropToServer();
                                        },
                                      ),
                              )),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
      ),
    );
  }

  _titleAndDescription() {
    AddPropControllerImp controller = Get.put(AddPropControllerImp());
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: controller.formstateAddProp,
        child: Column(
          children: [
            addPropertyTextField(
              'Title',
              controller.titel,
            ),
            SizedBox(height: 10),
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xfffafafa),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: TextFormField(
                controller: controller.descr,
                maxLines: 3,
                style: TextStyle(fontSize: 14),
                keyboardType: TextInputType.text,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15, top: 5),
                  hintText: 'Description'.tr,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _areaField() {
    AddPropControllerImp controller = Get.put(AddPropControllerImp());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Area '.tr,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '( Sq Feet )',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                'Change Area Unit'.tr,
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: addPropertyTextField('Area ', controller.area),
        ),
      ],
    );
  }

  _priceField() {
    AddPropControllerImp controller = Get.put(AddPropControllerImp());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Price '.tr,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                '( USD )',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                'Change Currency'.tr,
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: addPropertyTextField('Price ', controller.price),
        )
      ],
    );
  }

  // _rowOfButtons() {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 18.0),
  //       child: GridView.builder(
  //         itemCount: ,
  //           gridDelegate:
  //               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
  //           itemBuilder: (context, index) {
  //             return InkWell(
  //               onTap: () {},
  //               child: Container(
  //               height: 40,
  //               decoration: BoxDecoration(
  //                   color: selectedColorForPropertyType1 == true
  //                       ? primaryColor
  //                       : Colors.white,
  //                   borderRadius: BorderRadius.circular(20.0),
  //                   border: Border.all(
  //                       color: selectedColorForPropertyType1 == true
  //                           ? primaryColor
  //                           : Colors.grey.shade300)),
  //               child: Center(
  //                 child: Text(
  //                   'Residential'.tr,
  //                   style: TextStyle(
  //                       fontWeight: FontWeight.bold,
  //                       color: selectedColorForPropertyType1 == true
  //                           ? Colors.white
  //                           : Colors.black),
  //                 ),
  //               ),
  //             ),
  //             );
  //           })

  // Row(
  //   children: [
  //     Expanded(
  //       child: GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             selectedView = 0;
  //             selectedColorForPropertyType1 = true;
  //             selectedColorForPropertyType2 = false;
  //             selectedColorForPropertyType3 = false;

  //             print(selectedView);
  //           });
  //         },
  //         child: Container(
  //           height: 40,
  //           decoration: BoxDecoration(
  //               color: selectedColorForPropertyType1 == true
  //                   ? primaryColor
  //                   : Colors.white,
  //               borderRadius: BorderRadius.circular(20.0),
  //               border: Border.all(
  //                   color: selectedColorForPropertyType1 == true
  //                       ? primaryColor
  //                       : Colors.grey.shade300)),
  //           child: Center(
  //             child: Text(
  //               'Residential'.tr,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: selectedColorForPropertyType1 == true
  //                       ? Colors.white
  //                       : Colors.black),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     SizedBox(
  //       width: 10,
  //     ),
  //     Expanded(
  //       child: GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             selectedView = 1;
  //             print(selectedView);
  //             selectedColorForPropertyType1 = false;
  //             selectedColorForPropertyType2 = true;
  //             selectedColorForPropertyType3 = false;
  //           });
  //         },
  //         child: Container(
  //           height: 40,
  //           decoration: BoxDecoration(
  //               color: selectedColorForPropertyType2 == true
  //                   ? primaryColor
  //                   : Colors.white,
  //               borderRadius: BorderRadius.circular(20.0),
  //               border: Border.all(
  //                   color: selectedColorForPropertyType2 == true
  //                       ? primaryColor
  //                       : Colors.grey.shade300)),
  //           child: Center(
  //             child: Text(
  //               'Commercial'.tr,
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: selectedColorForPropertyType2 == true
  //                       ? Colors.white
  //                       : Colors.black),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     SizedBox(
  //       width: 10,
  //     ),
  //     Expanded(
  //       child: GestureDetector(
  //         onTap: () {
  //           setState(() {
  //             selectedView = 2;
  //             print(selectedView);

  //             selectedColorForPropertyType1 = false;
  //             selectedColorForPropertyType2 = false;
  //             selectedColorForPropertyType3 = true;
  //           });
  //         },
  //         child: Container(
  //           height: 40,
  //           width: 120,
  //           decoration: BoxDecoration(
  //               color: selectedColorForPropertyType3 == true
  //                   ? primaryColor
  //                   : Colors.white,
  //               borderRadius: BorderRadius.circular(20.0),
  //               border: Border.all(
  //                   color: selectedColorForPropertyType3 == true
  //                       ? primaryColor
  //                       : Colors.grey.shade300)),
  //           child: Center(
  //             child: Text('Industrial'.tr,
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: selectedColorForPropertyType3 == true
  //                       ? Colors.white
  //                       : Colors.black,
  //                 )),
  //           ),
  //         ),
  //       ),
  //     )
  //   ],
  // ),
  //       );
  // }

  _residentialView() {
    return Container(
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[1] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Residential'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Commercial'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Upper portion'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lower portion'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }

  _commercialView() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2] ==
                          searchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2] ==
                              searchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Upper portion'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lower portion'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Residential'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[0] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Commercial'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }

  _industrialView() {
    return Container(
      height: 120,
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[2] =
                        !selectedSearchPropertyCategories[2];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[3] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[2]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Uper.svg',
                      color: selectedSearchPropertyCategories[2]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Upper portion'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[3] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[1] ==
                          searchPropertyCategories[1]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/appartment.svg',
                      color: selectedSearchPropertyCategories[1] ==
                              searchPropertyCategories[1]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Commercial'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[3] =
                        !selectedSearchPropertyCategories[3];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[0] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[3] ==
                          searchPropertyCategories[3]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/Lower.svg',
                      color: selectedSearchPropertyCategories[3] ==
                              searchPropertyCategories[3]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Lower portion'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSearchPropertyCategories[0] =
                        !selectedSearchPropertyCategories[0];
                    selectedSearchPropertyCategories[1] = false;
                    selectedSearchPropertyCategories[2] = false;
                    selectedSearchPropertyCategories[1] = false;
                  });
                },
                child: CircleAvatar(
                  maxRadius: 36,
                  backgroundColor: selectedSearchPropertyCategories[0] ==
                          searchPropertyCategories[0]
                      ? primaryColor
                      : Colors.grey,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: 35,
                    child: SvgPicture.asset(
                      'assets/icons/house.svg',
                      color: selectedSearchPropertyCategories[0] ==
                              searchPropertyCategories[0]
                          ? primaryColor
                          : Colors.grey,
                      height: 35,
                      width: 35,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Residential'.tr,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }

  _countryCodeAndPhoneNumberField() {
    AddPropControllerImp controller = Get.put(AddPropControllerImp());
    return Row(
      children: <Widget>[
        Container(
          child: Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.grey.shade300)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconEnabledColor: Colors.grey[500],
                  iconDisabledColor: Colors.grey[500],
                  hint: Text(
                    '+961',
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  style: TextStyle(color: Colors.grey[500]),
                  value: _countryValue,
                  onChanged: (newValue) {
                    setState(() {
                      _countryValue = newValue;
                    });
                  },
                  items: [],
                  //  _countryCode.map((value) {
                  //   return DropdownMenuItem(
                  //     value: value,
                  //     child: Text(value),
                  //   );
                  // }).toList(),
                  isExpanded: false,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          child: Flexible(
              flex: 7,
              child: TextFormField(
                  initialValue: controller.myServices.sharedPreferences
                      .get("mobile")
                      .toString(),
                  enabled: false,
                  style: TextStyle(fontSize: 14),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      fillColor: Color(0xfffafafa),
                      filled: true,
                      hintText: 'Phone Number'.tr,
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: primaryColor)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(color: Colors.orange)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(color: Colors.grey.shade300))))),
        ),
      ],
    );
  }

  _customGridView() {
    Get.put(AddPropControllerImp());
    return GetBuilder<AddPropControllerImp>(
        builder: (controller) => Container(
              height: 250,
              margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.circular(10.0)),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: List.generate(6, (index) {
                  if (controller.fileImages.length <= index) {
                    return InkWell(
                      onTap: () {
                        controller.ChoseImageFromeGelaryOreCamwra();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Image.file(controller.fileImages[index]));
                  }
                }),
              ),
            ));
  }

  _rowOfDropDowns() {
    Get.put(AddPropControllerImp());
    return GetBuilder<AddPropControllerImp>(
        builder: (controller) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        child: Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            decoration: BoxDecoration(
                                color: Color(0xfffafafa),
                                borderRadius: BorderRadius.circular(30.0),
                                border:
                                    Border.all(color: Colors.grey.shade300)),
                            child: DropdownButtonHideUnderline(
                                child: GetBuilder<AddPropControllerImp>(
                              builder: (controller) => DropdownButton(
                                iconEnabledColor: Colors.grey[500],
                                iconDisabledColor: Colors.grey[500],
                                hint: Text(
                                  'Choose Province'.tr,
                                  style: TextStyle(color: Colors.grey[500]),
                                ),
                                style: TextStyle(color: Colors.grey[500]),
                                value: _provinceValue,
                                onChanged: (newValue) {
                                  setState(() async {
                                    _provinceValue = newValue;
                                    controller.indexState =
                                        controller.data[controller.i].id;
                                    await controller.getStateCityData();

                                    print(
                                        "ffffffffffffffffffssssssssssaaaaaaaaaaas");
                                    print(controller.indexState);
                                    print(
                                        "ffffffffffffffffffssssssssssaaaaaaaaaaas");
                                  });
                                },
                                items: controller.data.map((value) {
                                  int ii = controller.i =
                                      controller.data.indexOf(value);
                                  return DropdownMenuItem(
                                    onTap: () {
                                      controller.i =
                                          controller.data.indexOf(value);
                                    },
                                    value: value,
                                    child: Text(controller.data[ii].name!),
                                  );
                                }).toList(),
                                isExpanded: true,
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.dataNameStateCity.isEmpty
                          ? SizedBox()
                          : Container(
                              child: Flexible(
                                flex: 1,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xfffafafa),
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                          color: Colors.grey.shade300)),
                                  child: DropdownButtonHideUnderline(
                                      child: GetBuilder<AddPropControllerImp>(
                                    builder: (controller) => DropdownButton(
                                      iconEnabledColor: Colors.grey[500],
                                      iconDisabledColor: Colors.grey[500],
                                      hint: Text(
                                        'Choose city'.tr,
                                        style:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                      style: TextStyle(color: Colors.grey[500]),
                                      value: _cityValue,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _cityValue = newValue!;
                                          controller.indexCity = controller
                                              .dataCity[controller.iii].id;
                                        });
                                      },
                                      items: controller.dataCity.map((value) {
                                        controller.iii =
                                            controller.dataCity.indexOf(value);
                                        int ii =
                                            controller.dataCity.indexOf(value);
                                        controller.showMap = true;

                                        return DropdownMenuItem(
                                          onTap: () {
                                            controller.iii = controller.dataCity
                                                .indexOf(value);
                                          },
                                          value: value,
                                          child: Text(
                                              controller.dataCity[ii].name!),
                                        );
                                      }).toList(),
                                      isExpanded: true,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                    ],
                  ),
                  controller.showMap == true
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Add the location to the map".tr,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13),
                              ),
                            ),
                            GoogelMapLocation()
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ));
  }
}

class GoogelMapLocation extends StatelessWidget {
  const GoogelMapLocation({super.key});

  @override
  Widget build(BuildContext context) {
    AddPropControllerImp controller = Get.put(AddPropControllerImp());
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 250,
      width: double.infinity,
      child: GoogleMap(
        markers: controller.markers.toSet(),
        onTap: (latlong) {
          controller.addMarkers(latlong);
        },
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(33.86, 35.72), zoom: 7.7),
        onMapCreated: (GoogleMapController controllerpage) {
          controller.completer.complete(controllerpage);
        },
      ),
    );
  }
}

class CustomTypeProp extends StatelessWidget {
  const CustomTypeProp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPropControllerImp());
    return GetBuilder<AddPropControllerImp>(
        builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              // padding: EdgeInsets.symmetric(vertical: 2),
              height: 150,
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.salePrope.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 2),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        int subCatId = index + 1;
                        controller.sub_category_id = subCatId;
                        print("iu8888888888999999999999900000000007777777");
                        print(subCatId);
                        print(controller.sub_category_id);

                        print("iu8888888888999999999999900000000007777777");

                        controller.selectedProp = index;
                        controller.updatUi();
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        height: 40,
                        decoration: BoxDecoration(
                            color: controller.selectedProp == index
                                ? primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                                color: controller.selectedProp == index
                                    ? primaryColor
                                    : Colors.grey.shade300)),
                        child: Center(
                          child: Text(
                            controller.salePrope[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: controller.selectedProp == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }),
            )

            // Row(
            //   children: [
            //     Expanded(
            //       child: GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedView = 0;
            //             selectedColorForPropertyType1 = true;
            //             selectedColorForPropertyType2 = false;
            //             selectedColorForPropertyType3 = false;

            //             print(selectedView);
            //           });
            //         },
            //         child: Container(
            //           height: 40,
            //           decoration: BoxDecoration(
            //               color: selectedColorForPropertyType1 == true
            //                   ? primaryColor
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(20.0),
            //               border: Border.all(
            //                   color: selectedColorForPropertyType1 == true
            //                       ? primaryColor
            //                       : Colors.grey.shade300)),
            //           child: Center(
            //             child: Text(
            //               'Residential'.tr,
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: selectedColorForPropertyType1 == true
            //                       ? Colors.white
            //                       : Colors.black),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedView = 1;
            //             print(selectedView);
            //             selectedColorForPropertyType1 = false;
            //             selectedColorForPropertyType2 = true;
            //             selectedColorForPropertyType3 = false;
            //           });
            //         },
            //         child: Container(
            //           height: 40,
            //           decoration: BoxDecoration(
            //               color: selectedColorForPropertyType2 == true
            //                   ? primaryColor
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(20.0),
            //               border: Border.all(
            //                   color: selectedColorForPropertyType2 == true
            //                       ? primaryColor
            //                       : Colors.grey.shade300)),
            //           child: Center(
            //             child: Text(
            //               'Commercial'.tr,
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: selectedColorForPropertyType2 == true
            //                       ? Colors.white
            //                       : Colors.black),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Expanded(
            //       child: GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedView = 2;
            //             print(selectedView);

            //             selectedColorForPropertyType1 = false;
            //             selectedColorForPropertyType2 = false;
            //             selectedColorForPropertyType3 = true;
            //           });
            //         },
            //         child: Container(
            //           height: 40,
            //           width: 120,
            //           decoration: BoxDecoration(
            //               color: selectedColorForPropertyType3 == true
            //                   ? primaryColor
            //                   : Colors.white,
            //               borderRadius: BorderRadius.circular(20.0),
            //               border: Border.all(
            //                   color: selectedColorForPropertyType3 == true
            //                       ? primaryColor
            //                       : Colors.grey.shade300)),
            //           child: Center(
            //             child: Text('Industrial'.tr,
            //                 style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: selectedColorForPropertyType3 == true
            //                       ? Colors.white
            //                       : Colors.black,
            //                 )),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            ));
  }
}
