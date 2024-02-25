import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/screens/onboarding/onboarding_screen1.dart';

import 'package:on_property/utils/colorscheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    init();
    // new Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //       builder: (BuildContext context) => IntroductionPage()
    //       // SignUpWithOptions()
    //       ));
    // });
  }

  Future<Timer> init() async {
    return Timer(const Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var status = _prefs.getBool('isLoggedIn') ?? false;
    var statusVisit = _prefs.getBool('visit') ?? false;
    var showIntro = _prefs.getBool('showIntro') ?? false;

    print(status);
    // print(PreferencesKeys.token.isNotEmpty);
    print("----------------2--------");

    if (this.mounted) {
      if (status || statusVisit || showIntro) {
        print("----------------3--------");
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (BuildContext context) =>
        Navigator.pushReplacementNamed(context, 'Dashboard');
        // ),
        //);
      } else {
        print("----------------4--------");
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const IntroductionPage(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                image: DecorationImage(
                    // fit: BoxFit.fill,
                    image: AssetImage('assets/images/logoIkarak.PNG')),
              ),
              // child: Center(
              //   child: Image.asset(
              //     'assets/images/ik.png',
              //     height: 150,
              //     width: 150,
              //     // color: Colors.white,
              //   ),
              // ),
            ),
            Text(
              "Towards a new horizon".tr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.blackColor3, fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
