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
    apiKey: 'AIzaSyB_gPYeCbxNRvf4yBPjlrwoQYEUVEU-6-g',
    appId: '1:1087170229873:web:61b13995b49b308c6fcdd0',
    messagingSenderId: '1087170229873',
    projectId: 'asroo-shop-998ba',
    authDomain: 'asroo-shop-998ba.firebaseapp.com',
    storageBucket: 'asroo-shop-998ba.appspot.com',
    measurementId: 'G-L6XFD8ZGJV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY3DFbKYgZQOtZeHKE4XC_Md0oUOWh18A',
    appId: '1:1087170229873:android:8bea6c3064ff42016fcdd0',
    messagingSenderId: '1087170229873',
    projectId: 'asroo-shop-998ba',
    storageBucket: 'asroo-shop-998ba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPjOiABtAFNKhbSYmZXWKIVB4Cu9Eb8Vs',
    appId: '1:1087170229873:ios:fed48a9c47a246066fcdd0',
    messagingSenderId: '1087170229873',
    projectId: 'asroo-shop-998ba',
    storageBucket: 'asroo-shop-998ba.appspot.com',
    iosClientId: '1087170229873-72u3thg8itlh4k2tg49pan2vpobkals9.apps.googleusercontent.com',
    iosBundleId: 'com.example.asrooShop',
  );
}
