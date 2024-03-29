import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/control/otp_controller.dart';
import 'package:on_property/utils/constants.dart';

class OptForm extends StatefulWidget {
  @override
  _OptFormState createState() => _OptFormState();
}

class _OptFormState extends State<OptForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    OtpControllerImp controller = Get.put(OtpControllerImp());
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Container(
          //   height: 60,
          //   width: 50,
          //   child: TextFormField(
          //       autofocus: true,
          //       style: TextStyle(fontSize: 18),
          //       obscureText: true,
          //       onChanged: (value) {
          //         controller.otp = value;
          //         nextField(value: value, focusNode: pin2FocusNode);
          //       },
          //       keyboardType: TextInputType.number,
          //       textAlign: TextAlign.center,
          //       decoration: optInputDecoration),
          // ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 18),
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin2FocusNode);
                  controller.otp = value;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                autofocus: false,
                style: TextStyle(fontSize: 18),
                focusNode: pin2FocusNode,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin3FocusNode);
                  controller.otp = controller.otp! + value;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 18),
                focusNode: pin3FocusNode,
                obscureText: true,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin4FocusNode);
                  controller.otp = controller.otp! + value;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 18),
                focusNode: pin4FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin5FocusNode);
                  controller.otp = controller.otp! + value;
                },
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 18),
                focusNode: pin5FocusNode,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  nextField(value: value, focusNode: pin6FocusNode);
                  controller.otp = controller.otp! + value;
                },
                decoration: optInputDecoration),
          ),
          Container(
            height: 60,
            width: 50,
            child: TextFormField(
                style: TextStyle(fontSize: 18),
                obscureText: true,
                focusNode: pin6FocusNode,
                onChanged: (value) {
                  pin6FocusNode.unfocus();
                  controller.otp = controller.otp! + value;
                },
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: optInputDecoration),
          ),
        ],
      ),
    );
  }
}
