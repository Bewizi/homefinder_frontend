import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeadingOne extends StatelessWidget {
  const TextHeadingOne(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.dmSans(
        textStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: Colors.white),
        height: 1.5,
      ),
    );
  }
}

class TextParagraph extends StatelessWidget {
  const TextParagraph(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.dmSans(
        textStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.white),
        height: 1.6,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.dmSans(
        textStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
