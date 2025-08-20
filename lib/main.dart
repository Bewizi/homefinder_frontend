import 'package:flutter/material.dart';
import 'package:frontend/app/ui/pages/auth/signup/signup.dart';
import 'package:frontend/app/ui/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(home: Signup(), theme: primaryTheme));
}
