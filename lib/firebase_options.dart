// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAkiS2eLRr091WmELCKnNKzyfGXIpjUWUI',
    appId: '1:447234138731:web:c22840e989625ef38e872e',
    messagingSenderId: '447234138731',
    projectId: 'fatoortak-8afe3',
    authDomain: 'fatoortak-8afe3.firebaseapp.com',
    storageBucket: 'fatoortak-8afe3.firebasestorage.app',
    measurementId: 'G-J9CMD9FCKN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDj5173CW9-ACClffuJUHDpjj5N_1sl_mc',
    appId: '1:447234138731:android:8ad7a09d88fa005f8e872e',
    messagingSenderId: '447234138731',
    projectId: 'fatoortak-8afe3',
    storageBucket: 'fatoortak-8afe3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhoSLlb3mQIMfIrllsi3Mp1u4R3M_sROU',
    appId: '1:447234138731:ios:917badafff2ba1c28e872e',
    messagingSenderId: '447234138731',
    projectId: 'fatoortak-8afe3',
    storageBucket: 'fatoortak-8afe3.firebasestorage.app',
    iosBundleId: 'com.example.fatoortk',
  );
}
