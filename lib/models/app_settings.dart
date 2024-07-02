import 'package:flutter_templete/utils/lang/locale.dart';
import 'package:flutter_templete/utils/theme/app_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/models/app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required String locale,
    required String theme,
  }) = _AppSettings;

  static const default_ = AppSettings(
    locale: LocaleService.defaultLocale,
    theme: ThemeService.defaultTheme,
  );
}
