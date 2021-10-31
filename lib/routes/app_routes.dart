import 'package:flutter_practice/UI/Login.dart';
import 'package:flutter_practice/UI/Splash.dart';

import 'routes.dart';
import 'package:flutter/material.dart';



class AppRoutes {
  /// Add entry for new route here
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.SPLASH:
        return MaterialPageRoute(
            settings: const RouteSettings(name: Routes.SPLASH),
            builder: (_) {
              return SplashScreen();
            });
      case Routes.LOGIN:
        return MaterialPageRoute(
            settings: const RouteSettings(name: Routes.HOME),
            builder: (_) {
              return LoginScreen();
            });

      // Default case, should not reach here.
      default:
        return null;
    }
  }
}
