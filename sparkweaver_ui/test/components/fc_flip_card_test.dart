import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcFlipCard', () {
    testWidgets('starts on the front face showing the question text', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcFlipCard(front: 'What?', back: 'Because.')),
      );

      expect(find.text('Question'), findsOneWidget);
      expect(find.text('What?'), findsOneWidget);
      // Back-only text is not visible before the flip.
      expect(find.text('Because.'), findsNothing);
    });

    testWidgets('tapping the card flips to the back face', (tester) async {
      var flippedCallbacks = 0;
      await tester.pumpWidget(
        wrap(
          FcFlipCard(
            front: 'What?',
            back: 'Because.',
            onFlippedToBack: () => flippedCallbacks++,
          ),
        ),
      );

      await tester.tap(find.text('What?'));
      await tester.pumpAndSettle();

      expect(find.text('Answer'), findsOneWidget);
      expect(find.text('Because.'), findsOneWidget);
      expect(flippedCallbacks, 1);
    });

    testWidgets('renders the progress label above the card when provided', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcFlipCard(front: 'Q', back: 'A', progressLabel: '3 / 10')),
      );

      expect(find.text('3 / 10'), findsOneWidget);
    });

    testWidgets(
      'resolves dark-theme colours for both the question and answer faces',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: const Scaffold(
              body: FcFlipCard(front: 'What?', back: 'Because.'),
            ),
          ),
        );

        final dark = SparkweaverTheme.dark();

        final frontFace = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.surface,
            );
        final frontBorder =
            (frontFace.decoration as BoxDecoration).border as Border;
        expect(frontBorder.top.color, dark.primaryLight);

        final questionText = tester.widget<Text>(find.text('What?'));
        expect(questionText.style?.color, dark.textPrimary);

        await tester.tap(find.text('What?'));
        await tester.pumpAndSettle();

        final backFace = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.surfaceVariant,
            );
        final backBorder =
            (backFace.decoration as BoxDecoration).border as Border;
        expect(backBorder.top.color, dark.primaryLight);

        final answerText = tester.widget<Text>(find.text('Because.'));
        expect(answerText.style?.color, dark.textPrimary);
      },
    );
  });
}
