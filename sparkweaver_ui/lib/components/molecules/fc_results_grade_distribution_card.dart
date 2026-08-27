import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_card.dart';
import '../templates/fc_results_screen.dart';
import 'fc_self_rating_bar.dart';

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
            context,
            FcSelfRatingGrade.knewIt,
            distribution.easy,
          ),
          SparkweaverSpacing.verticalSpaceXs,
          _distributionRow(
            context,
            FcSelfRatingGrade.almost,
            distribution.medium,
          ),
          SparkweaverSpacing.verticalSpaceXs,
          _distributionRow(context, FcSelfRatingGrade.again, distribution.hard),
        ],
      ),
    );
  }

  Widget _distributionRow(
    BuildContext context,
    FcSelfRatingGrade grade,
    int count,
  ) {
    final colors = SparkweaverTheme.of(context);
    return Row(
      children: [
        Container(
          width: SparkweaverTokens.iconXs,
          height: SparkweaverTokens.iconXs,
          decoration: BoxDecoration(
            color: grade.color(context),
            shape: BoxShape.circle,
          ),
        ),
        SparkweaverSpacing.horizontalSpaceSm,
        Text(
          grade.label,
          style: SparkweaverTypography.bodyMedium.copyWith(
            color: colors.textPrimary,
          ),
        ),
        const Spacer(),
        Text(
          '$count',
          style: SparkweaverTypography.bodyMedium.copyWith(
            color: colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
