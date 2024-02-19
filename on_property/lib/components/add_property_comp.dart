import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/control/add_prop_controller.dart';
import 'package:on_property/utils/colorscheme.dart';

addPropertyTextField(
  String title,
  TextEditingController? controller,
) {
  String? Function(String?)? validator;
  String? initaiValue;

  return Container(
    height: 50,
    child: TextFormField(
      initialValue: initaiValue,
      validator: validator,
      controller: controller,
      style: TextStyle(fontSize: 13),
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        fillColor: Color(0xfffafafa),
        filled: true,
        hintText: title.tr,
        hintStyle: TextStyle(color: Colors.grey[500]),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: Colors.grey.shade300)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(color: primaryColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          // borderSide: BorderSide(color: Colors.orange)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          //borderSide: BorderSide(color: Colors.orange)
        ),
      ),
    ),
  );
}

class AddPropertyTextField extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const AddPropertyTextField(
      {super.key,
      this.initialValue,
      this.validator,
      this.controller,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        controller: controller,
        style: TextStyle(fontSize: 13),
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          fillColor: Color(0xfffafafa),
          filled: true,
          hintText: title?.tr,
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: primaryColor)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            // borderSide: BorderSide(color: Colors.orange)
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            //borderSide: BorderSide(color: Colors.orange)
          ),
        ),
      ),
    );
    ;
  }
}
