import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homefinder/core/presentation/navigation/routes.dart';
import 'package:homefinder/core/presentation/themes/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    //   DevicePreview(enabled: !kReleaseMode,
    // builder: (context) =>
    // )
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          // useInheritedMediaQuery: true,
          routerConfig: router,
          theme: AppThemeData.lightTheme(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
