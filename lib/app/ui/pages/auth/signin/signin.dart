import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/data/models/user_models.dart';
import 'package:frontend/app/routes/app_routes.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/custom_buttons.dart';
import 'package:frontend/app/ui/widgets/custom_textformfield.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';
import 'package:go_router/go_router.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false; // Add loading state

  late TextEditingController _emailAddressController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _emailAddressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Create User object for sign-in
  Users _createSignInUser() {
    return Users.signIn(
      emailAddress: _emailAddressController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  // Handle signin with User model
  Future<void> _handleSignIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Get signin credentials
        String email = _emailAddressController.text.trim();
        String password = _passwordController.text.trim();

        // Create user object for debugging/logging
        Users signInUser = _createSignInUser();
        print('Sign in attempt for user: $email');

        // Call authentication service
        bool success = await AuthService.signIn(email, password, signInUser);

        if (success) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign in successful!'),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to home
          context.go(RouteNames.home);
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email or password. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 150),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 64,
                  height: 64,
                  color: AppColors.primaryText,
                ),

                const SizedBox(height: 8),

                const TextHeading('Welcome Back'),

                const SizedBox(height: 4),

                const TextSmall(
                  'Continue your home search in seconds.',
                  fontSize: 12,
                ),

                const SizedBox(height: 24),
                //   Form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   email address
                      Text(
                        'Email Address',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        controller: _emailAddressController,
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        hintText: 'Example@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      //   password
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      Column(
                        children: [
                          CustomTextFormField(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              size: 20,
                              color: AppColors.textGray,
                            ),
                            isPassword: true,
                            hintText: '*****************',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            controller: _passwordController,
                          ),

                          SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Forgot Password?',
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(
                                        color: AppColors.primaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go(RouteNames.forgotPassword);
                                    },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      // Show loading indicator when processing
                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryButton,
                              ),
                            )
                          : SubmitButton('Sign In', onPressed: _handleSignIn),

                      SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign Up',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryButton,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go(RouteNames.signUp);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
