import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/ui/pages/getStarted/component/button.dart';
import 'package:frontend/app/ui/pages/getStarted/component/textStyle.dart';
import 'package:frontend/app/ui/pages/getStarted/component/theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.dmSans().fontFamily,
                              color: TextColors.primaryButton,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
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
