import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _question = 'Explain, in your own words, what photosynthesis is.';

@widgetbook.UseCase(name: 'Empty Input', type: FcOpenAnswerCard)
Widget emptyInput(BuildContext context) {
  return FcOpenAnswerCard(
    question: _question,
    progressLabel: '5 / 10',
    onSubmit: (text) {},
  );
}

@widgetbook.UseCase(name: 'Filled Input', type: FcOpenAnswerCard)
Widget filledInput(BuildContext context) {
  return FcOpenAnswerCard(
    question: _question,
    controller: TextEditingController(
      text:
          'Photosynthesis is the process plants use to convert light '
          'energy into chemical energy, storing it as glucose.',
    ),
    progressLabel: '5 / 10',
    onSubmit: (text) {},
  );
}

@widgetbook.UseCase(name: 'With Feedback', type: FcOpenAnswerCard)
Widget withFeedback(BuildContext context) {
  return FcOpenAnswerCard(
    question: _question,
    controller: TextEditingController(
      text:
          'Plants use sunlight to turn water and carbon dioxide into '
          'energy and oxygen.',
    ),
    locked: true,
    feedback:
        'Good — that captures the main idea. For full marks, mention '
        'that the energy is stored as glucose and that oxygen is released '
        'as a byproduct.',
    progressLabel: '5 / 10',
    onSubmit: (text) {},
  );
}
