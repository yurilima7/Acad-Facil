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
        return macos;
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
    apiKey: 'AIzaSyCNXzOinUiaHpqaZ6G5dtMVzSwmtqI5RUg',
    appId: '1:120480731808:web:ece808c7ca981398fdafc5',
    messagingSenderId: '120480731808',
    projectId: 'acad-simples',
    authDomain: 'acad-simples.firebaseapp.com',
    storageBucket: 'acad-simples.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDm0yDBcpzSw294Ql54eeui-bKoK5hWk5A',
    appId: '1:120480731808:android:c3c8da267929eda3fdafc5',
    messagingSenderId: '120480731808',
    projectId: 'acad-simples',
    storageBucket: 'acad-simples.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEDH-WUEFlFQURgGMoyo6fPRXqEEgAy2U',
    appId: '1:120480731808:ios:0867b26112badbb2fdafc5',
    messagingSenderId: '120480731808',
    projectId: 'acad-simples',
    storageBucket: 'acad-simples.appspot.com',
    iosClientId: '120480731808-njthtl05o0r4n1h9e60lp2rhlohcleov.apps.googleusercontent.com',
    iosBundleId: 'com.example.acadFacil',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBEDH-WUEFlFQURgGMoyo6fPRXqEEgAy2U',
    appId: '1:120480731808:ios:0867b26112badbb2fdafc5',
    messagingSenderId: '120480731808',
    projectId: 'acad-simples',
    storageBucket: 'acad-simples.appspot.com',
    iosClientId: '120480731808-njthtl05o0r4n1h9e60lp2rhlohcleov.apps.googleusercontent.com',
    iosBundleId: 'com.example.acadFacil',
  );
}
