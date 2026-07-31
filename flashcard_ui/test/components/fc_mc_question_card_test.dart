import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  const question = 'Wer ist der bekannteste Vertreter?';
  const options = ['Pawlow', 'Skinner', 'Freud', 'Watson'];

  group('FcMcQuestionCard', () {
    testWidgets('renders the question and every option label',
        (tester) async {
      await tester.pumpWidget(wrap(FcMcQuestionCard(
        question: question,
        options: options,
        onSelected: (_) {},
      )));

      expect(find.text(question), findsOneWidget);
      for (final opt in options) {
        expect(find.text(opt), findsOneWidget);
      }
    });

    testWidgets('fires onSelected with the tapped index', (tester) async {
      int? tapped;
      await tester.pumpWidget(wrap(FcMcQuestionCard(
        question: question,
        options: options,
        onSelected: (i) => tapped = i,
      )));

      await tester.tap(find.text('Skinner'));
      await tester.pump();

      expect(tapped, 1);
    });

    testWidgets('locks the buttons once selectedIndex is provided',
        (tester) async {
      var calls = 0;
      await tester.pumpWidget(wrap(FcMcQuestionCard(
        question: question,
        options: options,
        selectedIndex: 0,
        onSelected: (_) => calls++,
      )));

      await tester.tap(find.text('Freud'));
      await tester.pump();

      // Locked — the tap does not reach the callback.
      expect(calls, 0);
    });

    testWidgets('renders feedback text when provided', (tester) async {
      await tester.pumpWidget(wrap(FcMcQuestionCard(
        question: question,
        options: options,
        selectedIndex: 1,
        correctIndex: 1,
        feedback: 'Nice — Skinner is the operant-conditioning figure.',
        onSelected: (_) {},
      )));

      expect(
        find.text('Nice — Skinner is the operant-conditioning figure.'),
        findsOneWidget,
      );
    });
  });
}
