import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_templete/app/app.dart';
import 'package:flutter_templete/firebase_options.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//
//

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    await _guardedInitalization();
    runApp(const ProviderScope(child: App()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

Future<void> _guardedInitalization() async {
  // We ensure Flutter binding is initialized here. Otherwise, calls to
  // SystemChrome will not work, for example. This is a no-op if the binding
  // is already initialized.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    try {
      if (Platform.isIOS) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      } else {
        await Firebase.initializeApp();
      }

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
        kDebugMode ? false : true,
      );
      Isolate.current.addErrorListener(
        RawReceivePort((pair) async {
          final List<dynamic> errorAndStacktrace = pair;
          await FirebaseCrashlytics.instance.recordError(
            errorAndStacktrace.first,
            errorAndStacktrace.last,
          );
        }).sendPort,
      );
    } catch (e) {
      log(" initializing Error: ${e.toString()}");
    }
  }
}
