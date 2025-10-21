import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? styles;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;

  const AppText({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight,
    this.color,
    this.styles,
    this.textAlign,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
      ).merge(styles),
      textAlign: textAlign,
    );
  }
}

class TextHeading extends AppText {
  const TextHeading({
    super.key,
    required super.text,
    super.fontSize = 20,
    super.fontWeight,
    super.color,
    super.styles,
    super.textAlign,
    super.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ).merge(styles),
      textAlign: textAlign,
    );
  }
}

class TextRegular extends AppText {
  const TextRegular({
    super.key,
    required super.text,
    super.fontSize = 14,
    super.fontWeight,
    super.color,
    super.styles,
    super.textAlign,
    super.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontStyle: fontStyle,
      ).merge(styles),
      textAlign: textAlign,
    );
  }
}

class AppRichText extends StatelessWidget {
  final String? text;
  final List<InlineSpan> textSpan;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? styles;

  const AppRichText({
    super.key,
    required this.textSpan,
    this.text,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.styles,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text ?? '',
        children: textSpan,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ).merge(styles),
      ),
      textAlign: textAlign,
    );
  }
}
