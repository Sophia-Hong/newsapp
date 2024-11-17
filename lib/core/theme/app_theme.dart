import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Sophisticated color palette
  static const warmBackground = Color(0xFFF8F6F1); // 따뜻한 미색
  static const primaryText = Color(0xFF2C2C2C);
  static const accentPurple = Color(0xFF9B8AA0); // Subtle purple
  static const accentGray = Color(0xFF6B6B76); // Sophisticated gray
  
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
      background: warmBackground,
      surface: warmBackground,
      primary: accentPurple,
      secondary: accentGray,
      onBackground: primaryText,
      onSurface: primaryText,
    ),
    scaffoldBackgroundColor: warmBackground,
    cardTheme: CardTheme(
      elevation: 2,
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: warmBackground,
      elevation: 0,
    ),
    // Using clean, basic typography
    textTheme: GoogleFonts.notoSerifTextTheme().copyWith(
      titleLarge: GoogleFonts.notoSerif(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.3,
      ),
      titleMedium: GoogleFonts.notoSerif(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
      ),
      bodyLarge: GoogleFonts.notoSans(
        fontSize: 16,
        letterSpacing: 0.1,
      ),
      bodyMedium: GoogleFonts.notoSans(
        fontSize: 14,
        letterSpacing: 0.1,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      background: const Color(0xFF1A1917),
      surface: const Color(0xFF242321),
      primary: accentPurple.withOpacity(0.9),
      secondary: accentGray.withOpacity(0.9),
      onBackground: const Color(0xFFF0EDE6),
      onSurface: const Color(0xFFF0EDE6),
    ),
    scaffoldBackgroundColor: const Color(0xFF1A1917),
    cardTheme: CardTheme(
      elevation: 2,
      color: const Color(0xFF242321),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1917),
      elevation: 0,
    ),
    // Using clean, basic typography for dark theme
    textTheme: GoogleFonts.notoSerifTextTheme(ThemeData.dark().textTheme).copyWith(
      titleLarge: GoogleFonts.notoSerif(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.3,
        color: const Color(0xFFF0EDE6),
      ),
      titleMedium: GoogleFonts.notoSerif(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: -0.2,
        color: const Color(0xFFF0EDE6),
      ),
      bodyLarge: GoogleFonts.notoSans(
        fontSize: 16,
        letterSpacing: 0.1,
        color: const Color(0xFFF0EDE6),
      ),
      bodyMedium: GoogleFonts.notoSans(
        fontSize: 14,
        letterSpacing: 0.1,
        color: const Color(0xFFF0EDE6),
      ),
    ),
  );
} 