import 'package:flutter/material.dart';

// Text Heading Size 24
class TextHeading extends StatelessWidget {
  const TextHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headlineLarge);
  }
}

// Text Small Size 16
class TextMedium extends StatelessWidget {
  const TextMedium(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }
}

// Text Small Size 14
class TextSmall extends StatelessWidget {
  const TextSmall(this.text, {this.fontSize, super.key});

  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme.titleSmall;
    return Text(text, style: theme?.copyWith(fontSize: fontSize));
  }
}

// Text Small Size 14
class TextSmallOnboarding extends StatelessWidget {
  const TextSmallOnboarding(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.displaySmall);
  }
}
