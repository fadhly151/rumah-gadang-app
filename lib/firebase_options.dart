// File ini adalah PLACEHOLDER, bukan konfigurasi Firebase asli.
//
// CARA MENGGANTINYA DENGAN YANG ASLI:
//   1. Buat project di https://console.firebase.google.com
//   2. Install FlutterFire CLI: `dart pub global activate flutterfire_cli`
//   3. Di root folder project ini, jalankan: `flutterfire configure`
//   4. Pilih project Firebase kamu & platform "android".
//   5. Perintah itu akan MENIMPA file ini secara otomatis dengan nilai asli,
//      sekaligus menambahkan file android/app/google-services.json.
//
// Jangan commit project ke publik sebelum langkah di atas dilakukan dengan
// project Firebase milikmu sendiri — nilai di bawah ini hanya contoh format
// dan tidak terhubung ke project manapun.

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Aplikasi ini belum dikonfigurasi untuk web. Jalankan `flutterfire configure`.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions belum dikonfigurasi untuk platform ini. '
          'Jalankan `flutterfire configure`.',
        );
    }
  }

  /// PLACEHOLDER — akan ditimpa otomatis oleh `flutterfire configure`.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'GANTI_DENGAN_API_KEY_ASLI',
    appId: 'GANTI_DENGAN_APP_ID_ASLI',
    messagingSenderId: 'GANTI_DENGAN_SENDER_ID_ASLI',
    projectId: 'GANTI_DENGAN_PROJECT_ID_ASLI',
    storageBucket: 'GANTI_DENGAN_STORAGE_BUCKET_ASLI',
  );
}
