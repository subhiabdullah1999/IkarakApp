import 'package:flutter/material.dart';
import 'package:on_property/core/constans/appColors.dart';

ThemeData themArabic = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 14,
          fontFamily: "Cairo",
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 13,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));

ThemeData themEnglish = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 14,
          fontFamily: "playFireDisplay",
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 13,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));
