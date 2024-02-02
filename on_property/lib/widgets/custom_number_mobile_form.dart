import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:on_property/utils/colorscheme.dart';

class CustomNumberMobileWidget extends StatelessWidget {
  final String? hintText;
  final IconData? iconData;
  final IconData? suffixicon;
  final String? codeCuntry;

  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final void Function()? ontapIcon;

  final bool? obsc;

  final void Function(PhoneNumber?)? fullNumber;

  const CustomNumberMobileWidget(
      {super.key,
      this.hintText,
      this.iconData,
      this.keyboardType,
      this.mycontroller,
      required this.valid,
      this.obsc,
      this.ontapIcon,
      this.suffixicon,
      this.codeCuntry,
      required this.fullNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // decoration: BoxDecoration(
      //     border: Border.all(color: primaryColor),
      //     borderRadius: BorderRadius.circular(30.0)),
      // padding: const EdgeInsets.symmetric(vertical: 12),
      child: IntlPhoneField(
        onChanged: fullNumber,
        initialCountryCode: "LB",

        obscureText: obsc == null || obsc == false ? false : true,
        // validator: valid,
        controller: mycontroller,
        // keyboardType: keyboardType,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Color(0xfff5f6f6),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
