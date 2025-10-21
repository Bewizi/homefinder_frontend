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
import 'package:homefinder/features/auth/forgotPassword/forgot_password.dart';
import 'package:homefinder/features/auth/signup/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  static const String routeName = '/signIn';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false; // Add loading state

  late TextEditingController _emailAddressController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _emailAddressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    'Welcome Back',
                    color: AppColors.kEerieBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 4.h),
                  TextRegular(
                    'Continue your home search in seconds.',
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
                            suffix: SvgPicture.asset(
                              AppSvgs.kEyeSlashIcon,
                              width: 16.w,
                              height: 16.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          // forgot password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    context.push(ForgotPassword.routeName),
                                child: TextRegular(
                                  'Forgot password?',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kBrand50,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24.h),

                          // sign in  button
                          CustomButton(
                            text: 'Sign In',
                            onTap: () {},
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
                        text: 'Sign Up',
                        style: TextStyle(
                          color: AppColors.kBrand50,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => context.go(Signup.routeName),
                      ),
                    ],
                    text: 'Don’t have an account?  ',
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
