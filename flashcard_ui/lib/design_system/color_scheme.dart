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
  // Primary Colors
  // ============================================================

  Color get primary => isDark ? const Color(0xFF64B5F6) : const Color(0xFF2196F3);
  Color get primaryLight => isDark ? const Color(0xFF90CAF9) : const Color(0xFF64B5F6);
  Color get primaryDark => isDark ? const Color(0xFF42A5F5) : const Color(0xFF1976D2);
  Color get primaryVariant => isDark ? const Color(0xFF42A5F5) : const Color(0xFF1E88E5);

  // ============================================================
  // Secondary Colors
  // ============================================================

  Color get secondary => isDark ? const Color(0xFF81C784) : const Color(0xFF4CAF50);
  Color get secondaryLight => isDark ? const Color(0xFFA5D6A7) : const Color(0xFF81C784);
  Color get secondaryDark => isDark ? const Color(0xFF66BB6A) : const Color(0xFF388E3C);
  Color get secondaryVariant => isDark ? const Color(0xFF66BB6A) : const Color(0xFF43A047);

  // ============================================================
  // Semantic Colors - Success
  // ============================================================

  Color get success => isDark ? const Color(0xFF81C784) : const Color(0xFF4CAF50);
  Color get successLight => isDark ? const Color(0xFFA5D6A7) : const Color(0xFF81C784);
  Color get successDark => isDark ? const Color(0xFF66BB6A) : const Color(0xFF388E3C);

  // ============================================================
  // Semantic Colors - Error
  // ============================================================

  Color get error => isDark ? const Color(0xFFEF5350) : const Color(0xFFF44336);
  Color get errorLight => isDark ? const Color(0xFFE57373) : const Color(0xFFE57373);
  Color get errorDark => isDark ? const Color(0xFFE53935) : const Color(0xFFD32F2F);

  // ============================================================
  // Semantic Colors - Warning
  // ============================================================

  Color get warning => isDark ? const Color(0xFFFFB74D) : const Color(0xFFFF9800);
  Color get warningLight => isDark ? const Color(0xFFFFD54F) : const Color(0xFFFFB74D);
  Color get warningDark => isDark ? const Color(0xFFFF9800) : const Color(0xFFF57C00);

  // ============================================================
  // Semantic Colors - Info
  // ============================================================

  Color get info => isDark ? const Color(0xFF64B5F6) : const Color(0xFF2196F3);
  Color get infoLight => isDark ? const Color(0xFF90CAF9) : const Color(0xFF64B5F6);
  Color get infoDark => isDark ? const Color(0xFF42A5F5) : const Color(0xFF1976D2);

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

  Color get textPrimary => isDark ? const Color(0xFFFFFFFF) : const Color(0xFF212121);
  Color get textSecondary => isDark ? const Color(0xFFB0B0B0) : const Color(0xFF757575);
  Color get textDisabled => isDark ? const Color(0xFF6D6D6D) : const Color(0xFFBDBDBD);
  Color get textHint => isDark ? const Color(0xFF8D8D8D) : const Color(0xFF9E9E9E);

  // ============================================================
  // Background Colors
  // ============================================================

  Color get backgroundLight => isDark ? const Color(0xFF121212) : const Color(0xFFFFFFFF);
  Color get backgroundDark => isDark ? const Color(0xFF000000) : const Color(0xFF121212);
  Color get surface => isDark ? const Color(0xFF1E1E1E) : const Color(0xFFFFFFFF);
  Color get surfaceVariant => isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF5F5F5);

  // ============================================================
  // Chat/Message Colors
  // ============================================================

  Color get userMessageBg => isDark ? const Color(0xFF1E3A5F) : const Color(0xFFE3F2FD);
  Color get aiMessageBg => isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF5F5F5);
  Color get userAvatarBg => isDark ? const Color(0xFF2D4A2D) : const Color(0xFFC8E6C9);
  Color get aiAvatarBg => isDark ? const Color(0xFF1E3A5F) : const Color(0xFFBBDEFB);

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
