// Updated lib/app/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/features/auth/forgotPassword/forgot_password.dart';
import 'package:homefinder/features/auth/otp/otp_verification.dart';
import 'package:homefinder/features/auth/signin/signin.dart';
import 'package:homefinder/features/auth/signup/signup.dart';
import 'package:homefinder/features/getStarted/get_started.dart';
import 'package:homefinder/features/home/home_screen.dart';
import 'package:homefinder/features/onBoarding/onboarding.dart';
import 'package:homefinder/features/splashScreen/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashScreen.routeName,
  routes: [
    GoRoute(
      path: SplashScreen.routeName,
      name: 'splashScreen',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: GetStarted.routeName,
      name: 'getStarted',
      builder: (context, state) => GetStarted(),
    ),

    GoRoute(
      path: Onboarding.routeName,
      name: 'onBoarding',
      builder: (context, state) => Onboarding(),
    ),

    GoRoute(
      path: SignIn.routeName,
      name: 'signIn',
      builder: (context, state) => SignIn(),
    ),

    GoRoute(
      path: Signup.routeName,
      name: 'signUp',
      builder: (context, state) => Signup(),
    ),

    GoRoute(
      path: ForgotPassword.routeName,
      name: 'forgotPassword',
      builder: (context, state) => ForgotPassword(),
    ),

    GoRoute(
      path: OtpVerification.routeName,
      name: 'otpVerification',
      builder: (context, state) => OtpVerification(),
    ),

    GoRoute(
      path: HomeScreen.routeName,
      name: 'home',
      builder: (context, state) => HomeScreen(),
    ),

    // GoRoute(
    //   path: AllProperties.routeName,
    //   name: 'allProperties',
    //   builder: (context, state) => AllProperties(),
    // ),
    //
    // // Property Details Route with parameter
    // GoRoute(
    //   path: '/property-details/:propertyId',
    //   builder: (context, state) {
    //     final propertyId = state.pathParameters['propertyId']!;
    //     return PropertyDetails(propertyId: propertyId);
    //   },
    // ),
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
            ElevatedButton(onPressed: () {}, child: Text('Go Home')),
          ],
        ),
      ),
    );
  }
}
