import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Scored correct', type: FcOutcomeBadge)
Widget scoredCorrect(BuildContext context) {
  return const Center(child: FcOutcomeBadge(outcome: FcScoredOutcome(true)));
}

@widgetbook.UseCase(name: 'Scored incorrect', type: FcOutcomeBadge)
Widget scoredIncorrect(BuildContext context) {
  return const Center(child: FcOutcomeBadge(outcome: FcScoredOutcome(false)));
}

@widgetbook.UseCase(name: 'Graded again', type: FcOutcomeBadge)
Widget gradedAgain(BuildContext context) {
  return const Center(
    child: FcOutcomeBadge(outcome: FcGradedOutcome(FcSelfRatingGrade.again)),
  );
}

@widgetbook.UseCase(name: 'Graded almost', type: FcOutcomeBadge)
Widget gradedAlmost(BuildContext context) {
  return const Center(
    child: FcOutcomeBadge(outcome: FcGradedOutcome(FcSelfRatingGrade.almost)),
  );
}

@widgetbook.UseCase(name: 'Graded knew it', type: FcOutcomeBadge)
Widget gradedKnewIt(BuildContext context) {
  return const Center(
    child: FcOutcomeBadge(outcome: FcGradedOutcome(FcSelfRatingGrade.knewIt)),
  );
}

@widgetbook.UseCase(name: 'All five states', type: FcOutcomeBadge)
Widget allStates(BuildContext context) {
  return const Center(
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        FcOutcomeBadge(outcome: FcScoredOutcome(true)),
        FcOutcomeBadge(outcome: FcScoredOutcome(false)),
        FcOutcomeBadge(outcome: FcGradedOutcome(FcSelfRatingGrade.again)),
        FcOutcomeBadge(outcome: FcGradedOutcome(FcSelfRatingGrade.almost)),
        FcOutcomeBadge(outcome: FcGradedOutcome(FcSelfRatingGrade.knewIt)),
      ],
    ),
  );
}
