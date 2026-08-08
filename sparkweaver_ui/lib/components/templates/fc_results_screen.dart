import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_card.dart';

/// One per-question row inside [FcResultsScreen]. Kept as a plain data
/// class in the library so the widget doesn't depend on any app-side
/// domain types.
class FcResultsQuestion {
  /// 1-indexed position in the summary list (usually questionIndex + 1).
  final int number;

  /// The question text.
  final String question;

  /// Whether the latest attempt was correct.
  final bool isCorrect;

  /// The reference / correct answer, if known. Rendered as tertiary text
  /// under the question when the user got it wrong.
  final String? correctAnswer;

  /// The student's actual answer, if any. For flashcard rows this is
  /// null (no free-text answer was recorded).
  final String? userAnswer;

  /// The text of the multiple-choice option the student selected, if
  /// known. Pre-resolved by the caller (index-to-text lookup happens
  /// outside this widget, same as every other field here). Rendered
  /// as a "Your answer: ..." line in the error/destructive color,
  /// distinct from [userAnswer]'s neutral-color line for free-text
  /// rows. If a row somehow has both [userAnswer] and this field set,
  /// [userAnswer] wins and this field is not rendered — kept simple
  /// because in practice a row is either free-text or multiple-choice,
  /// never both.
  final String? selectedAnswerText;

  /// LLM-generated feedback, if any.
  final String? feedback;

  const FcResultsQuestion({
    required this.number,
    required this.question,
    required this.isCorrect,
    this.correctAnswer,
    this.userAnswer,
    this.selectedAnswerText,
    this.feedback,
  });
}

/// Flashcard grade distribution for the summary. Non-null only for
/// flashcard-mode sessions.
class FcResultsGradeDistribution {
  final int hard;
  final int medium;
  final int easy;

  const FcResultsGradeDistribution({
    required this.hard,
    required this.medium,
    required this.easy,
  });

  int get total => hard + medium + easy;
}

/// Session Results Screen (Template)
///
/// Shows the end-of-session summary: total correct out of total answered,
/// an optional grade distribution (flashcard-mode only), and a scrollable
/// per-question list with correct/incorrect chips + optional feedback.
///
/// Rendered inside a caller-provided Scaffold (or as the body of one) —
/// the template does not wrap itself in Material chrome so it composes
/// with any AppBar or navigation the app wants.
///
/// ## Usage
///
/// ```dart
/// FcResultsScreen(
///   correct: 7,
///   total: 10,
///   questions: [
///     FcResultsQuestion(number: 1, question: '…', isCorrect: true, feedback: '…'),
///     ...
///   ],
///   gradeDistribution: FcResultsGradeDistribution(hard: 2, medium: 3, easy: 5),
///   onFinish: () => Navigator.pop(context),
/// )
/// ```
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
              padding: FlashcardSpacing.edgeInsetsLg,
              children: [
                _ScoreCard(correct: correct, total: total),
                if (gradeDistribution != null) ...[
                  FlashcardSpacing.verticalSpaceMd,
                  _GradeDistributionCard(distribution: gradeDistribution!),
                ],
                FlashcardSpacing.verticalSpaceLg,
                Text('Per question', style: FlashcardTypography.heading5),
                FlashcardSpacing.verticalSpaceSm,
                for (final q in questions) ...[
                  _QuestionRow(row: q),
                  FlashcardSpacing.verticalSpaceSm,
                ],
              ],
            ),
          ),
          Padding(
            padding: FlashcardSpacing.edgeInsetsLg,
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

class _ScoreCard extends StatelessWidget {
  final int correct;
  final int total;

  const _ScoreCard({required this.correct, required this.total});

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    final percent = total == 0 ? 0 : (correct * 100 / total).round();
    return FcCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Session results',
            style: FlashcardTypography.heading5.copyWith(
              color: colors.textPrimary,
            ),
          ),
          FlashcardSpacing.verticalSpaceSm,
          Text(
            '$correct / $total correct',
            style: FlashcardTypography.heading2.copyWith(color: colors.primary),
          ),
          FlashcardSpacing.verticalSpaceXs,
          Text(
            '$percent%',
            style: FlashcardTypography.bodyLarge.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _GradeDistributionCard extends StatelessWidget {
  final FcResultsGradeDistribution distribution;

  const _GradeDistributionCard({required this.distribution});

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return FcCard(
      variant: FcCardVariant.muted,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Self-rating distribution',
            style: FlashcardTypography.heading6.copyWith(
              color: colors.textPrimary,
            ),
          ),
          FlashcardSpacing.verticalSpaceSm,
          _distributionRow(
            'Knew it',
            distribution.easy,
            colors.success,
            colors.textPrimary,
          ),
          FlashcardSpacing.verticalSpaceXs,
          _distributionRow(
            'Almost',
            distribution.medium,
            colors.warning,
            colors.textPrimary,
          ),
          FlashcardSpacing.verticalSpaceXs,
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
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        ),
        FlashcardSpacing.horizontalSpaceSm,
        Text(
          label,
          style: FlashcardTypography.bodyMedium.copyWith(color: textColor),
        ),
        const Spacer(),
        Text(
          '$count',
          style: FlashcardTypography.bodyMedium.copyWith(color: textColor),
        ),
      ],
    );
  }
}

class _QuestionRow extends StatelessWidget {
  final FcResultsQuestion row;

  const _QuestionRow({required this.row});

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    final chipColor = row.isCorrect ? colors.success : colors.error;
    final chipLabel = row.isCorrect ? 'Correct' : 'Incorrect';
    return FcCard(
      padding: FlashcardSpacing.edgeInsetsMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '${row.number}.',
                style: FlashcardTypography.labelMedium.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              FlashcardSpacing.horizontalSpaceSm,
              Expanded(
                child: Text(
                  row.question,
                  style: FlashcardTypography.bodyLarge.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
              FlashcardSpacing.horizontalSpaceSm,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: FlashcardSpacing.sm,
                  vertical: FlashcardSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: chipColor,
                  borderRadius: FlashcardTokens.badgeRadius,
                ),
                child: Text(
                  chipLabel,
                  // White stays literal here: it is the foreground for a
                  // filled, saturated chip in both themes, not a surface
                  // colour that should track brightness.
                  style: FlashcardTypography.labelSmall.copyWith(
                    color: SparkweaverColors.white,
                  ),
                ),
              ),
            ],
          ),
          if (row.userAnswer != null) ...[
            FlashcardSpacing.verticalSpaceXs,
            Text(
              'Your answer: ${row.userAnswer}',
              style: FlashcardTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ] else if (row.selectedAnswerText != null) ...[
            FlashcardSpacing.verticalSpaceXs,
            Text(
              'Your answer: ${row.selectedAnswerText}',
              style: FlashcardTypography.bodySmall.copyWith(
                color: colors.error,
              ),
            ),
          ],
          // Always render the reference answer when we have one, on
          // both correct and incorrect rows. Correct rows benefit for
          // group study — students revisiting the set together want
          // to see what "correct" actually was without flipping back.
          if (row.correctAnswer != null) ...[
            FlashcardSpacing.verticalSpaceXs,
            Text(
              'Correct answer: ${row.correctAnswer}',
              style: FlashcardTypography.bodySmall.copyWith(
                color: colors.textSecondary,
              ),
            ),
          ],
          if (row.feedback != null && row.feedback!.isNotEmpty) ...[
            FlashcardSpacing.verticalSpaceXs,
            Text(
              row.feedback!,
              style: FlashcardTypography.bodySmall.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
