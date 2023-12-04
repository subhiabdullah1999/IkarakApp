import 'package:carousel_nullsafety/carousel_nullsafety.dart' as carusel;
import 'package:flutter/material.dart';

appCarousal(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.30,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
    margin: EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0, bottom: 18.0),
    child: carusel.Carousel(
      radius: Radius.circular(10.0),
      dotSize: 4,
      animationCurve: Curves.ease,
      borderRadius: true,
      showIndicator: true,
      noRadiusForIndicator: false,
      dotBgColor: Colors.transparent,
      images: [
        ExactAssetImage('assets/images/carousal1.jpg'),
        ExactAssetImage('assets/images/carousal2.jpg'),
        ExactAssetImage('assets/images/carousal3.jpg'),
        ExactAssetImage('assets/images/house.jpg'),
        ExactAssetImage('assets/images/house1.jpg'),
        ExactAssetImage('assets/images/house2.jpg'),
      ],
    ),
  );
}
