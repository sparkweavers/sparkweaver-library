import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_card.dart';
import '../templates/fc_results_screen.dart';

/// Session Results Grade Distribution Card (Molecule)
///
/// Shows how many flashcards were graded "Again", "Almost" and "Knew it"
/// as coloured dot rows inside an [FcCard]. Rendered by `FcResultsScreen`
/// only for flashcard-mode sessions.
class FcResultsGradeDistributionCard extends StatelessWidget {
  final FcResultsGradeDistribution distribution;

  const FcResultsGradeDistributionCard({super.key, required this.distribution});

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return FcCard(
      variant: FcCardVariant.muted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Self-rating distribution',
            style: SparkweaverTypography.heading6.copyWith(
              color: colors.textPrimary,
            ),
          ),
          SparkweaverSpacing.verticalSpaceSm,
          _distributionRow(
            'Knew it',
            distribution.easy,
            colors.success,
            colors.textPrimary,
          ),
          SparkweaverSpacing.verticalSpaceXs,
          _distributionRow(
            'Almost',
            distribution.medium,
            colors.warning,
            colors.textPrimary,
          ),
          SparkweaverSpacing.verticalSpaceXs,
          _distributionRow(
            'Again',
            distribution.hard,
            colors.error,
            colors.textPrimary,
          ),
        ],
      ),
    );
  }

  Widget _distributionRow(
    String label,
    int count,
    Color dotColor,
    Color textColor,
  ) {
    return Row(
      children: [
        Container(
          width: SparkweaverTokens.iconXs,
          height: SparkweaverTokens.iconXs,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        SparkweaverSpacing.horizontalSpaceSm,
        Text(
          label,
          style: SparkweaverTypography.bodyMedium.copyWith(color: textColor),
        ),
        const Spacer(),
        Text(
          '$count',
          style: SparkweaverTypography.bodyMedium.copyWith(color: textColor),
        ),
      ],
    );
  }
}
