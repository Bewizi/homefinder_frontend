import 'package:flutter/material.dart';

class AppColors {
  static Color scaffoldBackground = const Color.fromRGBO(251, 253, 255, 1);
  static Color primaryButton = const Color.fromRGBO(79, 70, 229, 1);
  static Color splashScreen = const Color.fromRGBO(79, 70, 229, 1);
  static Color primaryText = const Color.fromRGBO(79, 70, 229, 1);
  static Color primaryButtonText = const Color.fromRGBO(2, 70, 229, 1);
  static Color textGray = const Color.fromRGBO(122, 122, 122, 1);
  static Color textBlack = const Color.fromRGBO(17, 17, 17, 1);
  static Color borderColor = const Color.fromRGBO(234, 234, 234, 1);
  static Color buttonBackground = const Color.fromRGBO(238, 242, 255, 1);
  static Color splashScreenText = const Color.fromRGBO(255, 255, 255, 1);
}

ThemeData primaryTheme = ThemeData(
  //   scaffold color
  scaffoldBackgroundColor: AppColors.scaffoldBackground,

  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      color: AppColors.textBlack,
      fontWeight: FontWeight.w700,
    ),

    titleMedium: TextStyle(
      fontSize: 16,
      color: AppColors.textBlack,
      fontWeight: FontWeight.w500,
    ),

    titleSmall: TextStyle(
      fontSize: 14,
      color: AppColors.textGray,
      fontWeight: FontWeight.w400,
    ),
  ),
);
