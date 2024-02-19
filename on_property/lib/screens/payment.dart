import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:on_property/components/reusable_textfield.dart';
import 'package:on_property/control/payment_controller.dart';
import 'package:on_property/core/class/status_request.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/core/functions/validinput.dart';
import 'package:on_property/utils/colorscheme.dart';
import 'package:on_property/widgets/custom_button.dart';
import 'package:on_property/widgets/custom_number_mobile_form.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    PaymentControllerImp controller = Get.put(PaymentControllerImp());
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          title: Text(
            "Direct payment".tr,
            style: TextStyle(
                color: AppColors.blackColor3,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
          leading: IconButton(
              onPressed: () {
                controller.GotoBack();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.blackColor3,
                size: 30,
              ))),
      body: SingleChildScrollView(
        child: Column(children: [
          controller.transferOfficeId == 1
              ? Image.asset(
                  "assets/images/omt.png",
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                )
              : Image.asset(
                  "assets/images/wish.jpg",
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Please send to the name".tr,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Elham Jamal Ismail",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Attach a copy of the transfer here".tr,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Username'.tr,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                ReusableTextField(
                  myController: controller.name,
                  valid: (valeu) {
                    return validInput(valeu!, 2, 30, "username");
                  },
                  ontapIcon: () {
                    // controller.showPassword();
                  },
                  hint: 'Username'.tr,
                ),
                SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                Text(
                  'Note'.tr,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                ReusableTextField(
                  myController: controller.note,
                  valid: (valeu) {
                    return validInput(valeu!, 0, 1000, "username");
                  },
                  ontapIcon: () {
                    // controller.showPassword();
                  },
                  hint: 'Note'.tr,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'A copy of the transfer notice'.tr,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                GetBuilder<PaymentControllerImp>(
                  builder: (controller) => Container(
                      height: 175,
                      margin:
                          EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: AppColors.green)),
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
                GetBuilder<PaymentControllerImp>(
                    builder: (controller) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: controller.statusRequest ==
                                  StatusRequest.loading
                              ? Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: primaryColor),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: AppColors.whiteColor,
                                  )),
                                )
                              : CustomButton(
                                  title: controller.statusRequest ==
                                          StatusRequest.loading
                                      ? CircularProgressIndicator().toString()
                                      : 'SUBMIT NOW'.tr,
                                  callback: () {
                                    controller.addPpaymentToServer();
                                  },
                                ),
                        )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ]),
      ),
    ));
  }
}
