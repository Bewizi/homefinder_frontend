import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homefinder/app/ui/themes/theme.dart';

// Button Text
class ButtonText extends StatefulWidget {
  const ButtonText(this.text, {super.key, this.onPressed, this.fontSize});

  final String text;
  final void Function()? onPressed;
  final double? fontSize;

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}

// submitButton
class SubmitButton extends StatefulWidget {
  const SubmitButton(this.text, {super.key, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: AppColors.primaryButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
      ),
      child: Text(
        widget.text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: AppColors.splashScreenText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
