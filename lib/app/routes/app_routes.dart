import 'package:flutter/material.dart';
import 'package:frontend/app/ui/pages/auth/forgotPassword/forgot_password.dart';
import 'package:frontend/app/ui/pages/auth/otp/otp_verification.dart';
import 'package:frontend/app/ui/pages/auth/signin/signin.dart';
import 'package:frontend/app/ui/pages/auth/signup/signup.dart';
import 'package:frontend/app/ui/pages/getStarted/get_started.dart';
import 'package:frontend/app/ui/pages/onBoarding/onBoarding.dart';
import 'package:frontend/app/ui/pages/splashScreen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RouteNames {
  static const String splashScreen = '/';
  static const String getStarted = '/getStarted';
  static const String onBoarding = '/onBoarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String otpVerification = '/otpVerification';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RouteNames.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),

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
              onPressed: () => context.go(RouteNames.splashScreen),
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
