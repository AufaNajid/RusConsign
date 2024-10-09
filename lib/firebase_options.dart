import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return windows;
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
    apiKey: 'AIzaSyDLdDmt1_21cvvNYhLgb8OzVihFGjp5HcU',
    appId: '1:423000787290:web:2364ec9c94697670bf4b63',
    messagingSenderId: '423000787290',
    projectId: 'rusconsignlogin',
    authDomain: 'rusconsignlogin.firebaseapp.com',
    storageBucket: 'rusconsignlogin.appspot.com',
    measurementId: 'G-WGZYFH49EQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAu4czXIavHZYxdBfNhIeyVTIrY6_kkKLU',
    appId: '1:423000787290:android:40f6e2291de1a3c3bf4b63',
    messagingSenderId: '423000787290',
    projectId: 'rusconsignlogin',
    storageBucket: 'rusconsignlogin.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBghsllRX79gYhvvLnvPi7GnLnegvlmToo',
    appId: '1:423000787290:ios:5e21603f54be2613bf4b63',
    messagingSenderId: '423000787290',
    projectId: 'rusconsignlogin',
    storageBucket: 'rusconsignlogin.appspot.com',
    iosClientId: '423000787290-c7jdjmbuf4ai6gmf9uc8fsarmfo5h7af.apps.googleusercontent.com',
    iosBundleId: 'com.example.rusconsign',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBghsllRX79gYhvvLnvPi7GnLnegvlmToo',
    appId: '1:423000787290:ios:5e21603f54be2613bf4b63',
    messagingSenderId: '423000787290',
    projectId: 'rusconsignlogin',
    storageBucket: 'rusconsignlogin.appspot.com',
    iosClientId: '423000787290-c7jdjmbuf4ai6gmf9uc8fsarmfo5h7af.apps.googleusercontent.com',
    iosBundleId: 'com.example.rusconsign',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDLdDmt1_21cvvNYhLgb8OzVihFGjp5HcU',
    appId: '1:423000787290:web:6f5a5f3744cbe47bbf4b63',
    messagingSenderId: '423000787290',
    projectId: 'rusconsignlogin',
    authDomain: 'rusconsignlogin.firebaseapp.com',
    storageBucket: 'rusconsignlogin.appspot.com',
    measurementId: 'G-84X3J3TWGZ',
  );
}
