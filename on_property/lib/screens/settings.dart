import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:on_property/control/setting_controller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/custom_button.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isSwitched1 = true;
  bool _isSwitched2 = false;

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    Get.put(SettingsControllerImp());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Settings'.tr,
                style: TextStyle(color: Colors.grey),
              ),
              iconTheme: IconThemeData(color: Colors.grey),
              // actions: [
              //   GestureDetector(
              //       child: Container(
              //           height: 40,
              //           width: 40,
              //           padding: EdgeInsets.all(8.0),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10.0),
              //               color: Colors.transparent),
              //           child: Padding(
              //             padding: const EdgeInsets.all(0.0),
              //             child: SvgPicture.asset(
              //               'assets/icons/location.svg',
              //               color: Colors.grey,
              //               height: 20,
              //             ),
              //           )),
              //       onTap: () {
              //         Navigator.pushNamed(context, 'Location');
              //       }),
              //   GestureDetector(
              //       child: Container(
              //           height: 40,
              //           width: 40,
              //           padding: EdgeInsets.all(8.0),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10.0),
              //               color: Colors.transparent),
              //           child: Padding(
              //             padding: const EdgeInsets.all(0.0),
              //             child: SvgPicture.asset(
              //               'assets/icons/bell.svg',
              //               color: Colors.grey,
              //               height: 20,
              //             ),
              //           )),
              //       onTap: () {
              //         Navigator.pushNamed(context, 'Notifications');
              //       }),
              // ],
            ),
            body: GetBuilder<SettingsControllerImp>(
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      _profileImg(),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Name'.tr),
                      TextField(
                        enabled: false,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            hintText: myServices.sharedPreferences
                                    .getString("fname")! +
                                " " +
                                myServices.sharedPreferences
                                    .getString("lname")!,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Email'.tr),
                      TextField(
                        enabled: false,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            hintText: myServices.sharedPreferences
                                .getString("email")!,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Text('Address'.tr),
                      // TextField(
                      //   cursorColor: primaryColor,
                      //   decoration: InputDecoration(
                      //       hintText: '045, Gaylord Walks Apt,003',
                      //       focusedBorder: UnderlineInputBorder(
                      //           borderSide: BorderSide(color: primaryColor))),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Phone Number'.tr),
                      TextField(
                        enabled: false,
                        cursorColor: primaryColor,
                        decoration: InputDecoration(
                            hintText: myServices.sharedPreferences
                                .getString("mobile")!,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: primaryColor))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'FACEBOOK'.tr,
                      //       style: TextStyle(color: Colors.grey),
                      //     ),
                      //     Spacer(),
                      //     Switch(
                      //         value: _isSwitched1,
                      //         onChanged: (val) {
                      //           setState(() {
                      //             _isSwitched1 = val;
                      //             print(val);
                      //           });
                      //         })
                      //   ],
                      // ),
                      // Divider(),
                      // Row(
                      //   children: [
                      //     Text(
                      //       'Notifications'.tr,
                      //       style: TextStyle(color: Colors.grey),
                      //     ),
                      //     Spacer(),
                      //     Switch(
                      //         value: _isSwitched2,
                      //         onChanged: (val) {
                      //           setState(() {
                      //             _isSwitched2 = val;
                      //             print(val);
                      //           });
                      //         })
                      //   ],
                      // ),
                      Divider(),

                      GestureDetector(
                        onTap: () {
                          controller.popDeletAccount();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 20),
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: AppColors.redcolor),
                          child: Center(
                              child: Text(
                            "Delete My Account".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }

  _profileImg() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          CircleAvatar(
            maxRadius: 60,
            backgroundColor: AppColors.green,
          ),
          // Positioned(
          //     right: 0,
          //     top: MediaQuery.of(context).size.height * 0.15 / 2 + 35,
          //     child: CircleAvatar(
          //       backgroundColor: Colors.grey[300],
          //       child: Icon(
          //         Icons.camera_alt,
          //         color: primaryColor,
          //       ),
          //     ))
        ],
      ),
    );
  }
}
