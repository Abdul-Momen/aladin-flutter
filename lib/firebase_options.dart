// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB5Avg1Ce6wp_lri8SbA0esNDNOcvVHJhE',
    appId: '1:837585193273:web:9cb4359c8f26ff0e05c0e8',
    messagingSenderId: '837585193273',
    projectId: 'hazadeals-e4376',
    authDomain: 'hazadeals-e4376.firebaseapp.com',
    storageBucket: 'hazadeals-e4376.appspot.com',
    measurementId: 'G-GF7N34Y9HZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKBE0p-Beib9Y3U8IoY5WvCU8bDLwHY0c',
    appId: '1:837585193273:android:9feee018fae2fd3e05c0e8',
    messagingSenderId: '837585193273',
    projectId: 'hazadeals-e4376',
    storageBucket: 'hazadeals-e4376.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLMwn94U2mYeyPgS_ZQ345FZqx8l5EO0U',
    appId: '1:837585193273:ios:b42467ff1459279605c0e8',
    messagingSenderId: '837585193273',
    projectId: 'hazadeals-e4376',
    storageBucket: 'hazadeals-e4376.appspot.com',
    iosBundleId: 'com.example.aladin',
  );
}
