import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../../design_system/markdown_style.dart';

/// Matches common Markdown metacharacters at the start of a line or inline.
/// Kept conservative on purpose: any ambiguous string falls through to
/// [MarkdownBody] rather than being wrongly treated as plain text.
final RegExp _markdownSyntaxPattern = RegExp(
  r'(^|\n)\s{0,3}(#{1,6}\s|>\s|[-*+]\s|\d+\.\s|```|(-{3,}|\*{3,}|_{3,})\s*$)'
  r'|(\*\*[^*\n]+\*\*|__[^_\n]+__|~~[^~\n]+~~|`[^`\n]+`|\[[^\]\n]+\]\([^)\n]+\))',
  multiLine: true,
);

/// Sparkweaver Markdown Text Component (Atom)
///
/// Renders [data] as Markdown when it contains Markdown syntax, otherwise
/// falls back to a bare [Text] so plain strings keep today's zero-spacing
/// behaviour. Composes only [MarkdownBody] and [SparkweaverMarkdownStyle].
///
/// `forBody` (the default stylesheet) styles h1-h6 from
/// `SparkweaverTypography` and `textColor`, so `baseStyle`'s weight and size
/// do not govern heading nodes. Use `inlineOnly: true` to keep every node at
/// `baseStyle` size, for single-row icon-plus-text layouts.
///
/// ## Usage
///
/// ```dart
/// FcMarkdownText(
///   data: feedback,
///   baseStyle: SparkweaverTypography.bodyMedium,
///   textColor: colors.textPrimary,
/// )
/// ```
class FcMarkdownText extends StatelessWidget {
  /// The text to render, plain or Markdown.
  final String data;

  /// The base style applied to body text and, for `forBody`, inherited by
  /// bold/italic/code nodes.
  final TextStyle baseStyle;

  /// Color for headings, links and rules. Defaults to [baseStyle]'s color.
  final Color? textColor;

  /// Uses [SparkweaverMarkdownStyle.forInline] instead of `forBody`.
  final bool inlineOnly;

  const FcMarkdownText({
    super.key,
    required this.data,
    required this.baseStyle,
    this.textColor,
    this.inlineOnly = false,
  });

  /// Conservative check for Markdown syntax. Plain strings with no match
  /// render as a bare [Text] so existing call sites see zero regression.
  static bool _hasMarkdownSyntax(String data) {
    return _markdownSyntaxPattern.hasMatch(data);
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasMarkdownSyntax(data)) {
      return Text(data, style: baseStyle);
    }

    final resolvedColor = textColor ?? baseStyle.color ?? Colors.black;
    final styleSheet = inlineOnly
        ? SparkweaverMarkdownStyle.forInline(
            baseStyle: baseStyle,
            textColor: resolvedColor,
          )
        : SparkweaverMarkdownStyle.forBody(
            baseStyle: baseStyle,
            textColor: resolvedColor,
          );

    return MarkdownBody(
      data: data,
      styleSheet: styleSheet,
      shrinkWrap: true,
      fitContent: true,
      // AI-authored URLs are unvetted, so tapping a link must do nothing.
      onTapLink: (_, _, _) {},
    );
  }
}
