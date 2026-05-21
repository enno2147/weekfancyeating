import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE07A5F);     // Terracotta
  static const Color secondary = Color(0xFF81B29A);   // Sage Green
  static const Color accent = Color(0xFFF2E9D8);
  static const Color background = Color(0xFFFCF8F3);

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primary, brightness: Brightness.light),
    scaffoldBackgroundColor: background,
    appBarTheme: const AppBarTheme(
      backgroundColor: accent,
      foregroundColor: Colors.black87,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}