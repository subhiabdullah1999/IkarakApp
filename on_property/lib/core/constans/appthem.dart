import 'package:My_Meal_on/core/constans/appColors.dart';
import 'package:flutter/material.dart';

ThemeData themArabic = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 25,
          fontFamily: "Cairo",
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 20,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));

ThemeData themEnglish = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 25,
          fontFamily: "playFireDisplay",
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        color: AppColors.gry,
        fontSize: 20,
        height: 1.3,
        fontFamily: "Cairo",
      ),
    ));
