import 'package:flutter/material.dart';
import 'package:flutter_templete/generated/i18n/app_localizations.dart';

extension MediaQuiryHelper on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);

  AppLocalizations get translate => AppLocalizations.of(this)!;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
