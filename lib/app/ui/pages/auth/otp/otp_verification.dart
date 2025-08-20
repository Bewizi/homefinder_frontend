import 'package:flutter/material.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/custom_buttons.dart';
import 'package:frontend/app/ui/widgets/custom_textformfield.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 300),
            child: Column(
              children: [
                const TextHeading('OTP Verification'),

                const SizedBox(height: 4),

                const TextSmall(
                  'We just sent a code to your number. Please enter it\nbelow to verify your account',
                  textAlign: TextAlign.center,
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

                      SubmitButton('Continue', onPressed: () {}),

                      SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextSmall(
                            '00:28 Sec',
                            color: AppColors.textBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          TextSmall(
                            'Resend OTP',
                            color: AppColors.primaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
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
