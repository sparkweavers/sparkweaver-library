import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcOpenAnswerCard', () {
    testWidgets('renders the question and submit label', (tester) async {
      await tester.pumpWidget(wrap(FcOpenAnswerCard(
        question: 'Explain photosynthesis.',
        onSubmit: (_) {},
      )));

      expect(find.text('Explain photosynthesis.'), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('typing then tapping Submit forwards the trimmed text',
        (tester) async {
      String? received;
      await tester.pumpWidget(wrap(FcOpenAnswerCard(
        question: 'Q',
        onSubmit: (t) => received = t,
      )));

      await tester.enterText(find.byType(TextField), '  My answer  ');
      await tester.tap(find.text('Submit'));
      await tester.pump();

      expect(received, 'My answer');
    });

    testWidgets('does not submit when the input is empty', (tester) async {
      var calls = 0;
      await tester.pumpWidget(wrap(FcOpenAnswerCard(
        question: 'Q',
        onSubmit: (_) => calls++,
      )));

      await tester.tap(find.text('Submit'));
      await tester.pump();

      expect(calls, 0);
    });

    testWidgets('locked=true disables the submit button', (tester) async {
      var calls = 0;
      await tester.pumpWidget(wrap(FcOpenAnswerCard(
        question: 'Q',
        locked: true,
        onSubmit: (_) => calls++,
      )));

      await tester.enterText(find.byType(TextField), 'anything');
      await tester.tap(find.text('Submit'), warnIfMissed: false);
      await tester.pump();

      expect(calls, 0);
    });

    testWidgets('renders feedback text when provided', (tester) async {
      await tester.pumpWidget(wrap(FcOpenAnswerCard(
        question: 'Q',
        feedback: 'Well done.',
        onSubmit: (_) {},
      )));

      expect(find.text('Well done.'), findsOneWidget);
    });
  });
}
