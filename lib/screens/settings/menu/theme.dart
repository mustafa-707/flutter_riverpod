import 'package:flutter/material.dart';
import 'package:flutter_templete/provider/app_settings.dart';
import 'package:flutter_templete/utils/helpers/extensions.dart';
import 'package:flutter_templete/utils/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangeThemeScreen extends ConsumerWidget {
  const ChangeThemeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentThemeProvider);
    final appSettingsController = ref.read(appSettingsProvider.notifier);

    final supportedThemes = ThemeService.getSupportedThemes;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: supportedThemes.length,
      itemBuilder: (context, index) {
        final theme = supportedThemes[index];
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: currentTheme == theme
                ? context.colorScheme.primary.withValues(alpha: .2)
                : context.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () async {
              await appSettingsController.updateTheme(theme);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.color_lens,
                  size: 48,
                  color: currentTheme == theme
                      ? context.colorScheme.primary
                      : context.textTheme.bodyLarge?.color,
                ),
                const SizedBox(height: 8),
                Text(
                  ThemeService.getThemeName(context, theme),
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
