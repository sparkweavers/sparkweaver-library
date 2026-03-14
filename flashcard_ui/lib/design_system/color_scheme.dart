import 'package:flutter/material.dart';

/// Flashcard Color Scheme
///
/// A theme-aware color system that adapts to light and dark modes.
/// Use `FlashcardColorScheme.of(context)` to get colors that automatically
/// adjust based on the current theme brightness.
///
/// ## Usage
///
/// ```dart
/// // In a widget with BuildContext:
/// final colors = FlashcardColorScheme.of(context);
/// Container(color: colors.primary)
///
/// // For light theme specifically:
/// final lightColors = FlashcardColorScheme.light();
///
/// // For dark theme specifically:
/// final darkColors = FlashcardColorScheme.dark();
/// ```
class FlashcardColorScheme {
  final Brightness brightness;

  const FlashcardColorScheme._({required this.brightness});

  /// Light theme color scheme
  factory FlashcardColorScheme.light() {
    return const FlashcardColorScheme._(brightness: Brightness.light);
  }

  /// Dark theme color scheme
  factory FlashcardColorScheme.dark() {
    return const FlashcardColorScheme._(brightness: Brightness.dark);
  }

  /// Get color scheme from context based on current theme brightness
  static FlashcardColorScheme of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark
        ? FlashcardColorScheme.dark()
        : FlashcardColorScheme.light();
  }

  bool get isDark => brightness == Brightness.dark;
  bool get isLight => brightness == Brightness.light;

  // ============================================================
  // Primary Colors (Purple)
  // ============================================================

  Color get primary => isDark ? const Color(0xFFB27ECB) : const Color(0xFF7F28A8);
  Color get primaryLight => isDark ? const Color(0xFFCCA9DC) : const Color(0xFFB27ECB);
  Color get primaryDark => isDark ? const Color(0xFF7F28A8) : const Color(0xFF5E1F7E);
  Color get primaryVariant => isDark ? const Color(0xFF9956B3) : const Color(0xFF6E239B);

  // ============================================================
  // Secondary Colors (Blue)
  // ============================================================

  Color get secondary => isDark ? const Color(0xFF5DB0FF) : const Color(0xFF0B96F8);
  Color get secondaryLight => isDark ? const Color(0xFF8FCCFF) : const Color(0xFF5DB0FF);
  Color get secondaryDark => isDark ? const Color(0xFF0B96F8) : const Color(0xFF0975C2);
  Color get secondaryVariant => isDark ? const Color(0xFF3DA8FF) : const Color(0xFF0A85D8);

  // ============================================================
  // Tertiary Colors (Peach/Orange)
  // ============================================================

  Color get tertiary => isDark ? const Color(0xFFFFCEA7) : const Color(0xFFFFB681);
  Color get tertiaryLight => isDark ? const Color(0xFFFFE3CA) : const Color(0xFFFFCEA7);
  Color get tertiaryDark => isDark ? const Color(0xFFFFB681) : const Color(0xFFFF9F5A);

  // ============================================================
  // Alternate Colors (Pink)
  // ============================================================

  Color get alternate => isDark ? const Color(0xFFFF6BB5) : const Color(0xFFFF259B);
  Color get alternateLight => isDark ? const Color(0xFFFF9FCF) : const Color(0xFFFF6BB5);
  Color get alternateDark => isDark ? const Color(0xFFFF259B) : const Color(0xFFE0127F);

  // ============================================================
  // Semantic Colors - Success
  // ============================================================

  Color get success => isDark ? const Color(0xFF07A364) : const Color(0xFF05764D);
  Color get successLight => isDark ? const Color(0xFF39C087) : const Color(0xFF07A364);
  Color get successDark => isDark ? const Color(0xFF05764D) : const Color(0xFF044C32);

  // ============================================================
  // Semantic Colors - Error
  // ============================================================

  Color get error => isDark ? const Color(0xFFFF5870) : const Color(0xFFE21C3D);
  Color get errorLight => isDark ? const Color(0xFFFF8A9A) : const Color(0xFFFF5870);
  Color get errorDark => isDark ? const Color(0xFFE21C3D) : const Color(0xFFB3162F);

  // ============================================================
  // Semantic Colors - Warning
  // ============================================================

  Color get warning => isDark ? const Color(0xFFFFE943) : const Color(0xFFFCDC0C);
  Color get warningLight => isDark ? const Color(0xFFFFF176) : const Color(0xFFFFE943);
  Color get warningDark => isDark ? const Color(0xFFFCDC0C) : const Color(0xFFC7AD09);

  // ============================================================
  // Semantic Colors - Info
  // ============================================================

  Color get info => isDark ? const Color(0xFF4D7FC4) : const Color(0xFF1C4494);
  Color get infoLight => isDark ? const Color(0xFF7FA6D9) : const Color(0xFF4D7FC4);
  Color get infoDark => isDark ? const Color(0xFF1C4494) : const Color(0xFF14336F);

  // ============================================================
  // Neutral Colors - Grays
  // ============================================================

  Color get gray50 => isDark ? const Color(0xFF1E1E1E) : const Color(0xFFFAFAFA);
  Color get gray100 => isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF5F5F5);
  Color get gray200 => isDark ? const Color(0xFF3D3D3D) : const Color(0xFFEEEEEE);
  Color get gray300 => isDark ? const Color(0xFF4D4D4D) : const Color(0xFFE0E0E0);
  Color get gray400 => isDark ? const Color(0xFF6D6D6D) : const Color(0xFFBDBDBD);
  Color get gray500 => isDark ? const Color(0xFF8D8D8D) : const Color(0xFF9E9E9E);
  Color get gray600 => isDark ? const Color(0xFFADADAD) : const Color(0xFF757575);
  Color get gray700 => isDark ? const Color(0xFFCDCDCD) : const Color(0xFF616161);
  Color get gray800 => isDark ? const Color(0xFFE0E0E0) : const Color(0xFF424242);
  Color get gray900 => isDark ? const Color(0xFFF5F5F5) : const Color(0xFF212121);

  // ============================================================
  // Base Colors
  // ============================================================

  Color get white => isDark ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);
  Color get black => isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000);

  // ============================================================
  // Text Colors
  // ============================================================

  Color get textPrimary => isDark ? const Color(0xFFFFFFFF) : const Color(0xFF232429);
  Color get textSecondary => isDark ? const Color(0xFFB0B0B0) : const Color(0xFF75767B);
  Color get textDisabled => isDark ? const Color(0xFF6D6D6D) : const Color(0xFFBDBDBD);
  Color get textHint => isDark ? const Color(0xFF8D8D8D) : const Color(0xFF9E9E9E);

  // ============================================================
  // Background Colors
  // ============================================================

  Color get backgroundLight => isDark ? const Color(0xFF1A0F1F) : const Color(0xFFFDFAFF);
  Color get backgroundDark => isDark ? const Color(0xFF0D0710) : const Color(0xFFEEEEEE);
  Color get surface => isDark ? const Color(0xFF2D1B3D) : const Color(0xFFFFFFFF);
  Color get surfaceVariant => isDark ? const Color(0xFF3D2A4D) : const Color(0xFFFFF6F0);

  // ============================================================
  // Chat/Message Colors
  // ============================================================

  Color get userMessageBg => isDark ? const Color(0xFF3D2A5F) : const Color(0xFFF3E6FF);
  Color get aiMessageBg => isDark ? const Color(0xFF2D1B3D) : const Color(0xFFFFF6F0);
  Color get userAvatarBg => isDark ? const Color(0xFF5E3D7E) : const Color(0xFFCCA9DC);
  Color get aiAvatarBg => isDark ? const Color(0xFF1E4A7F) : const Color(0xFFE3F2FD);

  // ============================================================
  // Border Colors
  // ============================================================

  Color get borderLight => isDark ? const Color(0xFF3D3D3D) : const Color(0xFFE0E0E0);
  Color get borderMedium => isDark ? const Color(0xFF4D4D4D) : const Color(0xFFBDBDBD);
  Color get borderDark => isDark ? const Color(0xFF6D6D6D) : const Color(0xFF757575);

  // ============================================================
  // Opacity Variants
  // ============================================================

  Color get primary10 => primary.withValues(alpha: 0.1);
  Color get primary20 => primary.withValues(alpha: 0.2);
  Color get primary30 => primary.withValues(alpha: 0.3);
  Color get gray10 => gray500.withValues(alpha: 0.1);
  Color get gray20 => gray500.withValues(alpha: 0.2);
  Color get gray30 => gray500.withValues(alpha: 0.3);
}
