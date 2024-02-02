import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_property/control/home_controller.dart';
import 'package:on_property/utils/colorscheme.dart';

class HeartContainer extends StatefulWidget {
  final int index;
  HeartContainer(this.index);
  @override
  _HeartContainerState createState() => _HeartContainerState();
}

List<bool> selected = [];

class _HeartContainerState extends State<HeartContainer> {
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    for (var i = 0; i < controller.data.length; i++) {
      selected.add(false);
      controller.updateUi();
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          selected[widget.index] = !selected[widget.index];
        });
      },
      child: Container(
        child: selected[widget.index]
            ? Icon(
                Icons.favorite,
                color: primaryColor,
                size: 22,
              )
            : Icon(
                Icons.favorite_border,
                size: 22,
              ),
      ),
    );
  }
}
