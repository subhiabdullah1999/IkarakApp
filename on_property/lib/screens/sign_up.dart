import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:on_property/components/reusable_textfield.dart';
import 'package:on_property/control/sign_in_controller.dart';
import 'package:on_property/control/sign_up_controller.dart';
import 'package:on_property/core/functions/validinput.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/custom_button.dart';
import 'package:on_property/widgets/custom_number_mobile_form.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfff3f3f4),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<SignUpControllerImp>(
            builder: (controller) => Form(
                  key: controller.formstateSignUp,
                  child: SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /* ....................................Log Back into your Account.....................*/
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text(
                          'Sign Up'.tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Sign Up Now and Get The Best Deal'.tr),
                        Container(
                          height: 5,
                          width: 70,
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          'first name '.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableTextField(
                            valid: (valeu) {
                              return validInput(valeu!, 2, 30, "username");
                            },
                            obsc: controller.isShowwPassword,
                            ontapIcon: () {
                              controller.showPassword();
                            },
                            hint: 'enter first name '.tr,
                            myController: controller.fName),

                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'last name '.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        ReusableTextField(
                            valid: (valeu) {
                              return validInput(valeu!, 2, 30, "username");
                            },
                            obsc: controller.isShowwPassword,
                            ontapIcon: () {
                              controller.showPassword();
                            },
                            hint: 'enter last name '.tr,
                            myController: controller.lName),

                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Phone Number'.tr,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // reusableTextField(
                        //     hint: 'Enter Phone Number', keyboard: TextInputType.phone),
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
                          height: 10,
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
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        /* ..........................Sign In Now Button....................*/

                        CustomButton(
                          callback: () {
                            controller.SignUpUser();
                          },
                          title: 'Sign Up Now'.tr,
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
                        // /* ..........................Row of Two Containers.........................*/

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

                        /* ........................Row of Don't have an account text..................*/
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account? '.tr,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                                onTap: () {
                                  controller.goToLogin();
                                },
                                child: Text(
                                  'SIGN IN'.tr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        )
                      ],
                    ),
                  )),
                )),
      ),
    );
  }
}
