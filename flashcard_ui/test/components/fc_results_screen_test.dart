import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcResultsScreen', () {
    testWidgets('renders X / N correct + percentage', (tester) async {
      await tester.pumpWidget(wrap(const FcResultsScreen(
        correct: 7,
        total: 10,
        questions: [],
      )));

      expect(find.text('7 / 10 correct'), findsOneWidget);
      expect(find.text('70%'), findsOneWidget);
    });

    testWidgets('lists every per-question row with correct/incorrect chip',
        (tester) async {
      await tester.pumpWidget(wrap(FcResultsScreen(
        correct: 1,
        total: 2,
        questions: const [
          FcResultsQuestion(number: 1, question: 'Q1?', isCorrect: true),
          FcResultsQuestion(
            number: 2,
            question: 'Q2?',
            isCorrect: false,
            correctAnswer: 'expected',
            userAnswer: 'wrong',
          ),
        ],
        onFinish: () {},
      )));

      expect(find.text('Q1?'), findsOneWidget);
      expect(find.text('Q2?'), findsOneWidget);
      expect(find.text('Correct'), findsOneWidget);
      expect(find.text('Incorrect'), findsOneWidget);
      expect(find.text('Your answer: wrong'), findsOneWidget);
      expect(find.text('Correct answer: expected'), findsOneWidget);
    });

    testWidgets(
        'shows the reference answer on correct rows too (group-study aid)',
        (tester) async {
      await tester.pumpWidget(wrap(FcResultsScreen(
        correct: 1,
        total: 1,
        questions: const [
          FcResultsQuestion(
            number: 1,
            question: 'Who coined self-efficacy?',
            isCorrect: true,
            correctAnswer: 'Albert Bandura',
          ),
        ],
        onFinish: () {},
      )));

      expect(find.text('Correct answer: Albert Bandura'), findsOneWidget);
    });

    testWidgets('shows grade distribution block only when provided',
        (tester) async {
      await tester.pumpWidget(wrap(const FcResultsScreen(
        correct: 5,
        total: 10,
        questions: [],
        gradeDistribution: FcResultsGradeDistribution(
          hard: 2,
          medium: 3,
          easy: 5,
        ),
      )));

      expect(find.text('Self-rating distribution'), findsOneWidget);
      expect(find.text('Knew it'), findsOneWidget);
      expect(find.text('Almost'), findsOneWidget);
      expect(find.text('Again'), findsOneWidget);
    });

    testWidgets('hides grade distribution block when null', (tester) async {
      await tester.pumpWidget(wrap(const FcResultsScreen(
        correct: 5,
        total: 10,
        questions: [],
      )));

      expect(find.text('Self-rating distribution'), findsNothing);
    });

    testWidgets('shows 0% when total is zero (no divide-by-zero)',
        (tester) async {
      await tester.pumpWidget(wrap(const FcResultsScreen(
        correct: 0,
        total: 0,
        questions: [],
      )));

      expect(find.text('0 / 0 correct'), findsOneWidget);
      expect(find.text('0%'), findsOneWidget);
    });

    testWidgets('finish button fires onFinish', (tester) async {
      var pressed = 0;
      await tester.pumpWidget(wrap(FcResultsScreen(
        correct: 1,
        total: 1,
        questions: const [],
        onFinish: () => pressed++,
      )));

      await tester.tap(find.text('Done'));
      await tester.pump();

      expect(pressed, 1);
    });
  });
}
