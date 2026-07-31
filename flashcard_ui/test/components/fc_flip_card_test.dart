import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcFlipCard', () {
    testWidgets('starts on the front face showing the question text',
        (tester) async {
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
        wrap(FcFlipCard(
          front: 'What?',
          back: 'Because.',
          onFlippedToBack: () => flippedCallbacks++,
        )),
      );

      await tester.tap(find.text('What?'));
      await tester.pumpAndSettle();

      expect(find.text('Answer'), findsOneWidget);
      expect(find.text('Because.'), findsOneWidget);
      expect(flippedCallbacks, 1);
    });

    testWidgets('renders the progress label above the card when provided',
        (tester) async {
      await tester.pumpWidget(
        wrap(const FcFlipCard(
          front: 'Q',
          back: 'A',
          progressLabel: '3 / 10',
        )),
      );

      expect(find.text('3 / 10'), findsOneWidget);
    });
  });
}
