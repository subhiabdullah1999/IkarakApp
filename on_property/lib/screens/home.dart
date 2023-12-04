import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_property/components/carousal.dart';
import 'package:on_property/components/home_componets.dart';
import 'package:on_property/components/textfield_with_filter.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/utils/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textFieldWithFilter(context: context),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest Projects',
                            style: kh3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'SeeAllScreen');
                            },
                            child: Text(
                              'SEE ALL',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    listForSecondComponent(),

                    /*.............Carousal..........................*/

                    appCarousal(context),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 30.0, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Properties Near You',
                            style: kh3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'SeeAllScreen');
                            },
                            child: Text(
                              'SEE ALL',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: listForThirdComponent(),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 10,
              bottom: 15,
              child: InkWell(
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
            )
          ],
        ),
      ),
    );
  }
}
