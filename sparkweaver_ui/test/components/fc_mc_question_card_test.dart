import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  const question = 'Wer ist der bekannteste Vertreter?';
  const options = ['Pawlow', 'Skinner', 'Freud', 'Watson'];

  /// The colour actually painted for the option button labelled [label] —
  /// read off the [Material] that the underlying [ElevatedButton] renders,
  /// so this reflects the real resolved colour, not just the style object.
  Color backgroundColorFor(WidgetTester tester, String label) {
    final material = tester.widget<Material>(
      find
          .descendant(
            of: find.ancestor(
              of: find.text(label),
              matching: find.byType(ElevatedButton),
            ),
            matching: find.byType(Material),
          )
          .first,
    );
    return material.color!;
  }

  ShapeBorder shapeFor(WidgetTester tester, String label) {
    final material = tester.widget<Material>(
      find
          .descendant(
            of: find.ancestor(
              of: find.text(label),
              matching: find.byType(ElevatedButton),
            ),
            matching: find.byType(Material),
          )
          .first,
    );
    return material.shape!;
  }

  group('FcMcQuestionCard', () {
    testWidgets('renders the question and every option label', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcMcQuestionCard(
            question: question,
            options: options,
            onSelected: (_) {},
          ),
        ),
      );

      expect(find.text(question), findsOneWidget);
      for (final opt in options) {
        expect(find.text(opt), findsOneWidget);
      }
    });

    testWidgets('fires onSelected with the tapped index', (tester) async {
      int? tapped;
      await tester.pumpWidget(
        wrap(
          FcMcQuestionCard(
            question: question,
            options: options,
            onSelected: (i) => tapped = i,
          ),
        ),
      );

      await tester.tap(find.text('Skinner'));
      await tester.pump();

      expect(tapped, 1);
    });

    testWidgets('locks the buttons once selectedIndex is provided', (
      tester,
    ) async {
      var calls = 0;
      await tester.pumpWidget(
        wrap(
          FcMcQuestionCard(
            question: question,
            options: options,
            selectedIndex: 0,
            onSelected: (_) => calls++,
          ),
        ),
      );

      // Blocked by IgnorePointer (via `interactive: false`) — Flutter warns
      // that the tap didn't hit test, which is exactly the point.
      await tester.tap(find.text('Freud'), warnIfMissed: false);
      await tester.pump();

      // Locked — the tap does not reach the callback.
      expect(calls, 0);
    });

    testWidgets('renders feedback text when provided', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcMcQuestionCard(
            question: question,
            options: options,
            selectedIndex: 1,
            correctIndex: 1,
            feedback: 'Nice — Skinner is the operant-conditioning figure.',
            onSelected: (_) {},
          ),
        ),
      );

      expect(
        find.text('Nice — Skinner is the operant-conditioning figure.'),
        findsOneWidget,
      );
    });

    testWidgets(
      'resolves dark-theme colours for the question card and feedback',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: Scaffold(
              body: FcMcQuestionCard(
                question: question,
                options: options,
                selectedIndex: 1,
                correctIndex: 1,
                feedback: 'Nice — Skinner is the operant-conditioning figure.',
                onSelected: (_) {},
              ),
            ),
          ),
        );

        final dark = FlashcardColorScheme.dark();

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

        final questionText = tester.widget<Text>(find.text(question));
        expect(questionText.style?.color, dark.textPrimary);

        final feedbackCard = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.surfaceVariant,
            );
        expect((feedbackCard.decoration as BoxDecoration).border, isNull);

        final feedbackText = tester.widget<Text>(
          find.text('Nice — Skinner is the operant-conditioning figure.'),
        );
        expect(feedbackText.style?.color, dark.textPrimary);
      },
    );

    testWidgets(
      'after answering wrongly, the correct option turns success and the '
      "selected option turns error — the reveal that today's bug destroys",
      (tester) async {
        await tester.pumpWidget(
          wrap(
            FcMcQuestionCard(
              question: question,
              options: options,
              selectedIndex: 0, // Pawlow — wrong pick
              correctIndex: 1, // Skinner — the right answer
              onSelected: (_) {},
            ),
          ),
        );

        final colors = FlashcardColorScheme.light();

        expect(backgroundColorFor(tester, 'Skinner'), colors.success);
        expect(backgroundColorFor(tester, 'Pawlow'), colors.error);
      },
    );

    testWidgets('unselected options stay outlined after the reveal', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          FcMcQuestionCard(
            question: question,
            options: options,
            selectedIndex: 0,
            correctIndex: 1,
            onSelected: (_) {},
          ),
        ),
      );

      final colors = FlashcardColorScheme.light();

      for (final label in ['Freud', 'Watson']) {
        expect(backgroundColorFor(tester, label), colors.surfaceVariant);
        final shape = shapeFor(tester, label) as RoundedRectangleBorder;
        expect(shape.side.color, colors.primary);

        final text = tester.widget<Text>(find.text(label));
        expect(text.style?.color, colors.primary);
      }
    });

    testWidgets(
      'a locked option does not fire onSelected when tapped, even the '
      'revealed correct one',
      (tester) async {
        var calls = 0;
        await tester.pumpWidget(
          wrap(
            FcMcQuestionCard(
              question: question,
              options: options,
              selectedIndex: 0,
              correctIndex: 1,
              onSelected: (_) => calls++,
            ),
          ),
        );

        // Blocked by IgnorePointer (via `interactive: false`) — Flutter
        // warns that the tap didn't hit test, which is exactly the point.
        await tester.tap(find.text('Skinner'), warnIfMissed: false);
        await tester.pump();
        await tester.tap(find.text('Freud'), warnIfMissed: false);
        await tester.pump();

        expect(calls, 0);
      },
    );

    testWidgets('when correctIndex is null the answer key is unknown, so the '
        'selected option still renders primary', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcMcQuestionCard(
            question: question,
            options: options,
            selectedIndex: 1,
            onSelected: (_) {},
          ),
        ),
      );

      final colors = FlashcardColorScheme.light();
      expect(backgroundColorFor(tester, 'Skinner'), colors.primary);
    });
  });
}
