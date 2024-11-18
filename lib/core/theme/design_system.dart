import 'package:flutter/material.dart';

/// Design system for consistent styling across the app
class DesignSystem {
  // Spacing constants
  static const double spacing1 = 4.0;
  static const double spacing2 = 8.0;
  static const double spacing3 = 16.0;
  static const double spacing4 = 24.0;
  static const double spacing5 = 32.0;

  // Border radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;

  // Shadows
  static List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  // Card Decorations
  static BoxDecoration get cardDecoration => BoxDecoration(
    color: Colors.white.withOpacity(0.9),
    borderRadius: BorderRadius.circular(radiusMedium),
    boxShadow: shadowSmall,
  );

  static BoxDecoration get elevatedCardDecoration => BoxDecoration(
    color: Colors.white.withOpacity(0.95),
    borderRadius: BorderRadius.circular(radiusMedium),
    boxShadow: shadowMedium,
  );

  // Animation Durations
  static const Duration animFast = Duration(milliseconds: 200);
  static const Duration animNormal = Duration(milliseconds: 300);
  static const Duration animSlow = Duration(milliseconds: 500);

  // Page Padding
  static const EdgeInsets pagePadding = EdgeInsets.all(spacing3);
  static const EdgeInsets pageHorizontalPadding = EdgeInsets.symmetric(horizontal: spacing3);
  static const EdgeInsets pageVerticalPadding = EdgeInsets.symmetric(vertical: spacing3);

  // Content Spacing
  static const SizedBox vSpacing1 = SizedBox(height: spacing1);
  static const SizedBox vSpacing2 = SizedBox(height: spacing2);
  static const SizedBox vSpacing3 = SizedBox(height: spacing3);
  static const SizedBox vSpacing4 = SizedBox(height: spacing4);
  static const SizedBox vSpacing5 = SizedBox(height: spacing5);

  static const SizedBox hSpacing1 = SizedBox(width: spacing1);
  static const SizedBox hSpacing2 = SizedBox(width: spacing2);
  static const SizedBox hSpacing3 = SizedBox(width: spacing3);
  static const SizedBox hSpacing4 = SizedBox(width: spacing4);
  static const SizedBox hSpacing5 = SizedBox(width: spacing5);

  // Input Decorations
  static InputDecoration get inputDecoration => InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusSmall),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: spacing3,
      vertical: spacing2,
    ),
  );
} 