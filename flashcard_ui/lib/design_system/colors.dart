import 'package:flutter/material.dart';

/// Flashcard UI Design System - Color Palette
///
/// Defines the complete color system for the Flashcard application.
/// Colors are organized into primary, secondary, and semantic categories.
class FlashcardColors {
  FlashcardColors._();

  // ============================================================
  // Primary Colors
  // ============================================================

  /// Primary brand color - Used for main actions and branding
  static const Color primary = Color(0xFF2196F3); // Blue
  static const Color primaryLight = Color(0xFF64B5F6);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryVariant = Color(0xFF1E88E5);

  // ============================================================
  // Secondary Colors
  // ============================================================

  /// Secondary brand color - Used for accents and highlights
  static const Color secondary = Color(0xFF4CAF50); // Green
  static const Color secondaryLight = Color(0xFF81C784);
  static const Color secondaryDark = Color(0xFF388E3C);
  static const Color secondaryVariant = Color(0xFF43A047);

  // ============================================================
  // Semantic Colors - Success
  // ============================================================

  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  // ============================================================
  // Semantic Colors - Error
  // ============================================================

  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);

  // ============================================================
  // Semantic Colors - Warning
  // ============================================================

  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFB74D);
  static const Color warningDark = Color(0xFFF57C00);

  // ============================================================
  // Semantic Colors - Info
  // ============================================================

  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // ============================================================
  // Neutral Colors - Grays
  // ============================================================

  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFEEEEEE);
  static const Color gray300 = Color(0xFFE0E0E0);
  static const Color gray400 = Color(0xFFBDBDBD);
  static const Color gray500 = Color(0xFF9E9E9E);
  static const Color gray600 = Color(0xFF757575);
  static const Color gray700 = Color(0xFF616161);
  static const Color gray800 = Color(0xFF424242);
  static const Color gray900 = Color(0xFF212121);

  // ============================================================
  // Base Colors
  // ============================================================

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ============================================================
  // Text Colors
  // ============================================================

  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);
  static const Color textHint = Color(0xFF9E9E9E);

  // ============================================================
  // Background Colors
  // ============================================================

  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // ============================================================
  // Chat/Message Colors
  // ============================================================

  /// User message bubble background
  static const Color userMessageBg = Color(0xFFE3F2FD); // Light blue

  /// AI/Assistant message bubble background
  static const Color aiMessageBg = Color(0xFFF5F5F5); // Light gray

  /// User avatar background
  static const Color userAvatarBg = Color(0xFFC8E6C9); // Light green

  /// AI avatar background
  static const Color aiAvatarBg = Color(0xFFBBDEFB); // Light blue

  // ============================================================
  // Border Colors
  // ============================================================

  static const Color borderLight = Color(0xFFE0E0E0);
  static const Color borderMedium = Color(0xFFBDBDBD);
  static const Color borderDark = Color(0xFF757575);

  // ============================================================
  // Opacity Variants
  // ============================================================

  /// Creates a color with specified opacity (0.0 - 1.0)
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }

  /// Primary color with 10% opacity
  static Color get primary10 => primary.withValues(alpha: 0.1);

  /// Primary color with 20% opacity
  static Color get primary20 => primary.withValues(alpha: 0.2);

  /// Primary color with 30% opacity
  static Color get primary30 => primary.withValues(alpha: 0.3);

  /// Gray with 10% opacity
  static Color get gray10 => gray500.withValues(alpha: 0.1);

  /// Gray with 20% opacity
  static Color get gray20 => gray500.withValues(alpha: 0.2);

  /// Gray with 30% opacity
  static Color get gray30 => gray500.withValues(alpha: 0.3);
}

/// Alternative Color Theme - Mendu Style
///
/// Purple/Pink gradient theme extracted from ai-flash-card
/// Can be used as an alternative theme for the application
class MenduColors {
  MenduColors._();

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
