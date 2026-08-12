import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Front Face', type: FcFlipCard)
Widget frontFace(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcFlipCard(
      front: 'What is the powerhouse of the cell?',
      back: 'The mitochondrion.',
      progressLabel: '1 / 10',
    ),
  );
}

// FcFlipCard has no "start on the back" parameter — the back face's
// surfaceVariant fill and its always-on primaryLight border (the reason
// this component keeps a hand-rolled Container instead of FcCard) can
// only be reviewed by actually tapping the card below, exactly as a
// student would in the app.
@widgetbook.UseCase(name: 'Back Face (tap to flip)', type: FcFlipCard)
Widget backFace(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Tap the card to flip it and review the back-face colours.',
          style: SparkweaverTypography.bodySmall.copyWith(
            color: SparkweaverTheme.of(context).textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        SparkweaverSpacing.verticalSpaceSm,
        const FcFlipCard(
          front: 'Who proposed the theory of natural selection?',
          back: 'Charles Darwin.',
          progressLabel: '4 / 10',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Long Content', type: FcFlipCard)
Widget longContent(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcFlipCard(
      front:
          'Explain, in your own words, why the sky appears blue during '
          'the day but red or orange at sunset.',
      back:
          'Sunlight is made of many colours. Shorter wavelengths, like '
          'blue, scatter more strongly off molecules in the atmosphere, so '
          'blue light reaches our eyes from every direction during the '
          'day. At sunset, light travels through much more atmosphere, so '
          'most of the blue scatters away before it reaches us, leaving '
          'the longer red and orange wavelengths to dominate what we see.',
      progressLabel: '7 / 10',
    ),
  );
}

@widgetbook.UseCase(name: 'Markdown Content', type: FcFlipCard)
Widget markdownContent(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcFlipCard(
      front:
          'Which **three primary colors** of light combine to create '
          'white light?',
      back:
          '## Primary Colors of Light\n\n'
          '- Red\n'
          '- Green\n'
          '- Blue\n\n'
          'At full intensity they combine into `white light`, which works '
          'by *additive* mixing, unlike pigment mixing.',
      progressLabel: '8 / 10',
    ),
  );
}
