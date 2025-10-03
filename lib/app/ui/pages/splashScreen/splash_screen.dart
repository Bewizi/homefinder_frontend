import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homefinder/app/ui/pages/getStarted/get_started.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:homefinder/constant/image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // wait for 3 seconds then navigate
    Future.delayed(const Duration(milliseconds: 5000), () {
      context.go(GetStarted.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreen,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.logo, height: 80, width: 80),
              const SizedBox(height: 16),
              Text(
                'Homefinder',
                style: GoogleFonts.dmSans(
                  fontSize: 36,
                  color: AppColors.splashScreenText,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
