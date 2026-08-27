import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
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

/// Solid-pill outcome chip for one results row, not an FcBadge variant.
class FcOutcomeBadge extends StatelessWidget {
  final FcResultOutcome outcome;
  const FcOutcomeBadge({super.key, required this.outcome});

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final (label, chipColor) = switch (outcome) {
      FcScoredOutcome(isCorrect: true) => ('Correct', colors.success),
      FcScoredOutcome(isCorrect: false) => ('Incorrect', colors.error),
      FcGradedOutcome(:final grade) => (grade.label, grade.color(context)),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SparkweaverSpacing.sm,
        vertical: SparkweaverSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: SparkweaverTokens.badgeRadius,
      ),
      child: Text(
        label,
        style: SparkweaverTypography.labelSmall.copyWith(
          color: SparkweaverColors.white,
        ),
      ),
    );
  }
}
