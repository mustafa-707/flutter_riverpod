import 'package:flutter/material.dart';
import 'package:flutter_templete/utils/helpers/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_templete/screens/settings/menu/langauge.dart';
import 'package:flutter_templete/screens/settings/menu/theme.dart';

class AppSettingsScreen extends ConsumerStatefulWidget {
  static const routeName = '/app_settings';

  const AppSettingsScreen({super.key});

  @override
  ConsumerState<AppSettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<AppSettingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.settings),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: context.translate.language),
            Tab(text: context.translate.theme),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChangeLanguageScreen(),
          ChangeThemeScreen(),
        ],
      ),
    );
  }
}
