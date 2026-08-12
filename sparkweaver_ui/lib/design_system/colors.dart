import 'package:flutter/material.dart';

/// The official Sparkweaver brand palette, a purple and pink gradient theme.
class SparkweaverColors {
  SparkweaverColors._();

  // ============================================================
  // Brand Colors
  // ============================================================

  static const Color primary = Color(0xFF7F28A8); // Purple
  static const Color secondary = Color(0xFF0B96F8); // Blue
  static const Color tertiary = Color(0xFFFFB681); // Orange
  static const Color alternate = Color(0xFFFF259B); // Pink

  // ============================================================
  // Text Colors
  // ============================================================

  static const Color textPrimary = Color(0xFF232429);
  static const Color textSecondary = Color(0xFF75767B);
  static const Color textOnDarkBackground = Color(0xFFFFFFFF);

  // ============================================================
  // Background Colors
  // ============================================================

  static const Color backgroundPrimary = Color(0xFFFDFAFF); // Very light purple
  static const Color backgroundSecondary = Color(0xFFCCA9DC); // Light purple

  // ============================================================
  // Accent Colors
  // ============================================================

  static const Color accent1 = Color(0xFFB27ECB); // Light purple
  static const Color accent2 = Color(0xFFFFF6F0); // Very light orange
  static const Color accent3 = Color(0xFFFF700A); // Orange
  static const Color accent4 = Color(0xFFEEEEEE); // Light gray

  // ============================================================
  // Semantic Colors
  // ============================================================

  static const Color success = Color(0xFF05764D);
  static const Color error = Color(0xFFE21C3D);
  static const Color warning = Color(0xFFFCDC0C);
  static const Color info = Color(0xFF1C4494);

  // ============================================================
  // Base Colors
  // ============================================================

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // ============================================================
  // Gradient Colors
  // ============================================================

  /// Gradient colors for shiny gradient text effect
  static const List<Color> shinyGradient = [secondary, alternate];
}
