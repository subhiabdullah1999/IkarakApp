import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:on_property/components/copyright.dart';
import 'package:on_property/components/reusable_textfield.dart';
import 'package:on_property/components/textfield_with_filter.dart';
import 'package:on_property/control/search_controller.dart';
import 'package:on_property/screens/add_property.dart';
import 'package:on_property/utils/colorscheme.dart';

import 'package:on_property/widgets/custom_button.dart';

class SearchProperty extends StatefulWidget {
  @override
  State<SearchProperty> createState() => _SearchPropertyState();
}

class _SearchPropertyState extends State<SearchProperty> {
  SearchControllerImp controller = Get.put(SearchControllerImp());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchPropertyBody(),
      ),
    );
  }
}

class SearchPropertyBody extends StatefulWidget {
  @override
  _SearchPropertyBodyState createState() => _SearchPropertyBodyState();
}

class _SearchPropertyBodyState extends State<SearchPropertyBody> {
  int selectedView = 1;
  List propertyViews = [];

  List searchPropertyCategories = [true, true, true, true];
  List selectedSearchPropertyCategories = [true, false, false, false];
  List<bool> selectedProperty = [false, false, false, false];
  bool forSaleSelected = true;
  bool forRentSelected = false;
  bool forBuySelected = false;
  dynamic _provinceValue;
  dynamic _cityValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SearchControllerImp controller = Get.put(SearchControllerImp());

    List propertyViews = [
      _industrialView(),
      _commercialView(),
      _residentialView()
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldWithFilter(context: context, callback: () {}),
          SizedBox(height: 10),
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.category_id = 1;
                        controller.typeProp = "Sale";
                        setState(() {
                          forSaleSelected = true;
                          forBuySelected = false;
                          forRentSelected = false;
                          print(forSaleSelected);
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: forSaleSelected == true
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(20.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'FOR SALE'.tr,
                            style: TextStyle(
                                color: forSaleSelected == true
                                    ? Colors.white
                                    : Colors.grey,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.category_id = 2;
                        controller.typeProp = "Rent";

                        setState(() {
                          forSaleSelected = false;
                          forBuySelected = true;
                          forRentSelected = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 10,
                        decoration: BoxDecoration(
                            color: forBuySelected == true
                                ? primaryColor
                                : Colors.white),
                        child: Center(
                            child: Text(
                          'FOR RENT'.tr,
                          style: TextStyle(
                              color: forBuySelected == true
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 14),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.category_id = 3;
                          controller.typeProp = "Inver";

                          forSaleSelected = false;
                          forBuySelected = false;
                          forRentSelected = true;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 10,
                        decoration: BoxDecoration(
                          color: forRentSelected == true
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(20.0),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          "For investment".tr,
                          style: TextStyle(
                              color: forRentSelected == true
                                  ? Colors.white
                                  : Colors.grey,
                              fontSize: 15),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Property Type'.tr,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),
          // _rowOfButtons(),
          // Container(
          //   child: propertyViews[selectedView],
          // ),
          SizedBox(
            height: 2,
          ),

          GetBuilder<SearchControllerImp>(
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                int subCatId = index + 1;
                                controller.sub_category_id = subCatId;
                                print(
                                    "iu8888888888999999999999900000000007777777");
                                print(subCatId);
                                print(controller.sub_category_id);

                                print(
                                    "iu8888888888999999999999900000000007777777");

                                controller.selectedProp = index;
                                controller.updatUi();
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
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
                    ),
                  )),
          SizedBox(
            height: 2,
          ),

          _rowOfDropDowns(),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          //   child: reusableTextField(
          //       // myController: controller.serchValue,
          //       hint: 'Search Properties'.tr,
          //       icon: Icon(Icons.search)),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: reusableTextField(
          //       hint: 'Zip code,Location,Country or City'.tr,
          //       icon: Icon(Icons.room)),
          // ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            title: 'Search'.tr,
            callback: () {
              controller.goToResultSearch();
            },
          ),
          SizedBox(
            height: 30,
          ),
          copyright(),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  _rowOfDropDowns() {
    Get.put(SearchControllerImp());
    return GetBuilder<SearchControllerImp>(
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
                                child: GetBuilder<SearchControllerImp>(
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
                                      child: GetBuilder<SearchControllerImp>(
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
                                        // controller.showMap = true;

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
                  // controller.showMap == true
                  //     ? Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(top: 10),
                  //             child: Text(
                  //               "Add the location to the map".tr,
                  //               style: TextStyle(
                  //                   color: Colors.grey,
                  //                   fontWeight: FontWeight.w500,
                  //                   fontSize: 13),
                  //             ),
                  //           ),
                  //           GoogelMapLocation()
                  //         ],
                  //       )
                  //     : SizedBox()

                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 25),
                    child: reusableTextField(
                        myController: controller.serchValue,
                        hint: 'Search Properties'.tr,
                        icon: Icon(Icons.search)),
                  ),
                ],
              ),
            ));
  }

  _rowOfButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 0;
                  selectedProperty[0] = true;
                  selectedProperty[1] = false;
                  selectedProperty[2] = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedProperty[0] == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedProperty[0] == true
                            ? primaryColor
                            : Colors.grey.shade300)),
                child: Center(
                  child: Text(
                    'Residential'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: selectedProperty[0] == true
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 1;
                  selectedProperty[0] = false;
                  selectedProperty[1] = true;
                  selectedProperty[2] = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: selectedProperty[1] == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedProperty[1] == true
                            ? primaryColor
                            : Colors.grey.shade300)),
                child: Center(
                  child: Text(
                    'Commercial'.tr,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: selectedProperty[1] == true
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedView = 2;
                  selectedProperty[0] = false;
                  selectedProperty[1] = false;
                  selectedProperty[2] = true;
                });
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    color: selectedProperty[2] == true
                        ? primaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: selectedProperty[2] == true
                            ? primaryColor
                            : Colors.grey.shade300)),
                child: Center(
                  child: Text('Industrial'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: selectedProperty[2] == true
                            ? Colors.white
                            : Colors.black,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[0] =
                        searchPropertyCategories[0]) {
                      selectedSearchPropertyCategories[0] =
                          !searchPropertyCategories[0];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[0] =
                          searchPropertyCategories[0]) {
                        selectedSearchPropertyCategories[0] =
                            !searchPropertyCategories[0];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[0] =
                            searchPropertyCategories[0]) {
                          selectedSearchPropertyCategories[0] =
                              !searchPropertyCategories[0];
                        }
                      }
                    }
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
                        !selectedSearchPropertyCategories[2];
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[0] =
                          searchPropertyCategories[0]) {
                        selectedSearchPropertyCategories[0] =
                            !searchPropertyCategories[0];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[0] =
                            searchPropertyCategories[0]) {
                          selectedSearchPropertyCategories[0] =
                              !searchPropertyCategories[0];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[0] =
                        searchPropertyCategories[0]) {
                      selectedSearchPropertyCategories[0] =
                          !searchPropertyCategories[0];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[0] =
                          searchPropertyCategories[0]) {
                        selectedSearchPropertyCategories[0] =
                            !searchPropertyCategories[0];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    selectedSearchPropertyCategories[1] =
                        !selectedSearchPropertyCategories[1];
                    if (selectedSearchPropertyCategories[0] =
                        searchPropertyCategories[0]) {
                      selectedSearchPropertyCategories[0] =
                          !searchPropertyCategories[0];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[0] =
                            searchPropertyCategories[0]) {
                          selectedSearchPropertyCategories[0] =
                              !searchPropertyCategories[0];
                        }
                      }
                    }
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
                    if (selectedSearchPropertyCategories[1] =
                        searchPropertyCategories[1]) {
                      selectedSearchPropertyCategories[1] =
                          !searchPropertyCategories[1];
                      if (selectedSearchPropertyCategories[2] =
                          searchPropertyCategories[2]) {
                        selectedSearchPropertyCategories[2] =
                            !searchPropertyCategories[2];
                        if (selectedSearchPropertyCategories[3] =
                            searchPropertyCategories[3]) {
                          selectedSearchPropertyCategories[3] =
                              !searchPropertyCategories[3];
                        }
                      }
                    }
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
}
