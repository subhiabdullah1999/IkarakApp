import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/components/horizontal_line.dart';
import 'package:on_property/control/otp_controller.dart';
import 'package:on_property/core/constans/appColors.dart';

import 'package:on_property/utils/constants.dart';
import 'package:on_property/widgets/custom_button.dart';
import 'package:on_property/widgets/opt_form.dart';

class OtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OtpControllerImp contrller = Get.put(OtpControllerImp());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  'Enter Code'.tr,
                  style: kh1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Tap the input Field to Enter 6-Character Code'.tr),
                horizontalLine(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),

                /*..........................Otp Form..............................*/
                OptForm(),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  callback: () {
                    contrller.VerfCode();
                  },
                  title: 'Continue'.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Resend'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                )),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  contrller.myServices.sharedPreferences.get("otp").toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: AppColors.green),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
