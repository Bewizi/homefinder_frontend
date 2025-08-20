import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/routes/app_routes.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/custom_buttons.dart';
import 'package:frontend/app/ui/widgets/custom_textformfield.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 150),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 64,
                  height: 64,
                  color: AppColors.primaryText,
                ),

                const SizedBox(height: 8),

                const TextHeading('Create Your Account'),

                const SizedBox(height: 4),

                const TextSmall(
                  'Your next home is just a few clicks away',
                  fontSize: 12,
                ),

                const SizedBox(height: 24),
                //   Form
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   full name
                      Text(
                        'Full Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        hintText: 'John Doe',
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      //   phone number
                      Text(
                        'Phone Number',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        prefixIcon: Icon(
                          Icons.call,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        hintText: '+234-9000-000-000',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      //   email address
                      Text(
                        'Email Address',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        hintText: 'Example@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      //   password
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        hintText: '*****************',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 24),

                      SubmitButton('Sign Up', onPressed: () {}),

                      SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryButton,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go(RouteNames.signIn);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
