import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:timeline_manager/src/core/di/app_bindings.dart';
import 'package:timeline_manager/src/core/routes/routes.dart';
import 'package:timeline_manager/src/core/theme/app_theme.dart';
import 'package:timeline_manager/src/core/utils/app_constants.dart';
import 'package:timeline_manager/src/core/widgets/k_scroll_behavior.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  /// Set preferred orientations to portrait only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Hide Keyboard
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    return GetMaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: KScrollBehavior(),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      initialBinding: AppBindings(),
      initialRoute: RouteGenerator.dashboard,
      getPages: RouteGenerator.routes,
      defaultTransition: Transition.fade,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}