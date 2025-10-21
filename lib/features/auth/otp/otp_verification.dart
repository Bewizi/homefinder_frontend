import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homefinder/core/presentation/themes/colors.dart';
import 'package:homefinder/core/presentation/ui/widgets/text_styles.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  static const String routeName = '/otpVerification';

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
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _focusNodes[index].hasFocus
              ? AppColors.kGrey5
              : AppColors.kBattleshipGray,
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
              ? AppColors.kBlack
              : AppColors.kGrey20,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 91.h, bottom: 24.h),
              child: Column(
                children: [
                  TextHeading(
                    'OTP Verification',
                    color: AppColors.kEerieBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 4.h),
                  TextRegular(
                    'We just sent a code to your number. Please enter it\nbelow to verify your account',
                    color: AppColors.kBattleshipGray,
                    fontSize: 12,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
