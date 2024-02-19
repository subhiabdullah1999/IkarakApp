import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_property/components/reusable_textfield.dart';
import 'package:on_property/control/sign_in_controller.dart';
import 'package:on_property/utils/colorscheme.dart';

import 'package:on_property/widgets/custom_button.dart';
import 'package:on_property/widgets/custom_number_mobile_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/functions/validinput.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfff3f3f4),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(),
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
          backgroundColor: Colors.white,
          body: GetBuilder<SignInControllerImp>(
            builder: (controller) => Form(
              key: controller.formstateSignIn,
              child: SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*....................................Log Back into your Account.....................*/
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'SIGN IN'.tr,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Log Back Into Your Account'.tr),
                    Container(
                      height: 5,
                      width: 70,
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Text(
                      'Phone Number'.tr,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomNumberMobileWidget(
                        fullNumber: (val) {
                          // controller.phoneNumber = val!.toString();
                          // print("sfrssaggggggggggggggggggwwwwwwwwwwwwww");
                          // print(controller.phoneNumber);
                          // print("sfrssaggggggggggggggggggwwwwwwwwwwwwww");
                        },
                        valid: (valeu) {
                          return validInput(valeu!, 3, 20, "phone");
                        },
                        mycontroller: controller.phoneNumber,
                        keyboardType: TextInputType.phone,
                        hintText: 'Phone Number'.tr,
                        iconData: Icons.mobile_friendly_outlined),

                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Password'.tr,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ReusableTextField(
                        valid: (valeu) {
                          return validInput(valeu!, 5, 30, "password");
                        },
                        obsc: controller.isShowwPassword,
                        ontapIcon: () {
                          controller.showPassword();
                        },
                        hint: 'Enter Password'.tr,
                        myController: controller.password),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'ForgotPassword');
                        },
                        child: Text(
                          'Forgot Password?'.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    /* ..........................Sign In Now Button....................*/
                    CustomButton(
                      callback: () async {
                        controller.logInUser();
                        SharedPreferences _prefs =
                            await SharedPreferences.getInstance();
                        _prefs.setBool("isLoggedIn", true);
                      },
                      title: 'Sign In Now'.tr,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // Center(
                    //   child: Text(
                    //     'or Continue With',
                    //     style: TextStyle(color: Colors.grey),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // /*  ..........................Row of Two Containers.........................*/
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     socialMediaButton(
                    //         img: 'assets/icons/google.png',
                    //         callback: () {},
                    //         text: 'Google',
                    //         color: Colors.grey.shade200),
                    //     socialMediaButton(
                    //         img: 'assets/icons/fb.png',
                    //         callback: () {},
                    //         text: 'Facebook',
                    //         color: Colors.grey.shade200),
                    //   ],
                    // ),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                    /*........................Row of Dont have an account text..................*/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an Account? '.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'SignUp');
                            },
                            child: Text(
                              'Sign Up'.tr,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ))
                      ],
                    ),

                    // SizedBox(
                    //   height: 25,
                    // ),

                    // CustomButton(
                    //   callback: () async {
                    //     controller.signInVisit();
                    //   },
                    //   title: "Visitor login".tr,
                    // ),
                  ],
                ),
              )),
            ),
          )),
    );
  }
}
