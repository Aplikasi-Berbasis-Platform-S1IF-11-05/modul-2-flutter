import 'package:flutter/material.dart';

/// Warna-warna yang digunakan dalam aplikasi LMS Task.
///
/// Mengikuti design system dengan palet warna yang konsisten
/// dan dapat diakses dengan mudah di seluruh aplikasi.
class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF37352F);
  static const Color primaryLight = Color(0xFF5B5753);
  static const Color primaryDark = Color(0xFF23211F);

  // Neutral Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFAFAF9);
  static const Color border = Color(0xFFE9E9E7);
  static const Color divider = Color(0xFFE9E9E7);
  static const Color textPrimary = Color(0xFF37352F);
  static const Color textSecondary = Color(0xFF787774);
  static const Color textTertiary = Color(0xFF9C9A96);

  // Status Colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // Urgent/Deadline Colors
  static const Color urgentBg = Color(0xFFFBE4E4);
  static const Color urgentText = Color(0xFFC03221);

  // Course/Card Colors
  static const List<Color> courseColors = [
    Color(0xFF667BC6), // Blue
    Color(0xFF6FA876), // Green
    Color(0xFFF29D6A), // Orange
    Color(0xFFE49BA4), // Pink
    Color(0xFFC99DD4), // Purple
    Color(0xFF81C9D0), // Teal
  ];

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF667BC6), Color(0xFF4B5AA0)],
  );

  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF27AE60), Color(0xFF1E8449)],
  );
}
