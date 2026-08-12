import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../../design_system/colors.dart';
import '../../design_system/markdown_style.dart';

/// Matches common Markdown metacharacters at the start of a line or inline.
/// Emphasis mirrors CommonMark's flanking rules, so `3 * 3 * 9` and
/// `snake_case_words` stay on the plain [Text] path.
final RegExp _markdownSyntaxPattern = RegExp(
  r'(^|\n)\s{0,3}(#{1,6}\s|>\s|[-*+]\s|\d+\.\s|```|(-{3,}|\*{3,}|_{3,})\s*$)'
  r'|\*\*[^*]+\*\*|__[^_]+__|~~[^~]+~~|`[^`]+`|\[[^\]]+\]\([^)]+\)'
  r'|\*[^*\s](?:[^*]*[^*\s])?\*'
  r'|(?<![A-Za-z0-9])_[^_]+_(?![A-Za-z0-9])',
  multiLine: true,
);

/// Splits on blank lines, since emphasis cannot span a paragraph break.
final RegExp _paragraphBreak = RegExp(r'\n\s*\n');

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

  /// Paragraph alignment. `MarkdownBody` reads alignment from its
  /// stylesheet, not the ambient `DefaultTextStyle`, so this must be passed
  /// explicitly for centred or right-aligned callers like a flip card face.
  final TextAlign? textAlign;

  const FcMarkdownText({
    super.key,
    required this.data,
    required this.baseStyle,
    this.textColor,
    this.inlineOnly = false,
    this.textAlign,
  });

  /// Checks each paragraph, so inline syntax wrapped across a single
  /// newline still counts while a blank line correctly ends it.
  static bool _hasMarkdownSyntax(String data) {
    return data.split(_paragraphBreak).any(_markdownSyntaxPattern.hasMatch);
  }

  /// Maps the handful of alignments call sites actually use onto
  /// `MarkdownStyleSheet.textAlign`'s `WrapAlignment` type.
  static WrapAlignment? _wrapAlignmentFor(TextAlign? textAlign) {
    switch (textAlign) {
      case null:
        return null;
      case TextAlign.center:
        return WrapAlignment.center;
      case TextAlign.end:
      case TextAlign.right:
        return WrapAlignment.end;
      case TextAlign.start:
      case TextAlign.left:
      case TextAlign.justify:
        return WrapAlignment.start;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasMarkdownSyntax(data)) {
      return Text(data, style: baseStyle, textAlign: textAlign);
    }

    // Falls back the same way the plain [Text] path above does, so both
    // paths resolve an omitted color identically instead of diverging.
    final resolvedColor =
        textColor ??
        baseStyle.color ??
        DefaultTextStyle.of(context).style.color ??
        SparkweaverColors.textPrimary;
    var styleSheet = inlineOnly
        ? SparkweaverMarkdownStyle.forInline(
            baseStyle: baseStyle,
            textColor: resolvedColor,
          )
        : SparkweaverMarkdownStyle.forBody(
            baseStyle: baseStyle,
            textColor: resolvedColor,
          );
    final wrapAlignment = _wrapAlignmentFor(textAlign);
    if (wrapAlignment != null) {
      styleSheet = styleSheet.copyWith(textAlign: wrapAlignment);
    }

    return MarkdownBody(
      data: data,
      styleSheet: styleSheet,
      shrinkWrap: true,
      fitContent: true,
      // AI-authored URLs are unvetted, so tapping a link must do nothing.
      onTapLink: (_, _, _) {},
      // Without this the default builder calls Image.network on an
      // AI-authored URL, leaking the user's IP with no interaction.
      imageBuilder: (_, _, _) => const SizedBox.shrink(),
    );
  }
}
