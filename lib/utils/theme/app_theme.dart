import 'package:flutter/material.dart';
import 'package:flutter_templete/utils/global_navigator.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';

abstract final class AppTheme {
  // The defined light theme.
  static ThemeData light = FlexThemeData.light(
    scheme: FlexScheme.shark,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
  // The defined dark theme.
  static ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.shark,
    subThemesData: const FlexSubThemesData(
      interactionEffects: true,
      tintedDisabledControls: true,
      blendOnColors: true,
      useM2StyleDividerInM3: true,
      inputDecoratorIsFilled: true,
      inputDecoratorBorderType: FlexInputBorderType.outline,
      alignedDropdown: true,
      navigationRailUseIndicator: true,
      navigationRailLabelType: NavigationRailLabelType.all,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
  );
}

class ThemeService {
  static const defaultTheme = 'light';

  static String getDefaultTheme() {
    final context = rootNavigator.currentContext;
    if (context != null) {
      bool isDarkMode =
          MediaQuery.of(context).platformBrightness == Brightness.dark;
      return isDarkMode ? 'dark' : 'light';
    } else {
      return ThemeMode.system.name;
    }
  }
}
