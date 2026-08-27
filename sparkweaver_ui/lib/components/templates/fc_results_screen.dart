import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../molecules/fc_results_grade_distribution_card.dart';
import '../molecules/fc_results_score_card.dart';
import '../organisms/fc_results_question_row.dart';

/// End-of-session summary. Renders inside a caller-provided Scaffold, so it
/// adds no Material chrome of its own.
class FcResultsScreen extends StatelessWidget {
  /// Number of correct answers on the latest attempt.
  final int correct;

  /// Total questions answered on the latest attempt.
  final int total;

  /// Per-question breakdown, in the order the questions were asked.
  final List<FcResultsQuestion> questions;

  /// Flashcard grade distribution. Non-null only for flashcard-mode
  /// sessions; the grade block hides when null.
  final FcResultsGradeDistribution? gradeDistribution;

  /// Called when the user taps the "Done" button. Typically pops back to
  /// the previous screen.
  final VoidCallback? onFinish;

  /// Label for the finish button. Defaults to `Done`.
  final String finishLabel;

  const FcResultsScreen({
    super.key,
    required this.correct,
    required this.total,
    required this.questions,
    this.gradeDistribution,
    this.onFinish,
    this.finishLabel = 'Done',
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: SparkweaverSpacing.edgeInsetsLg,
              children: [
                FcResultsScoreCard(correct: correct, total: total),
                if (gradeDistribution != null) ...[
                  SparkweaverSpacing.verticalSpaceMd,
                  FcResultsGradeDistributionCard(
                    distribution: gradeDistribution!,
                  ),
                ],
                SparkweaverSpacing.verticalSpaceLg,
                Text('Per question', style: SparkweaverTypography.heading5),
                SparkweaverSpacing.verticalSpaceSm,
                for (final q in questions) ...[
                  FcResultsQuestionRow(row: q),
                  SparkweaverSpacing.verticalSpaceSm,
                ],
              ],
            ),
          ),
          Padding(
            padding: SparkweaverSpacing.edgeInsetsLg,
            child: FcButton(
              label: finishLabel,
              fullWidth: true,
              onPressed: onFinish,
            ),
          ),
        ],
      ),
    );
  }
}
