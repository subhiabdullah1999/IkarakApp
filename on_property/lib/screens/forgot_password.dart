import 'package:flutter/material.dart';
import 'package:on_property/components/horizontal_line.dart';
import 'package:on_property/components/reusable_textfield.dart';
import 'package:on_property/utils/constants.dart';
import 'package:on_property/widgets/custom_button.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'FORGOT PASSWORD',
                style: kh1,
              ),
              SizedBox(height: 8),
              Text(
                'Please Enter Your  Phone Number to Reset Your Password',
                style: TextStyle(color: Colors.black87),
              ),
              horizontalLine(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Phone Number',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              reusableTextField(
                  hint: 'Enter Phone Number', keyboard: TextInputType.phone),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomButton(
                title: 'Send Now',
                callback: () {
                  Navigator.pushNamed(context, 'OtpScreen');
                },
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                'Cancel',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
