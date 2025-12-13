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

/// Flashcard Text Component (Atom)
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
///   color: FlashcardColors.textSecondary,
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
        baseStyle = FlashcardTypography.displayLarge;
        break;
      case FcTextStyle.displayMedium:
        baseStyle = FlashcardTypography.displayMedium;
        break;
      case FcTextStyle.displaySmall:
        baseStyle = FlashcardTypography.displaySmall;
        break;
      case FcTextStyle.heading1:
        baseStyle = FlashcardTypography.heading1;
        break;
      case FcTextStyle.heading2:
        baseStyle = FlashcardTypography.heading2;
        break;
      case FcTextStyle.heading3:
        baseStyle = FlashcardTypography.heading3;
        break;
      case FcTextStyle.heading4:
        baseStyle = FlashcardTypography.heading4;
        break;
      case FcTextStyle.heading5:
        baseStyle = FlashcardTypography.heading5;
        break;
      case FcTextStyle.heading6:
        baseStyle = FlashcardTypography.heading6;
        break;
      case FcTextStyle.bodyLarge:
        baseStyle = FlashcardTypography.bodyLarge;
        break;
      case FcTextStyle.bodyMedium:
        baseStyle = FlashcardTypography.bodyMedium;
        break;
      case FcTextStyle.bodySmall:
        baseStyle = FlashcardTypography.bodySmall;
        break;
      case FcTextStyle.labelLarge:
        baseStyle = FlashcardTypography.labelLarge;
        break;
      case FcTextStyle.labelMedium:
        baseStyle = FlashcardTypography.labelMedium;
        break;
      case FcTextStyle.labelSmall:
        baseStyle = FlashcardTypography.labelSmall;
        break;
      case FcTextStyle.caption:
        baseStyle = FlashcardTypography.caption;
        break;
      case FcTextStyle.captionSmall:
        baseStyle = FlashcardTypography.captionSmall;
        break;
      case FcTextStyle.button:
        baseStyle = FlashcardTypography.button;
        break;
      case FcTextStyle.link:
        baseStyle = FlashcardTypography.link;
        break;
      case FcTextStyle.overline:
        baseStyle = FlashcardTypography.overline;
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
