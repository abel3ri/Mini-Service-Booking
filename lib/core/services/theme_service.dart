import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF9C27B0),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF9C27B0),
      primaryContainer: Color(0xFFE1BEE7),
      secondary: Color(0xFFEC407A),
      secondaryContainer: Color(0xFFF8BBD0),
      tertiary: Color(0xFFBA68C8),
      error: Color(0xFFE53935),
      surface: Color(0xFFF5F5F5),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.raleway().fontFamily,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0xFFBA68C8),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: GoogleFonts.raleway().fontFamily,
    textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      headlineSmall: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      headlineLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFBA68C8),
      brightness: Brightness.dark,
    ).copyWith(
      primary: const Color(0xFFBA68C8),
      primaryContainer: const Color(0xFF7B1FA2),
      secondary: const Color(0xFFEC407A),
      secondaryContainer: const Color(0xFFAD1457),
      tertiary: const Color(0xFFAB47BC),
      error: const Color(0xFFEF5350),
      surface: const Color(0xFF121212),
    ),
  );
}
