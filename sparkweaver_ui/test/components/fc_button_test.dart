import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  /// The colour actually painted for the button labelled [label] — read off
  /// the [Material] that [ElevatedButton] renders internally, so this
  /// reflects real resolved state (enabled/disabled), not just the style
  /// object we handed it.
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

  bool isEnabledFor(WidgetTester tester, String label) {
    return tester
        .widget<ElevatedButton>(
          find.ancestor(
            of: find.text(label),
            matching: find.byType(ElevatedButton),
          ),
        )
        .enabled;
  }

  group('FcButton', () {
    testWidgets(
      'success variant resolves colors.success background and white foreground',
      (tester) async {
        await tester.pumpWidget(
          wrap(
            FcButton(
              label: 'Skinner',
              variant: FcButtonVariant.success,
              onPressed: () {},
            ),
          ),
        );

        final colors = FlashcardColorScheme.light();
        expect(backgroundColorFor(tester, 'Skinner'), colors.success);

        final text = tester.widget<Text>(find.text('Skinner'));
        expect(text.style?.color, colors.white);
      },
    );

    testWidgets(
      'interactive: false keeps the variant colour but swallows the tap',
      (tester) async {
        var tapped = false;
        await tester.pumpWidget(
          wrap(
            FcButton(
              label: 'Skinner',
              variant: FcButtonVariant.success,
              interactive: false,
              onPressed: () => tapped = true,
            ),
          ),
        );

        final colors = FlashcardColorScheme.light();
        expect(backgroundColorFor(tester, 'Skinner'), colors.success);

        // Blocked by IgnorePointer — Flutter warns that the tap didn't hit
        // test on the widget, which is the point of `interactive: false`.
        await tester.tap(find.text('Skinner'), warnIfMissed: false);
        await tester.pump();

        expect(tapped, isFalse);
      },
    );

    testWidgets(
      'interactive: false and onPressed: null produce visibly different backgrounds',
      (tester) async {
        await tester.pumpWidget(
          wrap(
            Column(
              children: [
                FcButton(
                  label: 'Revealed',
                  variant: FcButtonVariant.success,
                  interactive: false,
                  onPressed: () {},
                ),
                FcButton(
                  label: 'Disabled',
                  variant: FcButtonVariant.success,
                  onPressed: null,
                ),
              ],
            ),
          ),
        );

        final colors = FlashcardColorScheme.light();

        // Revealed: taps are blocked, but the variant colour survives.
        expect(backgroundColorFor(tester, 'Revealed'), colors.success);
        expect(isEnabledFor(tester, 'Revealed'), isTrue);

        // Genuinely disabled: falls back to the grey disabled styling.
        expect(backgroundColorFor(tester, 'Disabled'), colors.gray300);
        expect(isEnabledFor(tester, 'Disabled'), isFalse);

        expect(
          backgroundColorFor(tester, 'Revealed'),
          isNot(backgroundColorFor(tester, 'Disabled')),
        );
      },
    );

    testWidgets('onPressed: null still renders the disabled grey styling', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcButton(label: 'Submit', onPressed: null)),
      );

      final colors = FlashcardColorScheme.light();
      expect(backgroundColorFor(tester, 'Submit'), colors.gray300);
      expect(isEnabledFor(tester, 'Submit'), isFalse);
    });
  });

  testWidgets('outlined is a filled, flat button, not a transparent shadow', (
    tester,
  ) async {
    // Regression: outlined used to paint Colors.transparent while still
    // carrying elevation 2, so all you saw was a drop shadow. On a card that
    // reads as a greyed-out disabled button, which is what made unanswered
    // multiple-choice options look locked.
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: FcButton(
            label: 'Option',
            variant: FcButtonVariant.outlined,
            onPressed: () {},
          ),
        ),
      ),
    );

    final material = tester.widget<Material>(
      find.descendant(of: find.byType(FcButton), matching: find.byType(Material)),
    );
    expect(material.color, FlashcardColorScheme.dark().surfaceVariant);
    expect(material.elevation, 0);
  });
}
