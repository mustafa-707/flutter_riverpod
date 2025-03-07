import 'package:flutter/material.dart';
import 'package:flutter_templete/provider/app_settings.dart';
import 'package:flutter_templete/utils/helpers/extensions.dart';
import 'package:flutter_templete/utils/lang/locale.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeLanguageScreen extends ConsumerWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentLocaleProvider);
    final appSettingsController = ref.read(appSettingsProvider.notifier);
    final supportedLocales = LocaleService.supportedLocales;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: supportedLocales.length,
      itemBuilder: (context, index) {
        final locale = supportedLocales[index];
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: currentLocale == locale.code
                ? context.colorScheme.primary.withValues(alpha: .2)
                : context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              locale.name,
              style: context.textTheme.titleMedium,
            ),
            trailing: currentLocale == locale.code
                ? Icon(
                    Icons.check_circle,
                    color: context.colorScheme.primary,
                  )
                : null,
            onTap: () async {
              await appSettingsController.updateLocale(locale.code);
            },
          ),
        );
      },
    );
  }
}
