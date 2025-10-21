import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/core/presentation/constant/svgs.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';
import 'package:homefinder/features/getStarted/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splashScreen';

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
      backgroundColor: AppColors.kBrand50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppSvgs.kLogo,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(height: 16),
            TextHeading(
              'Homefinder',
              fontSize: 36.sp,
              color: AppColors.kWhite,
              fontStyle: FontStyle.italic,
            ),
          ],
        ),
      ),
    );
  }
}
