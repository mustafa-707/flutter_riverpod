import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_templete/screens/splash_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  log('Route: ${settings.name}');

  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
        settings: settings,
      );
  }
}
