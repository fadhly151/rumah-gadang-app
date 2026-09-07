import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'utils/theme.dart';
import 'utils/constants.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // PENTING: firebase_options.dart di project ini masih berisi nilai
  // PLACEHOLDER. Jalankan `flutterfire configure` untuk menghubungkan ke
  // project Firebase asli sebelum menjalankan aplikasi. Lihat README.md.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const RumahGadangApp());
}

class RumahGadangApp extends StatelessWidget {
  const RumahGadangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
