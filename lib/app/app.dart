import 'package:flutter/material.dart';
import 'package:flutter_templete/app/app.router.dart';
import 'package:flutter_templete/components/behaviors/scroll.dart';
import 'package:flutter_templete/provider/app_settings.dart';
import 'package:flutter_templete/screens/splash_screen.dart';
import 'package:flutter_templete/utils/global_navigator.dart';
import 'package:flutter_templete/utils/lang/locale.dart';
import 'package:flutter_templete/utils/lang/locale.export.dart';
import 'package:flutter_templete/utils/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(currentLocaleProvider);
    final theme = ref.watch(currentThemeProvider);

    return MaterialApp(
      title: 'flutter_templete',
      navigatorKey: rootNavigator,
      themeMode: ThemeMode.values.firstWhere(
        (element) => element.name == theme,
      ),
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        for (var supportedLocale in LocaleService.supportedLocales)
          Locale(supportedLocale.code),
      ],
      locale: Locale(locale),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return ScrollConfiguration(
          behavior: AppScrollBehavior(),
          child: MediaQuery(
            data: data.copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child ?? const SizedBox(),
          ),
        );
      },
    );
  }
}
