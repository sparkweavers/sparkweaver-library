import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_card.dart';

/// Session Results Score Card (Molecule)
///
/// Shows "X / N correct" plus the percentage inside an [FcCard]. Sits at
/// the top of `FcResultsScreen`.
class FcResultsScoreCard extends StatelessWidget {
  /// Number of correct answers on the latest attempt.
  final int correct;

  /// Total questions answered on the latest attempt.
  final int total;

  const FcResultsScoreCard({
    super.key,
    required this.correct,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final percent = total == 0 ? 0 : (correct * 100 / total).round();
    return FcCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Session results',
            style: SparkweaverTypography.heading5.copyWith(
              color: colors.textPrimary,
            ),
          ),
          SparkweaverSpacing.verticalSpaceSm,
          Text(
            '$correct / $total correct',
            style: SparkweaverTypography.heading2.copyWith(
              color: colors.primary,
            ),
          ),
          SparkweaverSpacing.verticalSpaceXs,
          Text(
            '$percent%',
            style: SparkweaverTypography.bodyLarge.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
