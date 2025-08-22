import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/app/ui/pages/auth/forgotPassword/forgot_password.dart';
import 'package:homefinder/app/ui/pages/auth/otp/otp_verification.dart';
import 'package:homefinder/app/ui/pages/auth/signin/signin.dart';
import 'package:homefinder/app/ui/pages/auth/signup/signup.dart';
import 'package:homefinder/app/ui/pages/getStarted/get_started.dart';
import 'package:homefinder/app/ui/pages/homepage/home.dart';
import 'package:homefinder/app/ui/pages/onBoarding/onBoarding.dart';

class RouteNames {
  static const String homePage = '/';
  static const String getStarted = '/getStarted';
  static const String onBoarding = '/onBoarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String otpVerification = '/otpVerification';
  static const String home = '/home';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: RouteNames.homePage, builder: (context, state) => HomePage()),

    GoRoute(
      path: RouteNames.getStarted,
      builder: (context, state) => GetStarted(),
    ),

    GoRoute(
      path: RouteNames.onBoarding,
      builder: (context, state) => Onboarding(),
    ),

    GoRoute(path: RouteNames.signIn, builder: (context, state) => SignIn()),

    GoRoute(path: RouteNames.signUp, builder: (context, state) => Signup()),

    GoRoute(
      path: RouteNames.forgotPassword,
      builder: (context, state) => ForgotPassword(),
    ),

    GoRoute(
      path: RouteNames.otpVerification,
      builder: (context, state) => OtpVerification(),
    ),

    GoRoute(path: RouteNames.home, builder: (context, state) => HomePage()),
  ],

  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
);

// Simple error screen
class ErrorScreen extends StatelessWidget {
  final String error;

  const ErrorScreen({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Something went wrong!'),
            SizedBox(height: 16),
            Text(error),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
