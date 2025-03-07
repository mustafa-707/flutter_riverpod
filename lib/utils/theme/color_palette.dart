import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ColorPalette {
  static final primary = Color(0xFFBBEB47);
  static final primaryContainer = primary.withValues(
    alpha: .8,
  );
  static final primaryRef = primary.withValues(
    alpha: .6,
  );

  static final lightSecondary = Color(0xFF69DB4F);
  static final lightSecondaryContainer = lightSecondary.withValues(
    alpha: .8,
  );
  static final lightSecondaryRef = lightSecondary.withValues(
    alpha: .6,
  );
  static final lightBackground = Colors.white;

  static final lightScheme = FlexSchemeColor(
    primary: primary,
    primaryContainer: primaryContainer,
    primaryLightRef: primaryRef,
    secondary: lightSecondary,
    secondaryContainer: lightSecondaryContainer,
    secondaryLightRef: lightSecondaryRef,
    tertiary: darkSecondaryRef,
    tertiaryContainer: tertiaryContainer,
    tertiaryLightRef: tertiaryRef,
    appBarColor: lightBackground,
    error: error,
    errorContainer: errorContainer,
    swapOnMaterial3: true,
  );

  static final darkSecondary = Color(0xFF69DB4F);
  static final darkSecondaryContainer = darkSecondary.withValues(
    alpha: .8,
  );
  static final darkSecondaryRef = darkSecondary.withValues(
    alpha: .6,
  );
  static final darkBackground = Color(0xFF373A3F);

  static final darkScheme = FlexSchemeColor(
    primary: primary,
    primaryContainer: primaryContainer,
    primaryLightRef: primaryRef,
    secondary: darkSecondary,
    secondaryContainer: darkSecondaryContainer,
    secondaryLightRef: darkSecondaryRef,
    tertiary: darkSecondaryRef,
    tertiaryContainer: tertiaryContainer,
    tertiaryLightRef: tertiaryRef,
    appBarColor: darkBackground,
    error: error,
    errorContainer: errorContainer,
    swapOnMaterial3: true,
  );

  static final tertiary = darkBackground;
  static final tertiaryContainer = darkBackground.withValues(
    alpha: .8,
  );
  static final tertiaryRef = darkBackground.withValues(
    alpha: .6,
  );
  static final appBarColor = lightSecondary;
  static final error = Colors.red;
  static final errorContainer = Colors.redAccent;
}
