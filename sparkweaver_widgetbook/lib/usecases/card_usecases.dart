import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Surface Variant', type: FcCard)
Widget surfaceCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcCard(
      child: Text(
        'Session results',
        style: SparkweaverTypography.heading5.copyWith(
          color: SparkweaverTheme.of(context).textPrimary,
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Muted Variant', type: FcCard)
Widget mutedCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcCard(
      variant: FcCardVariant.muted,
      child: Text(
        'Nearly, but latent learning is not the same thing.',
        style: SparkweaverTypography.bodyMedium.copyWith(
          color: SparkweaverTheme.of(context).textPrimary,
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Padding', type: FcCard)
Widget customPaddingCard(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcCard(
      padding: SparkweaverSpacing.edgeInsetsMd,
      child: Text(
        'A denser card, padded with edgeInsetsMd instead of the default.',
        style: SparkweaverTypography.bodyMedium.copyWith(
          color: SparkweaverTheme.of(context).textPrimary,
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Both Variants', type: FcCard)
Widget bothVariants(BuildContext context) {
  final colors = SparkweaverTheme.of(context);
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FcCard(
          child: Text(
            'Surface: the primary content block on a screen.',
            style: SparkweaverTypography.bodyMedium.copyWith(
              color: colors.textPrimary,
            ),
          ),
        ),
        SparkweaverSpacing.verticalSpaceMd,
        FcCard(
          variant: FcCardVariant.muted,
          child: Text(
            'Muted: a quieter block nested beside a surface card.',
            style: SparkweaverTypography.bodyMedium.copyWith(
              color: colors.textPrimary,
            ),
          ),
        ),
      ],
    ),
  );
}
