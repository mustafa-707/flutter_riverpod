import 'package:flutter_templete/utils/lang/locale.dart';
import 'package:flutter_templete/utils/theme/app_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/models/app_settings.freezed.dart';

@freezed
abstract class AppSettings with _$AppSettings {
  const AppSettings._();
  const factory AppSettings({
    @Default(LocaleService.defaultLocale) String locale,
    @Default(ThemeService.defaultTheme) String theme,
  }) = _AppSettings;
}
