import 'package:flutter/material.dart';
import 'package:flutter_templete/provider/app_settings.dart';
import 'package:flutter_templete/provider/shared_preferences.dart';
import 'package:flutter_templete/utils/helpers/extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future<void> _initializeApp() async {
    final prefs = await SharedPreferences.getInstance();

    ref.read(sharedPrefsProvider.notifier).state = prefs;

    // make sure context is still viable as we are in async function
    if (!mounted) return;

    // if (user != null) {
    //   Navigator.of(context).pushNamedAndRemoveUntil(
    //     MainScreen.routeName,
    //     (_) => false,
    //   );
    // } else {
    Navigator.of(context).pushNamedAndRemoveUntil(
      'login', //  LoginScreen.routeName,
      (_) => false,
    );
    // }
  }

  @override
  void initState() {
    _initializeApp().then((value) {
      ref.read(appReadyProvider.notifier).state = true;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // precacheImage(
    //   AssetImage(
    //     Images.loginBackground,
    //   ),
    //   rootNavigator.currentContext ?? context,
    // );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage(Images.loginBackground),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          Column(
            children: [
              SizedBox(height: context.height / 2),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        const Color(0xFF000210).withValues(alpha: .05),
                        const Color(0xFF000210).withValues(alpha: .9),
                      ],
                      stops: const [0.0, 2.0],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  // Images.transparentLogo,
                  // Text(
                  //   translate.splashIntro,
                  //   style: theme.textTheme.titleLarge?.copyWith(
                  //     fontSize: 40,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
