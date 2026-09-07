import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Palet warna Marawa — bendera adat 3 warna khas Minangkabau yang
/// melambangkan tiga luhak (Agam, Tanah Datar, Limo Puluah Koto):
/// merah, hitam, dan kuning.
/// Nama variabel (maroon/gold) dipertahankan agar tidak mengubah kode
/// di file lain; nilainya sudah disesuaikan ke warna Marawa.
class AppColors {
  static const Color maroon = Color(0xFFC8102E); // Merah Marawa
  static const Color gold = Color(0xFFFFC72C); // Kuning Marawa
  static const Color darkGold = Color(0xFFE0A800); // Kuning tua (aksen/border)
  static const Color cream = Color(0xFFFFFDF6); // Netral terang untuk background
  static const Color black = Color(0xFF111111); // Hitam Marawa
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.cream,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.maroon,
        primary: AppColors.maroon,
        secondary: AppColors.gold,
        surface: AppColors.cream,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.maroon,
        foregroundColor: Colors.white,
        elevation: 2,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.maroon,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.maroon,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
