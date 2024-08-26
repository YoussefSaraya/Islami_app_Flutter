import 'package:flutter/material.dart';
import 'package:islami/app_colors.dart';

class MyThemeData {
  ///colors,light mode and dark mode themes
  static final ThemeData lightTheme = ThemeData(
      canvasColor: AppColors.primaryLightColor,
      primaryColor: AppColors.primaryLightColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.blackColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.blackColor,
          unselectedItemColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryLightColor),
      textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.blackColor),
      bodySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    canvasColor: AppColors.primaryDarkColor,
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.whiteColor)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.goldColor,
        unselectedItemColor: AppColors.whiteColor,
        backgroundColor: AppColors.primaryDarkColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor),
      bodySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.goldColor),
    ),
  );
}
