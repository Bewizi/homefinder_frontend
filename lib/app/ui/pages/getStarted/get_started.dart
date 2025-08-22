import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/app/routes/app_routes.dart';
import 'package:homefinder/app/ui/pages/getStarted/component/button.dart';
import 'package:homefinder/app/ui/pages/getStarted/component/textStyle.dart';
import 'package:homefinder/app/ui/pages/getStarted/component/theme.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/image_fx.png',
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.black87,
              width: 500,
              height: 308,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 35,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    TextHeadingOne(
                      'Discover your Perfect Rental\nHome Just a Tap Away',
                    ),

                    SizedBox(height: 16),

                    TextParagraph(
                      'Search, compare, and rent your home - fast and easy\nwith Homefinder. Thousands of listing. Zero hassle.',
                    ),

                    SizedBox(height: 28),

                    GetStartedButton(),

                    SizedBox(height: 28),

                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: TextColors.primaryButton,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go(RouteNames.signIn);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
