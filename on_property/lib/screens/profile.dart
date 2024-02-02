import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/components/profile_components.dart';
import 'package:on_property/control/profile_controller.dart';
import 'package:on_property/widgets/loading.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: GetBuilder<ProfileControllerImp>(
              builder: (controller) => controller.data.isEmpty
                  ? Center(child: Loading())
                  : Column(
                      children: [
                        Expanded(
                          child: ProfileCustom(),
                        ),
                      ],
                    ))),
    );
  }
}
