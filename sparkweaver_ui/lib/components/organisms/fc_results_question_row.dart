import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_card.dart';
import '../atoms/fc_markdown_text.dart';
import '../molecules/fc_outcome_badge.dart';
import '../templates/fc_results_screen.dart';

/// Session Results Question Row (Organism)
///
/// One per-question card inside `FcResultsScreen`: question text, an
/// outcome badge, the student's answer (if any), the reference answer
/// and any LLM feedback.
class FcResultsQuestionRow extends StatelessWidget {
  final FcResultsQuestion row;

  const FcResultsQuestionRow({super.key, required this.row});

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return FcCard(
      padding: SparkweaverSpacing.edgeInsetsMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${row.number}.',
                style: SparkweaverTypography.labelMedium.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              SparkweaverSpacing.horizontalSpaceSm,
              Expanded(
                child: FcMarkdownText(
                  data: row.question,
                  baseStyle: SparkweaverTypography.bodyLarge.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              SparkweaverSpacing.horizontalSpaceSm,
              FcOutcomeBadge(outcome: row.outcome),
            ],
          ),
          if (row.userAnswer != null) ...[
            SparkweaverSpacing.verticalSpaceXs,
            Text(
              'Your answer: ${row.userAnswer}',
              style: SparkweaverTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ] else if (row.selectedAnswerText != null) ...[
            SparkweaverSpacing.verticalSpaceXs,
            Text(
              'Your answer: ${row.selectedAnswerText}',
              style: SparkweaverTypography.bodySmall.copyWith(
                color: colors.error,
              ),
            ),
          ],
          // Always render the reference answer when we have one, on
          // both correct and incorrect rows. Correct rows benefit for
          // group study — students revisiting the set together want
          // to see what "correct" actually was without flipping back.
          if (row.correctAnswer != null) ...[
            SparkweaverSpacing.verticalSpaceXs,
            FcMarkdownText(
              data: 'Correct answer: ${row.correctAnswer}',
              baseStyle: SparkweaverTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
          if (row.feedback != null && row.feedback!.isNotEmpty) ...[
            SparkweaverSpacing.verticalSpaceXs,
            FcMarkdownText(
              data: row.feedback!,
              baseStyle: SparkweaverTypography.bodySmall.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
