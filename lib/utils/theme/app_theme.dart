import 'package:flutter/material.dart';
import 'package:flutter_templete/utils/global_navigator.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_templete/utils/helpers/extensions.dart';
import 'package:flutter_templete/utils/theme/color_palette.dart';

abstract final class AppTheme {
  static final light = FlexThemeData.light(
    colors: ColorPalette.lightScheme,
    scheme: FlexScheme.greenM3,
    surface: ColorPalette.lightBackground,
  );

  // The defined dark theme.
  static final dark = FlexThemeData.dark(
    colors: ColorPalette.darkScheme,
    scheme: FlexScheme.greenM3,
    surface: ColorPalette.darkBackground,
  );
}

class ThemeService {
  static const defaultTheme = 'light';
  static const secondaryTheme = 'dark';

  static List<String> get getSupportedThemes => [
        defaultTheme,
        secondaryTheme,
      ];

  static bool isSupportedTheme(String theme) {
    return getSupportedThemes.map((t) => t).contains(theme);
  }

  static String getThemeName(BuildContext context, String theme) {
    switch (theme) {
      case defaultTheme:
        return context.translate.lightThemeName;
      case secondaryTheme:
        return context.translate.darkThemeName;
      default:
        return context.translate.unknown;
    }
  }

  static String get getDefaultTheme {
    final context = rootNavigator.currentContext;
    if (context != null) {
      final isDarkMode = context.platformBrightness == Brightness.dark;
      return isDarkMode ? secondaryTheme : defaultTheme;
    } else {
      return ThemeMode.system.name;
    }
  }
}
