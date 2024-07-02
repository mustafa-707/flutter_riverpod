// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_templete/app/app.env.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (AppFromEnv.appEnv) {
      case AppEnv.production:
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return androidProduction;
          case TargetPlatform.iOS:
            return iosProduction;
          default:
            throw UnsupportedError(
              'DefaultFirebaseOptions are not supported for this platform.',
            );
        }
      case AppEnv.staging:
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return androidStaging;
          case TargetPlatform.iOS:
            return iosStaging;
          default:
            throw UnsupportedError(
              'DefaultFirebaseOptions are not supported for this platform.',
            );
        }
      default:
        throw UnsupportedError(
          'App Environment not set in .env.',
        );
    }
  }

  static const FirebaseOptions androidProduction = FirebaseOptions(
    apiKey: '',
    appId: '1:',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '.appspot.com',
    iosBundleId: 'com.example.flutter_templete',
  );

  static const FirebaseOptions iosProduction = FirebaseOptions(
    apiKey: '',
    appId: '1:',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '.appspot.com',
    iosBundleId: 'com.example.flutter_templete',
  );

  static const FirebaseOptions androidStaging = FirebaseOptions(
    apiKey: '',
    appId: '1:',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '.appspot.com',
    iosBundleId: 'com.example.flutter_templete',
  );

  static const FirebaseOptions iosStaging = FirebaseOptions(
    apiKey: '',
    appId: '1:',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '.appspot.com',
    iosBundleId: 'com.example.flutter_templete',
  );
}
