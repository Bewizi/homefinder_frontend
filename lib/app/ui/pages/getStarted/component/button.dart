import 'package:flutter/material.dart';
import 'package:frontend/app/ui/pages/getStarted/component/textStyle.dart';
import 'package:frontend/app/ui/pages/getStarted/component/theme.dart';
import 'package:frontend/app/ui/pages/onBoarding/onBoarding.dart';

class GetStartedButton extends StatefulWidget {
  const GetStartedButton({super.key});

  @override
  State<GetStartedButton> createState() => _GetStartedButtonState();
}

class _GetStartedButtonState extends State<GetStartedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => Onboarding()),
          (route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        backgroundColor: TextColors.primaryButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: ButtonText('Get Started'),
    );
  }
}
