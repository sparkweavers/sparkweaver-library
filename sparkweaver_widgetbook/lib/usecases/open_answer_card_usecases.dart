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

const _markdownQuestion =
    '## Enzyme Function\n\n'
    'Explain how enzymes speed up reactions. Mention the **active site** '
    'and why the process is considered *catalytic*.';

@widgetbook.UseCase(
  name: 'Markdown Question and Feedback',
  type: FcOpenAnswerCard,
)
Widget markdownQuestionAndFeedback(BuildContext context) {
  return FcOpenAnswerCard(
    question: _markdownQuestion,
    controller: TextEditingController(
      text: 'Enzymes bind to the active site and speed up reactions.',
    ),
    locked: true,
    feedback:
        'Good start — you correctly named the **active site**. To '
        'improve, note that enzymes:\n\n'
        '- lower the *activation energy*\n'
        '- are not consumed by the reaction\n\n'
        'Also try using the term `catalyst` explicitly.',
    progressLabel: '5 / 10',
    onSubmit: (text) {},
  );
}
