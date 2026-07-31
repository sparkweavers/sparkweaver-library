import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'typography.dart';

/// Shared markdown stylesheet for the flashcard design system.
///
/// Any surface that renders AI-generated markdown (chat bubbles,
/// feedback panels, tutor replies) should pull its stylesheet from
/// here so headings, bold, italic, code, rules, and lists all look
/// the same across the app.
class FlashcardMarkdownStyle {
  FlashcardMarkdownStyle._();

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
      a: baseStyle.copyWith(color: textColor, decoration: TextDecoration.underline),
      h1: FlashcardTypography.heading1.copyWith(color: textColor),
      h2: FlashcardTypography.heading2.copyWith(color: textColor),
      h3: FlashcardTypography.heading3.copyWith(color: textColor),
      h4: FlashcardTypography.heading4.copyWith(color: textColor),
      h5: FlashcardTypography.heading5.copyWith(color: textColor),
      h6: FlashcardTypography.heading6.copyWith(color: textColor),
      strong: baseStyle.copyWith(fontWeight: FlashcardTypography.bold, color: textColor),
      em: baseStyle.copyWith(fontStyle: FontStyle.italic, color: textColor),
      code: FlashcardTypography.bodyMedium.copyWith(
        fontFamily: FlashcardTypography.fontFamilyMono,
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
}
