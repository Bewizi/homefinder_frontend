import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/data/models/user_models.dart';
import 'package:frontend/app/routes/app_routes.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/custom_buttons.dart';
import 'package:frontend/app/ui/widgets/custom_textformfield.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailAddressController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _emailAddressController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  String getSignUpData() {
    return '${_fullNameController.text}|${_phoneNumberController.text}|${_emailAddressController.text}|${_passwordController.text}';
  }

  Users _createUserFromForm() {
    return Users(
      fullName: _fullNameController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim(),
      emailAddress: _emailAddressController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  Future<void> _handleSignup() async {
    if (_formKey.currentState!.validate()) {
      // String formData = getSignUpData();
      // print('Form Data: $formData');
      // context.go(RouteNames.home);
      setState(() {
        _isLoading = true;
      });

      try {
        // Create user object
        Users newUser = _createUserFromForm();

        print('User Data: ${newUser.toString()}');
        print('User Json: ${newUser.toJson()}');

        // Call authentication service
        bool success = await AuthService.signUp(newUser);

        if (success) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Account Created Successfully'),
              backgroundColor: Colors.green,
            ),
          );

          // Navigate to home
          context.go(RouteNames.home);
        } else {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to create account. Please try Again'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create account. Please try Again'),
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

                const TextHeading('Create Your Account'),

                const SizedBox(height: 4),

                const TextSmall(
                  'Your next home is just a few clicks away',
                  fontSize: 12,
                ),

                const SizedBox(height: 24),
                //   Form
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   full name
                      Text(
                        'Full Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        hintText: 'John Doe',
                        controller: _fullNameController,
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          if (value.length < 2) {
                            return 'Name must be at least 2 characters';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

                      //   phone number
                      Text(
                        'Phone Number',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      SizedBox(height: 8),

                      CustomTextFormField(
                        controller: _phoneNumberController,
                        prefixIcon: Icon(
                          Icons.call,
                          size: 20,
                          color: AppColors.textGray,
                        ),
                        hintText: '+234-9000-000-000',
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (value.length < 10) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16),

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

                      CustomTextFormField(
                        controller: _passwordController,
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
                      ),

                      SizedBox(height: 24),

                      _isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryButton,
                              ),
                            )
                          : SubmitButton('Sign Up', onPressed: _handleSignup),

                      SizedBox(height: 14),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textBlack,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primaryButton,
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
