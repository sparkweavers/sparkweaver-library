import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Bold and Italic', type: FcMarkdownText)
Widget boldAndItalic(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data:
          'Photosynthesis converts light energy into chemical energy. The '
          '**light-dependent reactions** happen first, followed by the '
          '*Calvin cycle*.',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Bulleted List', type: FcMarkdownText)
Widget bulletedList(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data:
          'Key stages of mitosis:\n\n'
          '- Prophase\n'
          '- Metaphase\n'
          '- Anaphase\n'
          '- Telophase',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Inline Code', type: FcMarkdownText)
Widget inlineCode(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data:
          'In Python, define an empty list with `my_list = []` before '
          'appending items to it.',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Heading', type: FcMarkdownText)
Widget heading(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data:
          '## Cell Structure\n\n'
          'Every eukaryotic cell contains a nucleus, mitochondria, and a '
          'cell membrane.',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
      textColor: colors.textPrimary,
    ),
  );
}

@widgetbook.UseCase(name: 'Link', type: FcMarkdownText)
Widget link(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data:
          'For a deeper dive, see the '
          '[official IUPAC nomenclature guide](https://iupac.org). '
          'Links render as text only — tapping does nothing.',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
      textColor: colors.textPrimary,
    ),
  );
}

@widgetbook.UseCase(name: 'Full Markdown Sample', type: FcMarkdownText)
Widget fullMarkdownSample(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data:
          '## Newton\'s Laws of Motion\n\n'
          'Sir Isaac Newton formulated three laws of motion:\n\n'
          '- **First law**: an object stays at rest or in motion unless '
          'acted on by a *net force*\n'
          '- **Second law**: `F = m * a`\n'
          '- **Third law**: for every action there is an equal and '
          'opposite reaction\n\n'
          'Read the [full derivation](https://example.com/newton) for '
          'worked examples.',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
      textColor: colors.textPrimary,
    ),
  );
}

@widgetbook.UseCase(name: 'Plain Text (No Markdown)', type: FcMarkdownText)
Widget plainText(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcMarkdownText(
      data: 'Water boils at 100 degrees Celsius at sea level.',
      baseStyle: SparkweaverTypography.bodyMedium.copyWith(
        color: colors.textPrimary,
      ),
    ),
  );
}
