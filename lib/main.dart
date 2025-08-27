import 'package:flutter/material.dart';
import 'package:homefinder/app/provider/property_provider.dart';
import 'package:homefinder/app/routes/app_routes.dart';
import 'package:homefinder/app/ui/themes/theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PropertyProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: primaryTheme,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
