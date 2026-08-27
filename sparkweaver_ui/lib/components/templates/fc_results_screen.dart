import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../molecules/fc_outcome_badge.dart';
import '../molecules/fc_results_grade_distribution_card.dart';
import '../molecules/fc_results_score_card.dart';
import '../organisms/fc_results_question_row.dart';

/// One per-question row inside [FcResultsScreen]. Kept as a plain data
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
    required this.outcome,
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
///     FcResultsQuestion(number: 1, question: '…', outcome: FcScoredOutcome(true), feedback: '…'),
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
