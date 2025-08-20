import 'package:flutter/material.dart';
import 'package:frontend/app/ui/themes/theme.dart';
import 'package:frontend/app/ui/widgets/styled_text.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //   full name
                    Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    SizedBox(height: 8),

                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'John Doe',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
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

                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.call),
                        hintText: '+234-9000-000-000',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
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

                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                        hintText: 'Example@gmail.com',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
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

                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        hintText: '*****************',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.borderColor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
