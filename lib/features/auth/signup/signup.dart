import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/core/presentation/constant/svgs.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/app_buttons.dart';
import 'package:homefinder/core/presentation/ui/widgets/app_input_field.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';
import 'package:homefinder/features/auth/signin/signin.dart';
import 'package:homefinder/features/home/home_screen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  static const String routeName = '/signUp';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  // bool _isLoading = false;
  double _passwordStrength = 0;
  String _passwordStatus = '';
  Color _strengthColor = AppColors.kGray30;
  bool _isPasswordVisible = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String getSignUpData() {
    return '${_fullNameController.text}|${_phoneNumberController.text}|${_emailAddressController.text}|${_passwordController.text}';
  }

  void _checkPasswordStrength(String password) {
    double strength = 0;

    if (password.isEmpty) {
      strength = 0;
      _passwordStatus = '';
    } else if (password.length < 6) {
      strength = 0.25;
      _passwordStatus = 'Weak';
      _strengthColor = AppColors.kRed;
    } else if (password.length < 10) {
      strength = 0.5;
      _passwordStatus = 'Medium';
      _strengthColor = AppColors.kOrange;
    } else {
      // If password contains letters, numbers, and special characters
      final hasUpper = password.contains(RegExp(r'[A-Z]'));
      final hasLower = password.contains(RegExp(r'[a-z]'));
      final hasDigit = password.contains(RegExp(r'\d'));
      final hasSpecial = password.contains(RegExp(r'[^A-Za-z0-9]'));

      if (hasUpper && hasLower && hasDigit && hasSpecial) {
        strength = 1.0;
        _passwordStatus = 'Strong';
        _strengthColor = AppColors.kSlimyGreen;
      } else {
        strength = 0.75;
        _passwordStatus = 'Good';
        _strengthColor = AppColors.kSlimyGreen;
      }
    }

    setState(() {
      _passwordStrength = strength;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 91.h, bottom: 20.h),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppSvgs.kLogo,
                    width: 64.w,
                    height: 64.h,
                    colorFilter: ColorFilter.mode(
                      AppColors.kBrand50,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                  TextHeading(
                    'Create Your Account',
                    color: AppColors.kEerieBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 4.h),
                  TextRegular(
                    'Your next home is just a few clicks away',
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
                          // full name
                          AppField(
                            title: 'Full Name',
                            controller: _fullNameController,
                            hintText: 'John Doe',
                            prefix: SvgPicture.asset(
                              AppSvgs.kEmailIcon,
                              width: 16.w,
                              height: 16.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          // phone number
                          AppField(
                            title: 'Phone Number',
                            controller: _phoneNumberController,
                            hintText: '+234-9000-000-000',
                            keyboardType: TextInputType.phone,
                          ),

                          SizedBox(height: 16.h),

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

                          SizedBox(height: 16.h),

                          // password
                          AppField(
                            title: 'Password',
                            controller: _passwordController,
                            hintText: '*****************',
                            prefix: SvgPicture.asset(
                              AppSvgs.kLock,
                              width: 16.w,
                              height: 16.h,
                              fit: BoxFit.scaleDown,
                            ),
                            suffix: InkWell(
                              onTap: _togglePasswordVisibility,
                              child: SvgPicture.asset(
                                AppSvgs.kEyeSlashIcon,
                                width: 16.w,
                                height: 16.h,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            onChanged: (value) => _checkPasswordStrength(value),
                            obscureText: !_isPasswordVisible,
                          ),
                          SizedBox(height: 8.h),
                          // progress bar
                          LinearProgressIndicator(
                            value: _passwordStrength,
                            color: _strengthColor,
                            backgroundColor: AppColors.kGray30,
                            minHeight: 4.h,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          SizedBox(height: 4.h),
                          TextRegular(
                            _passwordStatus.isNotEmpty
                                ? 'Password strength: $_passwordStatus'
                                : '',
                            color: AppColors.kBattleshipGray,
                            fontSize: 12,
                          ),

                          // Password strength
                          SizedBox(height: 24.h),

                          // sign in  button
                          CustomButton(
                            text: 'Sign Up',
                            onTap: () => context.go(HomeScreen.routeName),
                            color: AppColors.kBrand50,
                            textColor: AppColors.kWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  AppRichText(
                    textSpan: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: AppColors.kBrand50,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.go(SignIn.routeName),
                      ),
                    ],
                    text: 'Already have an account?  ',
                    color: AppColors.kGrey70,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
