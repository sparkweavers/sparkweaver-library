import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_badge.dart';
import 'fc_self_rating_bar.dart';

/// The resolved outcome of one results-screen question: either a
/// correct/incorrect score or a flashcard self-rating grade.
sealed class FcResultOutcome {
  const FcResultOutcome();
}

/// A scored (non-flashcard) question: correct or incorrect.
class FcScoredOutcome extends FcResultOutcome {
  final bool isCorrect;
  const FcScoredOutcome(this.isCorrect);
}

/// A flashcard question rated by the student.
class FcGradedOutcome extends FcResultOutcome {
  final FcSelfRatingGrade grade;
  const FcGradedOutcome(this.grade);
}

/// Session Results Outcome Badge (Molecule)
///
/// Renders the correct/incorrect or self-rating-grade chip for one
/// results-screen row. Solid background, not the tinted [FcBadgeVariants]
/// style, so it stays legible against saturated colours in both themes.
class FcOutcomeBadge extends StatelessWidget {
  final FcResultOutcome outcome;
  const FcOutcomeBadge({super.key, required this.outcome});

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return switch (outcome) {
      FcScoredOutcome(isCorrect: true) => FcBadge(
        text: 'Correct',
        backgroundColor: colors.success,
        foregroundColor: SparkweaverColors.white,
      ),
      FcScoredOutcome(isCorrect: false) => FcBadge(
        text: 'Incorrect',
        backgroundColor: colors.error,
        foregroundColor: SparkweaverColors.white,
      ),
      FcGradedOutcome(:final grade) => FcBadge(
        text: grade.label,
        backgroundColor: grade.color(context),
        foregroundColor: SparkweaverColors.white,
      ),
    };
  }
}
