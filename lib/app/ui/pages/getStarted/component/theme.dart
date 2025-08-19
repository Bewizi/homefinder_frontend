import 'package:flutter/material.dart';

class TextColors {
  static Color primaryText = const Color.fromRGBO(255, 255, 255, 1);
  static Color primaryButton = const Color.fromRGBO(79, 70, 229, 1);
}

ThemeData primaryTextTheme = ThemeData(
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      color: TextColors.primaryText,
      fontWeight: FontWeight.w700,
    ),

    titleMedium: TextStyle(
      fontSize: 14,
      color: TextColors.primaryText,
      fontWeight: FontWeight.w400,
    ),
  ),
);
