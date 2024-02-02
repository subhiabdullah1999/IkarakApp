import 'package:flutter/material.dart';
import 'package:on_property/core/constans/appColors.dart';

ThemeData themArabic = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 18,
          fontFamily: "Cairo",
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 15,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));

ThemeData themEnglish = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 18,
          fontFamily: "playFireDisplay",
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 15,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));
