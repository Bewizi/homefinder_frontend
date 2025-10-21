import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/core/presentation/constant/svgs.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/app_buttons.dart';
import 'package:homefinder/core/presentation/ui/widgets/app_input_field.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';
import 'package:homefinder/features/auth/otp/otp_verification.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static const String routeName = '/forgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 91.h, bottom: 24.h),
              child: Column(
                children: [
                  TextHeading(
                    'Forgot Password?',
                    color: AppColors.kEerieBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 4.h),
                  TextRegular(
                    'We’ll send you a code to securely reset  your password ',
                    color: AppColors.kBattleshipGray,
                    fontSize: 12,
                  ),

                  SizedBox(height: 24.h),

                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // email address
                          AppField(
                            title: 'Email Address',
                            controller: _emailAddressController,
                            hintText: 'Example@gmail.com',
                            prefix: SvgPicture.asset(
                              AppSvgs.kEmailIcon,
                              width: 16.w,
                              height: 16.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          // send otp  button
                          CustomButton(
                            text: 'Send OTP Code',
                            onTap: () => context.go(OtpVerification.routeName),
                            color: AppColors.kBrand50,
                            textColor: AppColors.kWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
