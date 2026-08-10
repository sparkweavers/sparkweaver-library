import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Text style variants using the design system typography
enum FcTextStyle {
  // Display styles
  displayLarge,
  displayMedium,
  displaySmall,

  // Heading styles
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,

  // Body styles
  bodyLarge,
  bodyMedium,
  bodySmall,

  // Label styles
  labelLarge,
  labelMedium,
  labelSmall,

  // Caption styles
  caption,
  captionSmall,

  // Special styles
  button,
  link,
  overline,
}

/// Sparkweaver Text Component (Atom)
///
/// A reusable text component using the design system typography.
/// Replaces MenduText from ai-flash-card with design system integration.
///
/// ## Usage
///
/// ```dart
/// // Heading text
/// FcText(
///   'Welcome',
///   style: FcTextStyle.heading1,
/// )
///
/// // Body text with custom color
/// FcText(
///   'This is body text',
///   style: FcTextStyle.bodyMedium,
///   color: SparkweaverColors.textSecondary,
/// )
///
/// // Centered text
/// FcText(
///   'Centered',
///   textAlign: TextAlign.center,
/// )
/// ```
class FcText extends StatelessWidget {
  /// The text to display
  final String text;

  /// Text style variant
  final FcTextStyle style;

  /// Text color (overrides default color from style)
  final Color? color;

  /// Text alignment
  final TextAlign textAlign;

  /// Maximum number of lines
  final int? maxLines;

  /// Text overflow behavior
  final TextOverflow? overflow;

  /// Font weight override
  final FontWeight? fontWeight;

  const FcText(
    this.text, {
    super.key,
    this.style = FcTextStyle.bodyMedium,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.fontWeight,
  });

  TextStyle _getTextStyle() {
    TextStyle baseStyle;

    switch (style) {
      case FcTextStyle.displayLarge:
        baseStyle = SparkweaverTypography.displayLarge;
        break;
      case FcTextStyle.displayMedium:
        baseStyle = SparkweaverTypography.displayMedium;
        break;
      case FcTextStyle.displaySmall:
        baseStyle = SparkweaverTypography.displaySmall;
        break;
      case FcTextStyle.heading1:
        baseStyle = SparkweaverTypography.heading1;
        break;
      case FcTextStyle.heading2:
        baseStyle = SparkweaverTypography.heading2;
        break;
      case FcTextStyle.heading3:
        baseStyle = SparkweaverTypography.heading3;
        break;
      case FcTextStyle.heading4:
        baseStyle = SparkweaverTypography.heading4;
        break;
      case FcTextStyle.heading5:
        baseStyle = SparkweaverTypography.heading5;
        break;
      case FcTextStyle.heading6:
        baseStyle = SparkweaverTypography.heading6;
        break;
      case FcTextStyle.bodyLarge:
        baseStyle = SparkweaverTypography.bodyLarge;
        break;
      case FcTextStyle.bodyMedium:
        baseStyle = SparkweaverTypography.bodyMedium;
        break;
      case FcTextStyle.bodySmall:
        baseStyle = SparkweaverTypography.bodySmall;
        break;
      case FcTextStyle.labelLarge:
        baseStyle = SparkweaverTypography.labelLarge;
        break;
      case FcTextStyle.labelMedium:
        baseStyle = SparkweaverTypography.labelMedium;
        break;
      case FcTextStyle.labelSmall:
        baseStyle = SparkweaverTypography.labelSmall;
        break;
      case FcTextStyle.caption:
        baseStyle = SparkweaverTypography.caption;
        break;
      case FcTextStyle.captionSmall:
        baseStyle = SparkweaverTypography.captionSmall;
        break;
      case FcTextStyle.button:
        baseStyle = SparkweaverTypography.button;
        break;
      case FcTextStyle.link:
        baseStyle = SparkweaverTypography.link;
        break;
      case FcTextStyle.overline:
        baseStyle = SparkweaverTypography.overline;
        break;
    }

    // Apply color override
    if (color != null) {
      baseStyle = baseStyle.copyWith(color: color);
    }

    // Apply font weight override
    if (fontWeight != null) {
      baseStyle = baseStyle.copyWith(fontWeight: fontWeight);
    }

    return baseStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _getTextStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
