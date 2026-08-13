import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../../design_system/colors.dart';
import '../../design_system/markdown_style.dart';

/// Matches Markdown metacharacters, with emphasis following CommonMark's
/// flanking rules so `3 * 3 * 9` and `snake_case_words` stay plain.
final RegExp _markdownSyntaxPattern = RegExp(
  r'(^|\n)\s{0,3}(#{1,6}\s|>\s|[-*+]\s|\d+\.\s|```|(-{3,}|\*{3,}|_{3,})\s*$)'
  r'|\*\*[^*]+\*\*|__[^_]+__|~~[^~]+~~|`[^`]+`|\[[^\]]+\]\([^)]+\)'
  r'|\*[^*\s](?:[^*]*[^*\s])?\*'
  r'|(?<![A-Za-z0-9])_[^_]+_(?![A-Za-z0-9])',
  multiLine: true,
);

/// Splits on blank lines, since emphasis cannot span a paragraph break.
final RegExp _paragraphBreak = RegExp(r'\n\s*\n');

/// Renders [data] as Markdown, falling back to a bare [Text] when it holds
/// none so plain strings keep their existing spacing.
class FcMarkdownText extends StatelessWidget {
  /// The text to render, plain or Markdown.
  final String data;

  /// Body style, inherited by bold, italic and code nodes.
  final TextStyle baseStyle;

  /// Color for headings, links and rules. Defaults to [baseStyle]'s color.
  final Color? textColor;

  /// Uses [SparkweaverMarkdownStyle.forInline] instead of `forBody`.
  final bool inlineOnly;

  /// Needed explicitly because MarkdownBody aligns from its stylesheet
  /// rather than the ambient `DefaultTextStyle`.
  final TextAlign? textAlign;

  const FcMarkdownText({
    super.key,
    required this.data,
    required this.baseStyle,
    this.textColor,
    this.inlineOnly = false,
    this.textAlign,
  });

  /// Checks per paragraph, so emphasis may span a newline but not a
  /// blank line.
  static bool _hasMarkdownSyntax(String data) {
    return data.split(_paragraphBreak).any(_markdownSyntaxPattern.hasMatch);
  }

  /// Maps onto `MarkdownStyleSheet.textAlign`'s `WrapAlignment`.
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

    // Falls back as the plain [Text] path does, so neither diverges.
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
      // The default builder would call Image.network on an AI-authored
      // URL, leaking the viewer's IP with no interaction.
      imageBuilder: (_, _, _) => const SizedBox.shrink(),
    );
  }
}
