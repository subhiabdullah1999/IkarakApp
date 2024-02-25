import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:on_property/control/drawer_controller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/services/services.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/dashboard.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  DrawerControllerImp controller = Get.put(DrawerControllerImp());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerControllerImp>(
        builder: (controller) => Container(
              width: 200,
              child: Drawer(
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Container(
                        height: 200,
                        child: controller.data.isEmpty
                            ? Loading()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print('dashboard');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DashBoard(
                                                    page: 4,
                                                  )));
                                    },
                                    child: controller.data[0].image == null
                                        ? Container(
                                            height: 75,
                                            margin: EdgeInsets.only(
                                                left: 12, right: 6.0),
                                            width: 75,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Center(
                                              child: CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.white54,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 75,
                                            margin: EdgeInsets.only(
                                                left: 12, right: 6.0),
                                            width: 75,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.greenAccent,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        controller.data[0].image
                                                            .toString()))),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    controller.data[0].fName.toString() +
                                        " " +
                                        controller.data[0].lName.toString(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    "emaile : " +
                                        controller.data[0].email.toString(),
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.black54),
                                  )
                                ],
                              ),
                      ),
                      Divider(
                        color: dividerColor,
                      ),
                      drawerTile(
                          title: 'Home',
                          svgIconLoc: 'assets/icons/home_drawer.svg',
                          routeName: 'Dashboard'),
                      Divider(
                        color: dividerColor,
                      ),
                      drawerTile(
                          title: 'Add property',
                          svgIconLoc: 'assets/icons/add_property.svg',
                          routeName: controller.myServices.sharedPreferences
                                      .get("id") ==
                                  null
                              ? "SignIn"
                              : controller.cridetNumber == 0
                                  ? "PackgesAds"
                                  : 'AddProperty'),
                      Divider(
                        color: dividerColor,
                      ),
                      // drawerTile(
                      //     title: 'Search Properties',
                      //     svgIconLoc: 'assets/icons/search_property.svg',
                      //     routeName: 'SearchProperty'),
                      // Divider(
                      //   color: dividerColor,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => DashBoard(
                      //                 page: 1,
                      //               )),
                      //     );
                      //   },
                      //   child: Container(
                      //     height: 40,
                      //     child: Row(
                      //       children: [
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         SvgPicture.asset(
                      //           'assets/icons/new_project.svg',
                      //           color: dividerTextColor,
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           'New Projects'.tr,
                      //           style: TextStyle(color: dividerTextColor),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Divider(
                      //   color: dividerColor,
                      // ),
                      drawerTile(
                          title: 'Settings',
                          svgIconLoc: 'assets/icons/setting.svg',
                          routeName: 'Settings'),
                      Divider(
                        color: dividerColor,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => DashBoard(page: 2)),
                      //     );
                      //   },
                      //   child: Container(
                      //     height: 40,
                      //     child: Row(
                      //       children: [
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         SvgPicture.asset(
                      //           'assets/icons/favourite.svg',
                      //           color: dividerTextColor,
                      //         ),
                      //         SizedBox(
                      //           width: 10,
                      //         ),
                      //         Text(
                      //           'Favourites'.tr,
                      //           style: TextStyle(color: dividerTextColor),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Divider(
                      //   color: dividerColor,
                      // ),
                      // drawerTile(
                      //     title: 'Saved Searches',
                      //     svgIconLoc: 'assets/icons/saved_searches.svg',
                      //     routeName: 'SavedSearches'),
                      // Divider(
                      //   color: dividerColor,
                      // ),
                      // drawerTile(
                      //     title: 'Agents',
                      //     svgIconLoc: 'assets/icons/agents.svg',
                      //     routeName: 'Agents'),
                      // Divider(
                      //   color: dividerColor,
                      // ),
                      // drawerTile(
                      //     title: 'News and Blog',
                      //     svgIconLoc: 'assets/icons/news_and_blog.svg',
                      //     routeName: 'NewsAndBlog'),
                      // Divider(
                      //   color: dividerColor,
                      // ),
                      drawerTile(
                          title: 'About Us',
                          svgIconLoc: 'assets/icons/about_us.svg',
                          routeName: 'AboutUs'),
                      Divider(
                        color: dividerColor,
                      ),
                      drawerTile(
                          title: 'Contact Us',
                          svgIconLoc: 'assets/icons/contact_us.svg',
                          routeName: 'ContactUs'),
                      Divider(
                        color: dividerColor,
                      ),
                      drawerTile(
                          title: 'Legal documents'.tr,
                          svgIconLoc: 'assets/icons/leagl.svg',
                          routeName: 'LeagleDoucments'),
                      Divider(
                        color: dividerColor,
                      ),
                      drawerTile(
                          title: 'Terms and Policies',
                          svgIconLoc: 'assets/icons/terms_and_privacy.svg',
                          routeName: 'TermsAndConditions'),
                      Divider(
                        color: dividerColor,
                      ),
                      drawerTile(
                          title: 'Log Out',
                          svgIconLoc: 'assets/icons/logout.svg',
                          routeName: 'SignIn'),
                      Divider(
                        color: dividerColor,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  drawerTile({String? title, String? svgIconLoc, String? routeName}) {
    return GestureDetector(
      onTap: () async {
        if (routeName == "SignIn") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.clear();
          Navigator.pushNamed(context, routeName!);
        } else {
          Navigator.pushNamed(context, routeName!);
        }
      },
      child: Container(
        height: 40,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              svgIconLoc!,
              color: dividerTextColor,
              height: 20,
              width: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              title!.tr,
              style: TextStyle(color: dividerTextColor),
            )
          ],
        ),
      ),
    );
  }
}
