import 'package:flutter/material.dart';

/// Sparkweaver UI Design System - Typography
///
/// Defines the typography system including font families, sizes, weights,
/// and predefined text styles for consistent text rendering.
class SparkweaverTypography {
  SparkweaverTypography._();

  // ============================================================
  // Font Families
  // ============================================================

  /// Primary font family for body text
  static const String fontFamilyPrimary = 'Roboto';

  /// Secondary font family for headings
  static const String fontFamilyHeading = 'Roboto';

  /// Monospace font family for code/technical content
  static const String fontFamilyMono = 'Courier';

  // ============================================================
  // Font Sizes
  // ============================================================

  static const double fontSize10 = 10.0;
  static const double fontSize11 = 11.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;
  static const double fontSize32 = 32.0;
  static const double fontSize36 = 36.0;
  static const double fontSize48 = 48.0;

  // ============================================================
  // Font Weights
  // ============================================================

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // ============================================================
  // Line Heights
  // ============================================================

  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;
  static const double lineHeightLoose = 2.0;

  // ============================================================
  // Letter Spacing
  // ============================================================

  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
  static const double letterSpacingExtraWide = 1.0;

  // ============================================================
  // Display Text Styles (Extra Large)
  // ============================================================

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize48,
    fontWeight: bold,
    height: lineHeightTight,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize36,
    fontWeight: bold,
    height: lineHeightTight,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize32,
    fontWeight: bold,
    height: lineHeightTight,
    letterSpacing: letterSpacingNormal,
  );

  // ============================================================
  // Heading Text Styles
  // ============================================================

  static const TextStyle heading1 = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize28,
    fontWeight: bold,
    height: lineHeightTight,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle heading2 = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize24,
    fontWeight: bold,
    height: lineHeightTight,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle heading3 = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize20,
    fontWeight: semiBold,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle heading4 = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize18,
    fontWeight: semiBold,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle heading5 = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize16,
    fontWeight: semiBold,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle heading6 = TextStyle(
    fontFamily: fontFamilyHeading,
    fontSize: fontSize14,
    fontWeight: semiBold,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  // ============================================================
  // Body Text Styles
  // ============================================================

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize16,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize14,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize12,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  // ============================================================
  // Label Text Styles (Buttons, Forms)
  // ============================================================

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize14,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingWide,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize12,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingWide,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize11,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingWide,
  );

  // ============================================================
  // Caption Text Styles (Helper Text, Metadata)
  // ============================================================

  static const TextStyle caption = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize12,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  static const TextStyle captionSmall = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize10,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  // ============================================================
  // Special Text Styles
  // ============================================================

  /// Button text style
  static const TextStyle button = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize14,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingWide,
  );

  /// Monospace text for code
  static const TextStyle code = TextStyle(
    fontFamily: fontFamilyMono,
    fontSize: fontSize14,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  /// Link text style
  static const TextStyle link = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize14,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
    decoration: TextDecoration.underline,
  );

  /// Overline text (small uppercase labels)
  static const TextStyle overline = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize10,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingExtraWide,
  );

  // ============================================================
  // Chat-Specific Text Styles
  // ============================================================

  /// User message text
  static const TextStyle chatUser = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize14,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  /// AI message text
  static const TextStyle chatAi = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize14,
    fontWeight: regular,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );

  /// Badge/tag text
  static const TextStyle badge = TextStyle(
    fontFamily: fontFamilyPrimary,
    fontSize: fontSize11,
    fontWeight: medium,
    height: lineHeightNormal,
    letterSpacing: letterSpacingNormal,
  );
}
