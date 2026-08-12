import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'typography.dart';

/// Shared markdown stylesheet for the Sparkweaver design system.
///
/// Any surface that renders AI-generated markdown (chat bubbles,
/// feedback panels, tutor replies) should pull its stylesheet from
/// here so headings, bold, italic, code, rules, and lists all look
/// the same across the app.
///
/// `forBody` styles h1-h6 from [SparkweaverTypography] and `textColor`,
/// so `baseStyle`'s weight and size do not govern heading nodes.
class SparkweaverMarkdownStyle {
  SparkweaverMarkdownStyle._();

  /// Build a stylesheet tuned to [baseStyle] and [textColor]. The
  /// caller supplies the base body style so the same markdown block
  /// can adopt user-message vs AI-message typography (or, for the
  /// feedback panel, a body-medium style on an accent background).
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
      code: SparkweaverTypography.bodyMedium.copyWith(
        fontFamily: SparkweaverTypography.fontFamilyMono,
        color: textColor,
      ),
      blockSpacing: 8,
      horizontalRuleDecoration: BoxDecoration(
        border: Border(top: BorderSide(color: textColor, width: 1)),
      ),
      listBullet: baseStyle.copyWith(color: textColor),
      listIndent: 24.0,
      listBulletPadding: const EdgeInsets.only(right: 4),
    );
  }

  /// Build a stylesheet for markdown inside a single-row layout (icon plus
  /// text). Headings, list items and blockquotes all render at [baseStyle]
  /// size, [blockSpacing] is zero, and blockquote/rule decorations are
  /// dropped, so the row grows only through natural text wrap.
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
      code: SparkweaverTypography.bodyMedium.copyWith(
        fontFamily: SparkweaverTypography.fontFamilyMono,
        color: textColor,
      ),
      blockquote: blockStyle,
      blockSpacing: 0,
      listBullet: baseStyle.copyWith(color: textColor),
      listIndent: 24.0,
      listBulletPadding: const EdgeInsets.only(right: 4),
    );
  }
}
