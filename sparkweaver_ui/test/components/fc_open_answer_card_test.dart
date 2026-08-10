import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcOpenAnswerCard', () {
    testWidgets('renders the question and submit label', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcOpenAnswerCard(
            question: 'Explain photosynthesis.',
            onSubmit: (_) {},
          ),
        ),
      );

      expect(find.text('Explain photosynthesis.'), findsOneWidget);
      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('typing then tapping Submit forwards the trimmed text', (
      tester,
    ) async {
      String? received;
      await tester.pumpWidget(
        wrap(FcOpenAnswerCard(question: 'Q', onSubmit: (t) => received = t)),
      );

      await tester.enterText(find.byType(TextField), '  My answer  ');
      await tester.tap(find.text('Submit'));
      await tester.pump();

      expect(received, 'My answer');
    });

    testWidgets('does not submit when the input is empty', (tester) async {
      var calls = 0;
      await tester.pumpWidget(
        wrap(FcOpenAnswerCard(question: 'Q', onSubmit: (_) => calls++)),
      );

      await tester.tap(find.text('Submit'));
      await tester.pump();

      expect(calls, 0);
    });

    testWidgets('locked=true disables the submit button', (tester) async {
      var calls = 0;
      await tester.pumpWidget(
        wrap(
          FcOpenAnswerCard(
            question: 'Q',
            locked: true,
            onSubmit: (_) => calls++,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'anything');
      await tester.tap(find.text('Submit'), warnIfMissed: false);
      await tester.pump();

      expect(calls, 0);
    });

    testWidgets('renders feedback text when provided', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcOpenAnswerCard(
            question: 'Q',
            feedback: 'Well done.',
            onSubmit: (_) {},
          ),
        ),
      );

      expect(find.text('Well done.'), findsOneWidget);
    });

    testWidgets(
      'resolves dark-theme colours for the question card and feedback',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: FcOpenAnswerCard(
                question: 'Explain photosynthesis.',
                feedback: 'Well done.',
                onSubmit: (_) {},
              ),
            ),
          ),
        );

        final dark = SparkweaverTheme.dark();

        final questionCard = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.surface,
            );
        final questionBorder =
            (questionCard.decoration as BoxDecoration).border as Border;
        expect(questionBorder.top.color, dark.primaryLight);

        final questionText = tester.widget<Text>(
          find.text('Explain photosynthesis.'),
        );
        expect(questionText.style?.color, dark.textPrimary);

        final feedbackCard = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.surfaceVariant,
            );
        expect((feedbackCard.decoration as BoxDecoration).border, isNull);

        // The feedback panel renders through flutter_markdown_plus, which
        // builds a Text.rich(TextSpan(style: ...)) rather than setting
        // Text.style directly, so the resolved colour lives on the span.
        final feedbackText = tester.widget<Text>(find.text('Well done.'));
        expect(feedbackText.textSpan?.style?.color, dark.textPrimary);
      },
    );
  });
}
