import 'package:flutter/material.dart';
import 'package:frontend/app/routes/app_routes.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/custom_buttons.dart';
import 'package:frontend/app/ui/widgets/custom_textformfield.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 300),
            child: Column(
              children: [
                const TextHeading('Forgot Password?'),

                const SizedBox(height: 4),

                const TextSmall(
                  'We’ll send you a code to securely reset  your password ',
                  fontSize: 12,
                ),

                const SizedBox(height: 24),
                //   Form
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                      SizedBox(height: 24),

                      SubmitButton(
                        'Send OTP Code',
                        onPressed: () {
                          context.go(RouteNames.otpVerification);
                        },
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
