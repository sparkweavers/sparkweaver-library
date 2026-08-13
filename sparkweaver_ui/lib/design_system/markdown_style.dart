import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'spacing.dart';
import 'typography.dart';

/// Shared markdown stylesheets, so every AI-text surface looks the same.
/// Headings come from [SparkweaverTypography], not from `baseStyle`.
class SparkweaverMarkdownStyle {
  SparkweaverMarkdownStyle._();

  /// The caller supplies [baseStyle] so one markdown block can adopt
  /// user-message, AI-message or feedback-panel typography.
  static MarkdownStyleSheet forBody({
    required TextStyle baseStyle,
    required Color textColor,
  }) {
    return MarkdownStyleSheet(
      p: baseStyle,
      a: baseStyle.copyWith(
        color: textColor,
        decoration: TextDecoration.underline,
      ),
      h1: SparkweaverTypography.heading1.copyWith(color: textColor),
      h2: SparkweaverTypography.heading2.copyWith(color: textColor),
      h3: SparkweaverTypography.heading3.copyWith(color: textColor),
      h4: SparkweaverTypography.heading4.copyWith(color: textColor),
      h5: SparkweaverTypography.heading5.copyWith(color: textColor),
      h6: SparkweaverTypography.heading6.copyWith(color: textColor),
      strong: baseStyle.copyWith(
        fontWeight: SparkweaverTypography.bold,
        color: textColor,
      ),
      em: baseStyle.copyWith(fontStyle: FontStyle.italic, color: textColor),
      del: baseStyle.copyWith(
        decoration: TextDecoration.lineThrough,
        color: textColor,
      ),
      code: SparkweaverTypography.bodyMedium.copyWith(
        fontFamily: SparkweaverTypography.fontFamilyMono,
        color: textColor,
      ),
      blockSpacing: SparkweaverSpacing.sm,
      horizontalRuleDecoration: BoxDecoration(
        border: Border(top: BorderSide(color: textColor, width: 1)),
      ),
      listBullet: baseStyle.copyWith(color: textColor),
      listIndent: SparkweaverSpacing.xl,
      listBulletPadding: const EdgeInsets.only(right: SparkweaverSpacing.xs),
    );
  }

  /// Flattens every block node onto [baseStyle] and zeroes the spacing, so
  /// markdown cannot expand a single-row icon-plus-text layout.
  static MarkdownStyleSheet forInline({
    required TextStyle baseStyle,
    required Color textColor,
  }) {
    final blockStyle = baseStyle.copyWith(color: textColor);
    return MarkdownStyleSheet(
      p: baseStyle,
      a: baseStyle.copyWith(
        color: textColor,
        decoration: TextDecoration.underline,
      ),
      h1: blockStyle,
      h2: blockStyle,
      h3: blockStyle,
      h4: blockStyle,
      h5: blockStyle,
      h6: blockStyle,
      strong: baseStyle.copyWith(
        fontWeight: SparkweaverTypography.bold,
        color: textColor,
      ),
      em: baseStyle.copyWith(fontStyle: FontStyle.italic, color: textColor),
      del: baseStyle.copyWith(
        decoration: TextDecoration.lineThrough,
        color: textColor,
      ),
      code: SparkweaverTypography.bodyMedium.copyWith(
        fontFamily: SparkweaverTypography.fontFamilyMono,
        color: textColor,
      ),
      blockquote: blockStyle,
      blockSpacing: 0,
      listBullet: baseStyle.copyWith(color: textColor),
      listIndent: SparkweaverSpacing.xl,
      listBulletPadding: const EdgeInsets.only(right: SparkweaverSpacing.xs),
    );
  }
}
