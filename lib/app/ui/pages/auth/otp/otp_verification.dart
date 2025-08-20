import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/custom_buttons.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    // TODO: implement dispose
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }
  }

  void _onBackSpace(int index) {
    if (index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get otpCode {
    return _controllers.map((controller) => controller.text).join();
  }

  Widget _buildOutputField(int index) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.splashScreenText,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _focusNodes[index].hasFocus
              ? AppColors.primaryText
              : AppColors.borderColor,
          width: _focusNodes[index].hasFocus ? 2 : 1,
        ),
      ),
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: GoogleFonts.outfit(
          textStyle: Theme.of(context).textTheme.titleMedium,
          fontWeight: FontWeight.w800,
          fontSize: 28,
          color: _controllers[index].text.isNotEmpty
              ? AppColors.textBlack
              : const Color.fromRGBO(164, 164, 164, 1),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => _onChanged(value, index),
        onTap: () {
          _controllers[index].selection = TextSelection.fromPosition(
            TextPosition(offset: _controllers[index].text.length),
          );
        },
        onEditingComplete: () {
          if (index < 5) {
            _focusNodes[index + 1].requestFocus();
          }
        },
        onFieldSubmitted: (_) {
          if (index < 5) {
            _focusNodes[index + 1].requestFocus();
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 300),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          6,
                          (index) => _buildOutputField(index),
                        ),
                      ),

                      SizedBox(height: 24),

                      SubmitButton(
                        'Continue',
                        onPressed: () {
                          print('OTP: $otpCode');
                        },
                      ),

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
