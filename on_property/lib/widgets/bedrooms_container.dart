import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/control/add_prop_controller.dart';
import 'package:on_property/core/constans/appColors.dart';
import 'package:on_property/utils/colorscheme.dart';

class BedroomsContainer extends StatefulWidget {
  @override
  _BedroomsContainerState createState() => _BedroomsContainerState();
}

class _BedroomsContainerState extends State<BedroomsContainer> {
  AddPropControllerImp controller = Get.put(AddPropControllerImp());
  List<bool> bedRooms = [
    true,
    false,
    false,
    false,
    false,
  ];
  List<bool> bedRoomsSelected = [true, true, true, true, true];
  final jobRoleCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'BEDROOMS'.tr,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     mainAxisSize: MainAxisSize.max,
          //     children: [
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             //for()
          //             bedRoomsSelected[0] = !bedRoomsSelected[0];
          //           });
          //         },
          //         child: Container(
          //           height: 45,
          //           width: 60,
          //           decoration: BoxDecoration(
          //               color: bedRoomsSelected[0] == bedRooms[0]
          //                   ? primaryColor
          //                   : Color(0xfffafafa),
          //               borderRadius: BorderRadius.horizontal(
          //                   left: Radius.circular(30.0))),
          //           child: Center(
          //             child: Text(
          //               '1',
          //               style: TextStyle(
          //                   color: bedRoomsSelected[0] == bedRooms[0]
          //                       ? Colors.white
          //                       : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             bedRoomsSelected[1] = !bedRoomsSelected[1];
          //           });
          //         },
          //         child: Container(
          //           height: 45,
          //           width: 60,
          //           color: bedRoomsSelected[1] == bedRooms[1]
          //               ? primaryColor
          //               : Color(0xfffafafa),
          //           child: Center(
          //             child: Text(
          //               '2',
          //               style: TextStyle(
          //                   color: bedRoomsSelected[1] == bedRooms[1]
          //                       ? Colors.white
          //                       : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             bedRoomsSelected[2] = !bedRoomsSelected[2];
          //           });
          //         },
          //         child: Container(
          //           height: 45,
          //           width: 60,
          //           color: bedRoomsSelected[2] == bedRooms[2]
          //               ? primaryColor
          //               : Color(0xfffafafa),
          //           child: Center(
          //             child: Text(
          //               '3',
          //               style: TextStyle(
          //                   color: bedRoomsSelected[2] == bedRooms[2]
          //                       ? Colors.white
          //                       : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             bedRoomsSelected[3] = !bedRoomsSelected[3];
          //           });
          //         },
          //         child: Container(
          //           height: 45,
          //           width: 60,
          //           color: bedRoomsSelected[3] == bedRooms[3]
          //               ? primaryColor
          //               : Color(0xfffafafa),
          //           child: Center(
          //             child: Text(
          //               '4',
          //               style: TextStyle(
          //                   color: bedRoomsSelected[3] == bedRooms[3]
          //                       ? Colors.white
          //                       : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             bedRoomsSelected[4] = !bedRoomsSelected[4];
          //           });
          //         },
          //         child: Container(
          //           height: 45,
          //           width: 60,
          //           decoration: BoxDecoration(
          //               color: bedRoomsSelected[4] == bedRooms[4]
          //                   ? primaryColor
          //                   : Color(0xfffafafa),
          //               borderRadius: BorderRadius.horizontal(
          //                   right: Radius.circular(30.0))),
          //           child: Center(
          //             child: Text(
          //               '4+',
          //               style: TextStyle(
          //                   color: bedRoomsSelected[4] == bedRooms[4]
          //                       ? Colors.white
          //                       : Colors.black),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomDropdown(
              onChanged: (item) {
                controller.bed = item.toString();
              },
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: AppColors.green),
              selectedStyle: TextStyle(color: AppColors.oraColor),
              hintText: "Choose the number".tr,
              items: const ['0', '1', '2', '3', '4', '5', '+5'],
              controller: jobRoleCtrl,
            ),
          )
        ],
      ),
    );
  }
}
