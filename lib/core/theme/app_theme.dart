import 'package:flutter/material.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Gradient colors
  static const primaryGradientColors = [Color(0xFF9B8AA0), Color(0xFFAA9BAF)];
  static const surfaceGradientColors = [Colors.white, Color(0xFFFAF9FC)];
  static const darkSurfaceGradientColors = [Color(0xFF232025), Color(0xFF2A2730)];

  // Gradient definitions
  static const primaryGradient = LinearGradient(
    colors: primaryGradientColors,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const surfaceGradient = LinearGradient(
    colors: surfaceGradientColors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const darkSurfaceGradient = LinearGradient(
    colors: darkSurfaceGradientColors,
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Light theme
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      background: const Color(0xFFF8F6F1),
      primary: const Color(0xFF9B8AA0),
      onPrimary: Colors.white,
      secondary: const Color(0xFF8AA08E),
      surface: const Color(0xFFFCFBFF),
      onSurface: const Color(0xFF4A4655),
      outline: const Color(0xFFE5E3E8),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F6F1),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'Noto Serif',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Noto Serif',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.3,
        height: 1.3,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 14,
        height: 1.5,
        letterSpacing: 0.1,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0.2,
      ),
    ),
  );

  // Dark theme
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      background: const Color(0xFF1A1B1E),
      primary: const Color(0xFFCBBED0),
      onPrimary: const Color(0xFF1A1B1E),
      secondary: const Color(0xFFBED0C1),
      surface: const Color(0xFF2A2B2E),
      onSurface: const Color(0xFFE8E6F0),
      outline: const Color(0xFF3D3E41),
      shadow: Colors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFF1A1B1E),
    cardColor: const Color(0xFF2A2B2E),
    dividerColor: const Color(0xFF3D3E41),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontFamily: 'Noto Serif',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.5,
        height: 1.3,
        color: Color(0xFFE8E6F0),
      ),
      titleMedium: const TextStyle(
        fontFamily: 'Noto Serif',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.3,
        height: 1.3,
        color: Color(0xFFE8E6F0),
      ),
      titleSmall: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
        height: 1.4,
        color: const Color(0xFFE8E6F0).withOpacity(0.95),
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0.1,
        color: const Color(0xFFE8E6F0).withOpacity(0.95),
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 14,
        height: 1.5,
        letterSpacing: 0.1,
        color: const Color(0xFFE8E6F0).withOpacity(0.9),
      ),
      bodySmall: TextStyle(
        fontFamily: 'Noto Sans',
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0.2,
        color: const Color(0xFFE8E6F0).withOpacity(0.8),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF2A2B2E),
      hoverColor: const Color(0xFF3D3E41),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xFF3D3E41)),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
} 