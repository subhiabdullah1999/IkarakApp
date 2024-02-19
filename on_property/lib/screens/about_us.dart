import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/components/aboutus_componetns.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              bannerForAboutUS(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "about_us_desc".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87, height: 2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: listViewAboutUs(),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'CopyRight ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 11,
                    width: 11,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                        child: Text(
                      'R',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 9),
                    )),
                  ),
                  Text(
                    ' 2023 Ikarak',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'www.ibits-Itd.me',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
