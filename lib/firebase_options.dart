import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAb6v2Q-nhRNuYm7TOsgwlMK1HWlclwIk0',
    appId: '1:544021806700:web:adbd33b5ad438d6c89a249',
    messagingSenderId: '544021806700',
    projectId: 'zhet-market-777',
    authDomain: 'zhet-market-777.firebaseapp.com',
    storageBucket: 'zhet-market-777.appspot.com',
    measurementId: 'G-68L3WKSTQL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAokCp04CqaEYUUqbsdstV0tKwLXsMt9Xg',
    appId: '1:544021806700:android:847131e475acc7d089a249',
    messagingSenderId: '544021806700',
    projectId: 'zhet-market-777',
    storageBucket: 'zhet-market-777.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAYey5rL2dutg4JeAUMJHGkOwGQXbbZrig',
    appId: '1:544021806700:ios:3bbf2c98318973a689a249',
    messagingSenderId: '544021806700',
    projectId: 'zhet-market-777',
    storageBucket: 'zhet-market-777.appspot.com',
    iosBundleId: 'com.example.tShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAYey5rL2dutg4JeAUMJHGkOwGQXbbZrig',
    appId: '1:544021806700:ios:a40524ce15615f8d89a249',
    messagingSenderId: '544021806700',
    projectId: 'zhet-market-777',
    storageBucket: 'zhet-market-777.appspot.com',
    iosBundleId: 'com.example.tShop.RunnerTests',
  );
}
