import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_card.dart';
import '../atoms/fc_markdown_text.dart';
import '../molecules/fc_outcome_badge.dart';

/// One per-question row inside `FcResultsScreen`. Kept as a plain data
/// class in the library so the widget doesn't depend on any app-side
/// domain types.
class FcResultsQuestion {
  /// 1-indexed position in the summary list (usually questionIndex + 1).
  final int number;

  /// The question text.
  final String question;

  /// The resolved outcome: correct/incorrect for scored questions, or a
  /// self-rating grade for flashcard questions.
  final FcResultOutcome outcome;

  /// The reference / correct answer, if known. Rendered as tertiary text
  /// under the question when the user got it wrong.
  final String? correctAnswer;

  /// The student's actual answer, if any. For flashcard rows this is
  /// null (no free-text answer was recorded).
  final String? userAnswer;

  /// Pre-resolved text of the selected multiple-choice option, rendered in
  /// the error color. Ignored when [userAnswer] is set.
  final String? selectedAnswerText;

  /// LLM-generated feedback, if any.
  final String? feedback;

  const FcResultsQuestion({
    required this.number,
    required this.question,
    required this.outcome,
    this.correctAnswer,
    this.userAnswer,
    this.selectedAnswerText,
    this.feedback,
  });
}

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
          // Shown on correct rows too, so group study doesn't need to
          // flip back to see what "correct" was.
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
