import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_templete/app/app.transition.dart';
import 'package:flutter_templete/screens/settings/settings_screen.dart';
import 'package:flutter_templete/screens/splash_screen.dart';

Route onGenerateRoute(RouteSettings settings) {
  log('Route: ${settings.name}');

  switch (settings.name) {
    case SplashScreen.routeName:
      return createAppTransition(
        builder: (context) => const SplashScreen(),
        settings: settings,
      );

    case AppSettingsScreen.routeName:
      return createLtrRtlTransition(
        builder: (context) => const AppSettingsScreen(),
        settings: settings,
      );
    default:
      return createDialogTransition(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Screen not found'),
          ),
        ),
        settings: settings,
      );
  }
}
