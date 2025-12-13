import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Display Styles', type: FcText)
Widget displayStyles(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FcText('Display Large', style: FcTextStyle.displayLarge),
        SizedBox(height: 8),
        FcText('Display Medium', style: FcTextStyle.displayMedium),
        SizedBox(height: 8),
        FcText('Display Small', style: FcTextStyle.displaySmall),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Headings', type: FcText)
Widget headings(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FcText('Heading 1', style: FcTextStyle.heading1),
        FcText('Heading 2', style: FcTextStyle.heading2),
        FcText('Heading 3', style: FcTextStyle.heading3),
        FcText('Heading 4', style: FcTextStyle.heading4),
        FcText('Heading 5', style: FcTextStyle.heading5),
        FcText('Heading 6', style: FcTextStyle.heading6),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Body Text', type: FcText)
Widget bodyText(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FcText('Body Large', style: FcTextStyle.bodyLarge),
        FcText('Body Medium', style: FcTextStyle.bodyMedium),
        FcText('Body Small', style: FcTextStyle.bodySmall),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Labels', type: FcText)
Widget labels(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FcText('Label Large', style: FcTextStyle.labelLarge),
        FcText('Label Medium', style: FcTextStyle.labelMedium),
        FcText('Label Small', style: FcTextStyle.labelSmall),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Color Variants', type: FcText)
Widget colorVariants(BuildContext context) {
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FcText('Primary Text', color: FlashcardColors.primary),
        FcText('Success Text', color: FlashcardColors.success),
        FcText('Error Text', color: FlashcardColors.error),
        FcText('Warning Text', color: FlashcardColors.warning),
      ],
    ),
  );
}
