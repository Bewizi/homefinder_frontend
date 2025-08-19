import 'package:flutter/material.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

// Button Text
class ButtonText extends StatefulWidget {
  const ButtonText(this.text, {super.key});

  final String text;

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        widget.text,
        style: TextStyle(
          fontFamily: GoogleFonts.dmSans().fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryText,
        ),
      ),
    );
  }
}
