import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _question =
    'Which gas do plants primarily absorb during '
    'photosynthesis?';
const _options = ['Carbon dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'];

@widgetbook.UseCase(name: 'Unanswered', type: FcMcQuestionCard)
Widget unanswered(BuildContext context) {
  return FcMcQuestionCard(
    question: _question,
    options: _options,
    progressLabel: '3 / 10',
    onSelected: (i) {},
  );
}

@widgetbook.UseCase(name: 'Answered Correctly', type: FcMcQuestionCard)
Widget answeredCorrectly(BuildContext context) {
  return FcMcQuestionCard(
    question: _question,
    options: _options,
    selectedIndex: 0,
    correctIndex: 0,
    progressLabel: '3 / 10',
    onSelected: (i) {},
  );
}

@widgetbook.UseCase(name: 'Answered Incorrectly', type: FcMcQuestionCard)
Widget answeredIncorrectly(BuildContext context) {
  return FcMcQuestionCard(
    question: _question,
    options: _options,
    // Selected "Oxygen" (index 1) while the correct option is "Carbon
    // dioxide" (index 0) — the selected option shows the destructive
    // style and the correct option shows the primary style.
    selectedIndex: 1,
    correctIndex: 0,
    progressLabel: '3 / 10',
    onSelected: (i) {},
  );
}

@widgetbook.UseCase(name: 'With Feedback', type: FcMcQuestionCard)
Widget withFeedback(BuildContext context) {
  return FcMcQuestionCard(
    question: _question,
    options: _options,
    selectedIndex: 1,
    correctIndex: 0,
    feedback:
        'Not quite — plants absorb carbon dioxide from the air and '
        'release oxygen as a byproduct, so it is easy to mix up which gas '
        'goes in and which comes out.',
    progressLabel: '3 / 10',
    onSelected: (i) {},
  );
}
