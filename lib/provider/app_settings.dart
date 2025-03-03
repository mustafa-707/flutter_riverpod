import 'package:flutter_templete/models/app_settings.dart';
import 'package:flutter_templete/provider/shared_preferences.dart';
import 'package:flutter_templete/utils/lang/locale.dart';
import 'package:flutter_templete/utils/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final appReadyProvider = StateProvider<bool>((ref) => false);

final appSettingsProvider =
    StateNotifierProvider<AppSettingsController, AppSettings>((ref) {
  final sharedPrefs = ref.watch(sharedPrefsProvider);
  assert(
    sharedPrefs != null,
    "App settings must not be used before SharedPreferences are initialized!",
  );

  return AppSettingsController(sharedPrefs!);
});

class AppSettingsController extends StateNotifier<AppSettings> {
  final SharedPreferences sharedPreferences;

  AppSettingsController(this.sharedPreferences)
      : super(_settingsFromPrefs(sharedPreferences));

  static AppSettings _settingsFromPrefs(SharedPreferences prefs) {
    final locale = prefs.getString(PrefKeys.appLocale);
    final theme = prefs.getString(PrefKeys.appTheme);

    return AppSettings(
      locale: locale ?? LocaleService.getDefaultLocale(),
      theme: theme ?? ThemeService.getDefaultTheme(),
    );
  }

  Future<void> updateLocale(String locale) async {
    if (LocaleService.isSupportedLocale(locale)) {
      await sharedPreferences.setString(PrefKeys.appLocale, locale);
      state = _settingsFromPrefs(sharedPreferences);
    } else {
      throw Exception("Unsupported locale '$locale'");
    }
  }

  Future<void> updateTheme(String theme) async {
    if (LocaleService.isSupportedLocale(theme)) {
      await sharedPreferences.setString(PrefKeys.appTheme, theme);
      state = _settingsFromPrefs(sharedPreferences);
    } else {
      throw Exception("Unsupported locale '$theme'");
    }
  }
}

final currentLocaleProvider = Provider<String>((ref) {
  final isAppReady = ref.watch(appReadyProvider);

  return isAppReady
      ? ref.watch(appSettingsProvider.select((settings) => settings.locale))
      : LocaleService.getDefaultLocale();
});

final currentThemeProvider = Provider<String>((ref) {
  final isAppReady = ref.watch(appReadyProvider);

  return isAppReady
      ? ref.watch(appSettingsProvider.select((settings) => settings.theme))
      : ThemeService.getDefaultTheme();
});
