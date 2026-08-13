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

@widgetbook.UseCase(
  name: 'Full session (mixed multiple-choice and free-text)',
  type: FcResultsScreen,
)
Widget fullSession(BuildContext context) {
  return FcResultsScreen(
    correct: 5,
    total: 8,
    questions: const [
      FcResultsQuestion(
        number: 1,
        question: 'Which planet is closest to the sun?',
        isCorrect: true,
        correctAnswer: 'Mercury',
      ),
      FcResultsQuestion(
        number: 2,
        question: 'What is the powerhouse of the cell?',
        isCorrect: true,
        correctAnswer: 'Mitochondria',
      ),
      FcResultsQuestion(
        number: 3,
        question: 'Which gas do plants absorb from the atmosphere?',
        isCorrect: false,
        correctAnswer: 'Carbon dioxide',
        selectedAnswerText: 'Oxygen',
      ),
      FcResultsQuestion(
        number: 4,
        question: 'Who wrote "Romeo and Juliet"?',
        isCorrect: true,
        correctAnswer: 'William Shakespeare',
      ),
      FcResultsQuestion(
        number: 5,
        question: 'What is the largest planet in the solar system?',
        isCorrect: false,
        correctAnswer: 'Jupiter',
        selectedAnswerText: 'Saturn',
      ),
      FcResultsQuestion(
        number: 6,
        question: 'Explain, in your own words, what photosynthesis is.',
        isCorrect: true,
        correctAnswer:
            'The process by which plants convert light energy into '
            'chemical energy.',
        userAnswer:
            'Plants use sunlight to turn water and carbon dioxide into '
            'energy and oxygen.',
      ),
      FcResultsQuestion(
        number: 7,
        question: 'Explain, in your own words, why the sky is blue.',
        isCorrect: false,
        correctAnswer:
            'Shorter wavelengths of sunlight scatter more in the '
            'atmosphere, so blue light reaches our eyes from all directions.',
        userAnswer: 'Because the sky reflects the color of the ocean.',
      ),
      FcResultsQuestion(
        number: 8,
        question: 'What is the chemical symbol for gold?',
        isCorrect: true,
        correctAnswer: 'Au',
      ),
    ],
    gradeDistribution: const FcResultsGradeDistribution(
      hard: 1,
      medium: 2,
      easy: 5,
    ),
    onFinish: () {},
  );
}

@widgetbook.UseCase(
  name: 'Markdown question and feedback',
  type: FcResultsScreen,
)
Widget markdownQuestionAndFeedback(BuildContext context) {
  return FcResultsScreen(
    correct: 1,
    total: 1,
    questions: const [
      FcResultsQuestion(
        number: 1,
        question:
            '## Newton\'s Second Law\n\n'
            'What is the formula relating **force**, mass, and '
            'acceleration?',
        isCorrect: true,
        correctAnswer: '`F = m * a`',
        feedback:
            'Well done — you correctly identified the *second law*. '
            'Remember:\n\n'
            '- force is measured in newtons\n'
            '- mass is measured in kilograms\n'
            '- acceleration is measured in `m/s^2`',
      ),
    ],
    onFinish: () {},
  );
}
