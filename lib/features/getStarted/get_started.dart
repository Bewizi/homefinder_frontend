import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homefinder/core/presentation/constant/image.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/app_buttons.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  static const String routeName = '/getStarted';

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.kImageFx,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.kEerieBlack,
                  AppColors.kEerieBlack.withValues(alpha: 0.0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 35, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextHeading(
                  text: 'Discover your Perfect Rental\nHome Just a Tap Away',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kWhite,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                TextRegular(
                  text:
                      'Search, compare, and rent your home - fast and easy\nwith Homefinder. Thousands of listing. Zero hassle.',
                  color: AppColors.kWhite,
                ),
                SizedBox(height: 28.h),
                CustomButton(
                  text: 'Get Started',
                  onTap: () {},
                  textColor: AppColors.kWhite,
                  color: AppColors.kBrand50,
                ),

                SizedBox(height: 28.h),

                AppRichText(
                  textSpan: [
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: AppColors.kBrand50,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                  text: ' Already have an account? ',
                  color: AppColors.kWhite,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
*
* Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 35,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    TextHeading(
                      text:
                          'Discover your Perfect Rental\nHome Just a Tap Away',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.kWhite,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    TextRegular(
                      text:
                          'Search, compare, and rent your home - fast and easy\nwith Homefinder. Thousands of listing. Zero hassle.',
                      color: AppColors.kWhite,
                    ),
                    SizedBox(height: 28.h),
                    CustomButton(
                      text: 'Get Started',
                      onTap: () {},
                      textColor: AppColors.kWhite,
                      color: AppColors.kBrand50,
                    ),

                    SizedBox(height: 28.h),

                    AppRichText(
                      textSpan: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: AppColors.kBrand50,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                      text: ' Already have an account? ',
                      color: AppColors.kWhite,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
*
*
*
*  */
