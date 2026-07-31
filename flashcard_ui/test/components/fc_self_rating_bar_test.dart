import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcSelfRatingBar', () {
    testWidgets('renders all three buttons with default English labels',
        (tester) async {
      await tester.pumpWidget(wrap(FcSelfRatingBar(onRated: (_) {})));

      expect(find.text('Again'), findsOneWidget);
      expect(find.text('Almost'), findsOneWidget);
      expect(find.text('Knew it'), findsOneWidget);
    });

    testWidgets('grade enum maps to wire values 0=again, 1=almost, 2=knewIt',
        (tester) async {
      expect(FcSelfRatingGrade.again.value, 0);
      expect(FcSelfRatingGrade.almost.value, 1);
      expect(FcSelfRatingGrade.knewIt.value, 2);
    });

    testWidgets('tap fires onRated with the picked grade',
        (tester) async {
      FcSelfRatingGrade? received;
      await tester.pumpWidget(
        wrap(FcSelfRatingBar(onRated: (g) => received = g)),
      );

      await tester.tap(find.text('Knew it'));
      await tester.pump();

      expect(received, FcSelfRatingGrade.knewIt);
    });

    testWidgets('second tap is ignored after the user has rated',
        (tester) async {
      var callCount = 0;
      await tester.pumpWidget(
        wrap(FcSelfRatingBar(onRated: (_) => callCount++)),
      );

      await tester.tap(find.text('Again'));
      await tester.pump();
      await tester.tap(find.text('Knew it'));
      await tester.pump();

      expect(callCount, 1);
    });

    testWidgets('honors custom labels', (tester) async {
      await tester.pumpWidget(
        wrap(FcSelfRatingBar(
          onRated: (_) {},
          againLabel: 'Nochmal',
          almostLabel: 'Fast',
          knewItLabel: 'Wusste ich',
        )),
      );

      expect(find.text('Nochmal'), findsOneWidget);
      expect(find.text('Fast'), findsOneWidget);
      expect(find.text('Wusste ich'), findsOneWidget);
    });
  });
}
