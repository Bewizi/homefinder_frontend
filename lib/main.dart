import 'package:flutter/material.dart';
import 'package:frontend/app/routes/app_routes.dart';
import 'package:frontend/app/ui/themes/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp.router(routerConfig: router, theme: primaryTheme));
}
