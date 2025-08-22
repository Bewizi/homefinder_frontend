import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/app/routes/app_routes.dart';
import 'package:homefinder/app/ui/pages/getStarted/component/textStyle.dart';
import 'package:homefinder/app/ui/pages/getStarted/component/theme.dart';

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
        context.go(RouteNames.onBoarding);
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
