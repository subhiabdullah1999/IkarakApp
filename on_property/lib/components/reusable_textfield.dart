import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/control/sign_in_controller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/utils/colorscheme.dart';

class ReusableTextField extends StatelessWidget {
  final String? hint;
  final Icon? icon;
  final TextInputType? keyboard;
  final bool? obsc;
  final void Function()? ontapIcon;
  final String? Function(String?)? valid;

  final TextEditingController? myController;
  ReusableTextField(
      {super.key,
      this.hint,
      this.icon,
      this.keyboard,
      this.myController,
      this.obsc,
      this.ontapIcon,
      required this.valid});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      validator: valid,
      keyboardType: keyboard,
      obscureText: obsc == null || obsc == false ? false : true,
      autocorrect: false,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        prefixIcon: icon,
        contentPadding:
            EdgeInsets.only(left: 16.0, right: 16, top: 12, bottom: 12),
        suffixIcon: hint == 'Enter Password'.tr
            ? GestureDetector(
                onTap: ontapIcon,
                child: Icon(
                  Icons.visibility,
                  color: obsc == false ? AppColors.redcolor : AppColors.green,
                ))
            : null,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xfff5f6f6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: AppColors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: AppColors.green),
        ),
      ),
    );
  }
}

Container reusableTextField(
    {@required String? hint,
    Icon? icon,
    TextInputType? keyboard,
    bool obsc = false,
    TextEditingController? myController}) {
  Get.put(SignInControllerImp());
  return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(30.0)),
      child: GetBuilder<SignInControllerImp>(
        builder: (controller) => TextField(
          controller: myController,
          keyboardType: keyboard,
          obscureText: obsc,
          autocorrect: false,
          cursorColor: primaryColor,
          decoration: InputDecoration(
            prefixIcon: icon,
            contentPadding: EdgeInsets.only(left: 16.0, right: 16),
            suffixIcon: hint == 'Enter Password'
                ? GestureDetector(
                    onTap: () {
                      obsc = !obsc;
                      print("ttttttttttttttttttttttttt");
                      print(obsc);
                      print("ttttttttttttttttttttttttt");
                      //   if (obsc == false) {
                      //     obsc = true;
                      // print("ttttttttttttttttttttttttt");
                      // print(obsc);
                      // print("ttttttttttttttttttttttttt");

                      //     controller.updateUi();
                      //   } else {
                      //     if (obsc == true) {
                      //       obsc = false;
                      //       print("ttttttttttttttttttttttttt");
                      //       print(obsc);
                      //       print("ttttttttttttttttttttttttt");
                      //       controller.updateUi();
                      //     }
                      // }
                      controller.updateUi();
                    },
                    child: Icon(Icons.visibility))
                : null,
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color(0xfff5f6f6),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ));
}
