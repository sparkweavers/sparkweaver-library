import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Correct row', type: FcResultsScreen)
Widget correctRow(BuildContext context) {
  return FcResultsScreen(
    correct: 1,
    total: 1,
    questions: const [
      FcResultsQuestion(
        number: 1,
        question: 'Which planet is closest to the sun?',
        isCorrect: true,
        correctAnswer: 'Mercury',
      ),
    ],
    onFinish: () {},
  );
}

@widgetbook.UseCase(
  name: 'Incorrect row with wrong selection',
  type: FcResultsScreen,
)
Widget incorrectRowWithWrongSelection(BuildContext context) {
  return FcResultsScreen(
    correct: 0,
    total: 1,
    questions: const [
      FcResultsQuestion(
        number: 1,
        question: 'Which planet is closest to the sun?',
        isCorrect: false,
        correctAnswer: 'Mercury',
        selectedAnswerText: 'Venus',
      ),
    ],
    onFinish: () {},
  );
}

@widgetbook.UseCase(
  name: 'Incorrect row with no selection',
  type: FcResultsScreen,
)
Widget incorrectRowWithNoSelection(BuildContext context) {
  return FcResultsScreen(
    correct: 0,
    total: 1,
    questions: const [
      FcResultsQuestion(
        number: 1,
        question: 'Which planet is closest to the sun?',
        isCorrect: false,
        correctAnswer: 'Mercury',
      ),
    ],
    onFinish: () {},
  );
}
