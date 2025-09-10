import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  static Color AliceBlue = const Color.fromRGBO(238, 242, 255, 1);
  static Color darkGray = const Color.fromRGBO(82, 82, 82, 1);
}

class AppFontSize {
  static double? titleSmall = 14;
}

ThemeData primaryTheme = ThemeData(
  //   scaffold color
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  fontFamily: GoogleFonts.dmSans().fontFamily,

  // Text Large Size 24
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24,
      color: AppColors.textBlack,
      fontWeight: FontWeight.w700,
    ),

    // Text Medium Size 16-20
    titleMedium: TextStyle(
      fontSize: 16,
      color: AppColors.textBlack,
      fontWeight: FontWeight.w500,
    ),

    // Text Small Size 10-14
    titleSmall: TextStyle(
      fontSize: AppFontSize.titleSmall,
      color: AppColors.textGray,
      fontWeight: FontWeight.w400,
    ),

    // Text Small Size 14
    displaySmall: TextStyle(
      fontSize: 14,
      color: AppColors.primaryText,
      fontWeight: FontWeight.w400,
    ),
  ),
);
