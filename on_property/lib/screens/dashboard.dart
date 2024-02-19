import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart'
    as animdaialog;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:on_property/components/location_icon.dart';
import 'package:on_property/components/notification_icon.dart';
import 'package:on_property/control/dashboardcontroller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/functions/checkinternet.dart';
import 'package:on_property/core/localization/localizationController.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/screens/add_property.dart';
import 'package:on_property/screens/chat.dart';
import 'package:on_property/screens/home.dart';
import 'package:on_property/screens/locationForHouseDetails.dart';
import 'package:on_property/screens/packges_ads.dart';
import 'package:on_property/screens/profile.dart';
import 'package:on_property/screens/search_properties.dart';
import 'package:on_property/screens/sign_in.dart';
import 'package:on_property/screens/wishlist.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  final int page;

  DashBoard({this.page = 0});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  MyServices myServices = Get.find();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final PageStorageBucket bucket = PageStorageBucket();
  int _currentTab = 0;
  Widget currentScreen = LocationForHouseDetails();
  String? title;

  @override
  void initState() {
    _currentTab = widget.page;
    if (_currentTab == 1) currentScreen = Home();
    if (_currentTab == 2) currentScreen = SearchProperties();
    // if (_currentTab == 3) currentScreen = Wishlist();
    if (_currentTab == 5) currentScreen = Profile();
    title = myServices.sharedPreferences.get("fname") == null
        ? "Hello".tr + " " + "visitor".tr
        : "Hello".tr +
            "," +
            myServices.sharedPreferences.get("fname").toString() +
            " " +
            myServices.sharedPreferences.get("lname").toString();
    checkInterNet();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        appBar: customAppBar(),
        drawer: CustomDrawer(),
        bottomNavigationBar: customBottomNavigationBar(),
        body: Column(
          children: [
            Expanded(
              child: PageStorage(
                child: currentScreen,
                bucket: bucket,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*........................................Bottom Navigation bar.......................*/
  BottomAppBar customBottomNavigationBar() {
    MyServices myServices = Get.find();
    Get.put(DashBoardControllerImp());
    Get.put(LocalizationController());

    return BottomAppBar(
        child: GetBuilder<LocalizationController>(
      builder: (controller) => Container(
        height: 55,
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = LocationForHouseDetails();
                  _currentTab = 0;
                  title = myServices.sharedPreferences.get("fname") == null
                      ? "Hello".tr + " " + "visitor".tr
                      : "Hello".tr +
                          "," +
                          myServices.sharedPreferences.get("fname").toString() +
                          " " +
                          myServices.sharedPreferences.get("lname").toString();
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 28,
                  child: SvgPicture.asset('assets/icons/location.svg',
                      color: _currentTab == 0 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = Home();
                  _currentTab = 1;
                  title = myServices.sharedPreferences.get("lname") == null
                      ? "Hello".tr + " " + "visitor".tr
                      : "Hello".tr +
                          "," +
                          myServices.sharedPreferences.get("fname").toString() +
                          " " +
                          myServices.sharedPreferences.get("lname").toString();
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 28,
                  child: SvgPicture.asset('assets/icons/home.svg',
                      color: _currentTab == 1 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen =
                      controller.myServices.sharedPreferences.get("id") == null
                          ? SignIn()
                          : controller.cridetNumber == 0
                              ? PackgesAds()
                              : AddProperty();
                  _currentTab = 2;
                  title = '';
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 33,
                  child: SvgPicture.asset('assets/icons/plus.svg',
                      color: _currentTab == 2 ? primaryColor : Colors.grey)),
            ),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       currentScreen = Wishlist();
            //       _currentTab = 3;
            //       title = 'Wishlist';
            //     });
            //   },
            //   child: Container(
            //       width: MediaQuery.of(context).size.width * 0.10,
            //       height: 20,
            //       child: SvgPicture.asset('assets/icons/heart.svg',
            //           color: _currentTab == 3 ? primaryColor : Colors.grey)),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     setState(() {
            //       currentScreen = Chat();
            //       _currentTab = 4;
            //       title = 'Chat'.tr;
            //     });
            //   },
            //   child: Container(
            //       width: MediaQuery.of(context).size.width * 0.20,
            //       height: 28,
            //       child: SvgPicture.asset('assets/icons/chat.svg',
            //           color: _currentTab == 4 ? primaryColor : Colors.grey)),
            // ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentScreen = currentScreen =
                      controller.myServices.sharedPreferences.get("id") == null
                          ? SignIn()
                          : Profile();
                  _currentTab = 5;
                  title = 'Profile'.tr;
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 28,
                  child: SvgPicture.asset('assets/icons/profile.svg',
                      color: _currentTab == 5 ? primaryColor : Colors.grey)),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  // currentScreen = LocationForHouseDetails();
                  // _currentTab = 0;
                  title = myServices.sharedPreferences.get("lname") == null
                      ? "Hello".tr + " " + "visitor".tr
                      : "Hello".tr +
                          "," +
                          myServices.sharedPreferences.get("fname").toString() +
                          " " +
                          myServices.sharedPreferences.get("lname").toString();
                  ;

                  animdaialog.showAnimatedDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return animdaialog.CustomDialog(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.45,
                          // padding: EdgeInsets.only(top: 5),
                          child: ListView(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Services".tr,
                                  style: TextStyle(
                                      color: AppColors.blackColor3,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                      "Renting, selling, buying and registering real estate"
                                          .tr,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2),
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.green,
                                    child: Icon(Icons.done),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                      "Services for establishing real estate companies and documenting their trademarks"
                                          .tr,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2),
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.green,
                                    child: Icon(Icons.done),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                      "Real Estate Investment and Marketing Services Management"
                                          .tr,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      overflow: TextOverflow.clip,
                                      maxLines: 2),
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.green,
                                    child: Icon(Icons.done),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                padding: EdgeInsets.all(6),
                                color: primaryColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            await launchUrl(
                                                Uri.parse("tel:71559722"));
                                          },
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                              radius: 25,
                                              child: SvgPicture.asset(
                                                  'assets/icons/contactus1.svg',
                                                  color: primaryColor)),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          'Contact Us'.tr,
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (myServices.sharedPreferences
                                                    .getString("lang") ==
                                                "ar") {
                                              controller.changeLang("en");
                                            } else if (myServices
                                                    .sharedPreferences
                                                    .getString("lang") ==
                                                "en") {
                                              controller.changeLang("ar");
                                            }
                                            print(
                                                "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5");
                                            print(myServices.sharedPreferences
                                                .getString("lang"));
                                          },
                                          child: CircleAvatar(
                                              backgroundColor:
                                                  AppColors.whiteColor,
                                              radius: 25,
                                              child: SvgPicture.asset(
                                                'assets/icons/translation.svg',
                                                height: 35,
                                                // color: primaryColor
                                              )),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        myServices.sharedPreferences
                                                    .getString("lang") ==
                                                "ar"
                                            ? Text(
                                                'العربية',
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            : Text(
                                                'English',
                                                style: TextStyle(
                                                    color: AppColors.whiteColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        // titleText: 'Title',
                        // contentText: 'content',
                        // onPositiveClick: () {
                        //   Navigator.of(context).pop();
                        // },
                        // onNegativeClick: () {
                        //   Navigator.of(context).pop();
                        // },
                      );
                    },
                    animationType:
                        animdaialog.DialogTransitionType.slideFromBottomFade,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(milliseconds: 1000),
                  );
                });
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 28,
                  child: SvgPicture.asset('assets/icons/menu3.svg',
                      color: _currentTab == 4 ? primaryColor : Colors.grey)),
            ),
          ],
        ),
      ),
    ));
  }

  /*........................................Custom AppBar.....................*/
  AppBar customAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title!,
        style: TextStyle(color: Colors.black, fontSize: 14),
      ),
      leading: GestureDetector(
        onTap: () => _drawerKey.currentState!.openDrawer(),
        child: Container(
            height: 40,
            width: 40,
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: Color(0xff979696),
                height: 20,
              ),
            )),
      ),
      // actions: [
      //   locationIcon(context),
      //   notificationIcon(context),
      // ],
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }
}
