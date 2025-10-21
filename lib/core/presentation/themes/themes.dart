import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';

class AppThemeData {
  static lightTheme() => ThemeData(
    fontFamily: GoogleFonts.dmSans().fontFamily,
    scaffoldBackgroundColor: AppColors.kWhite,
    primaryColor: AppColors.kBrand50,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.kBrand50,
      secondary: AppColors.kJet,
      error: AppColors.kRed,
      onError: AppColors.kWhite,
      surface: AppColors.kWhite,
      onPrimary: AppColors.kWhite,
      onSecondary: AppColors.kBlack,
      onSurface: AppColors.kBlack,
      onSurfaceVariant: AppColors.kJet,
      primaryContainer: AppColors.kBrand50,
    ),
  );
}
