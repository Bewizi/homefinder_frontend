// Updated lib/app/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homefinder/app/ui/pages/allHomes/all_properties.dart';
import 'package:homefinder/app/ui/pages/auth/forgotPassword/forgot_password.dart';
import 'package:homefinder/app/ui/pages/auth/otp/otp_verification.dart';
import 'package:homefinder/app/ui/pages/auth/signin/signin.dart';
import 'package:homefinder/app/ui/pages/auth/signup/signup.dart';
import 'package:homefinder/app/ui/pages/getStarted/get_started.dart';
import 'package:homefinder/app/ui/pages/homepage/home.dart';
import 'package:homefinder/app/ui/pages/onBoarding/onBoarding.dart';
import 'package:homefinder/app/ui/pages/property_details/property_details.dart';
import 'package:homefinder/app/ui/pages/splashScreen/splash_screen.dart';

class RouteNames {
  static const String homePage = '/';
  static const String getStarted = '/getStarted';
  static const String onBoarding = '/onBoarding';
  static const String signIn = '/signIn';
  static const String signUp = '/signUp';
  static const String forgotPassword = '/forgotPassword';
  static const String otpVerification = '/otpVerification';
  static const String home = '/home';
  static const String allProperties = '/allProperties';
  static const String propertyDetails = '/property-details';
}

final GoRouter router = GoRouter(
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
      path: HomePage.routeName,
      name: 'home',
      builder: (context, state) => HomePage(),
    ),

    GoRoute(
      path: AllProperties.routeName,
      name: 'allProperties',
      builder: (context, state) => AllProperties(),
    ),

    // Property Details Route with parameter
    GoRoute(
      path: '/property-details/:propertyId',
      builder: (context, state) {
        final propertyId = state.pathParameters['propertyId']!;
        return PropertyDetails(propertyId: propertyId);
      },
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
              onPressed: () => context.go(RouteNames.home),
              child: Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
