import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  // No Navigator.push/showDialog anywhere: the widget must never call
  // Navigator itself, so a bare MaterialApp with no route stack is enough.
  Widget wrap(Widget child) => MaterialApp(home: child);

  group('FcChoiceDialog', () {
    testWidgets('renders title, message, and every label + subtitle', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          FcChoiceDialog<int>(
            title: 'Pick one',
            message: 'Choose how to continue.',
            choices: const [
              FcChoice(value: 1, label: 'First', subtitle: 'first subtitle'),
              FcChoice(value: 2, label: 'Second'),
            ],
            onSelected: (_) {},
          ),
        ),
      );

      expect(find.text('Pick one'), findsOneWidget);
      expect(find.text('Choose how to continue.'), findsOneWidget);
      expect(find.text('First'), findsOneWidget);
      expect(find.text('first subtitle'), findsOneWidget);
      expect(find.text('Second'), findsOneWidget);
    });

    testWidgets('tapping row n calls onSelected with row n\'s value', (
      tester,
    ) async {
      final selected = <int>[];
      await tester.pumpWidget(
        wrap(
          FcChoiceDialog<int>(
            title: 'Pick one',
            choices: const [
              FcChoice(value: 1, label: 'First'),
              FcChoice(value: 2, label: 'Second'),
            ],
            onSelected: selected.add,
          ),
        ),
      );

      await tester.tap(find.text('Second'));
      await tester.pump();

      expect(selected, [2]);
    });

    testWidgets('cancel action calls onCancel', (tester) async {
      var cancelled = 0;
      await tester.pumpWidget(
        wrap(
          FcChoiceDialog<int>(
            title: 'Pick one',
            choices: const [FcChoice(value: 1, label: 'First')],
            onSelected: (_) {},
            cancelLabel: 'Cancel',
            onCancel: () => cancelled++,
          ),
        ),
      );

      await tester.tap(find.text('Cancel'));
      await tester.pump();

      expect(cancelled, 1);
    });

    testWidgets('a null cancelLabel renders no cancel action', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcChoiceDialog<int>(
            title: 'Pick one',
            choices: const [FcChoice(value: 1, label: 'First')],
            onSelected: (_) {},
          ),
        ),
      );

      expect(find.text('Cancel'), findsNothing);
      expect(
        find.byWidgetPredicate(
          (w) => w is FcButton && w.variant == FcButtonVariant.text,
        ),
        findsNothing,
      );
    });

    testWidgets('tapping the subtitle text itself selects that row', (
      tester,
    ) async {
      final selected = <int>[];
      await tester.pumpWidget(
        wrap(
          FcChoiceDialog<int>(
            title: 'Pick one',
            choices: const [
              FcChoice(value: 1, label: 'First', subtitle: 'first subtitle'),
            ],
            onSelected: selected.add,
          ),
        ),
      );

      await tester.tap(find.text('first subtitle'));
      await tester.pump();

      expect(selected, [1]);
    });

    testWidgets(
      'an isPrimary row renders a different FcCard variant from the rest',
      (tester) async {
        await tester.pumpWidget(
          wrap(
            FcChoiceDialog<int>(
              title: 'Pick one',
              choices: const [
                FcChoice(value: 1, label: 'First'),
                FcChoice(value: 2, label: 'Second', isPrimary: true),
              ],
              onSelected: (_) {},
            ),
          ),
        );

        final firstCard = tester.widget<FcCard>(
          find.ancestor(of: find.text('First'), matching: find.byType(FcCard)),
        );
        final secondCard = tester.widget<FcCard>(
          find.ancestor(of: find.text('Second'), matching: find.byType(FcCard)),
        );

        expect(firstCard.variant, FcCardVariant.surface);
        expect(secondCard.variant, FcCardVariant.selected);
      },
    );

    testWidgets('never touches Navigator: works with no pushed route', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          FcChoiceDialog<int>(
            title: 'Pick one',
            choices: const [FcChoice(value: 1, label: 'First')],
            onSelected: (_) {},
            cancelLabel: 'Cancel',
            onCancel: () {},
          ),
        ),
      );

      await tester.tap(find.text('First'));
      await tester.pump();
      await tester.tap(find.text('Cancel'));
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}
