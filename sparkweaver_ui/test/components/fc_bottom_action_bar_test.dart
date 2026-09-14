import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget bar) =>
      MaterialApp(home: Scaffold(bottomNavigationBar: bar));

  group('FcBottomActionBar', () {
    testWidgets('visible: false collapses to nothing', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcBottomActionBar(
            label: 'New Course',
            icon: Icons.add,
            onPressed: () {},
            visible: false,
          ),
        ),
      );

      expect(find.text('New Course'), findsNothing);
      expect(find.byType(InkWell), findsNothing);
    });

    testWidgets('visible: true renders the label and icon', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcBottomActionBar(
            label: 'New Course',
            icon: Icons.add,
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('New Course'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets('enabled: false ignores a tap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          FcBottomActionBar(
            label: 'New Course',
            icon: Icons.add,
            onPressed: () => tapped = true,
            enabled: false,
          ),
        ),
      );

      await tester.tap(find.byType(FcBottomActionBar), warnIfMissed: false);
      await tester.pump();
      expect(tapped, isFalse);
    });

    testWidgets('the tap target spans the full width', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          FcBottomActionBar(
            label: 'New Course',
            icon: Icons.add,
            onPressed: () => tapped = true,
          ),
        ),
      );

      final bar = tester.getRect(find.byType(FcBottomActionBar));
      expect(
        bar.width,
        tester.view.physicalSize.width / tester.view.devicePixelRatio,
      );

      // Far from the centred label, to prove the whole strip is tappable.
      await tester.tapAt(Offset(bar.left + 8, bar.center.dy));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('a non-null scale wraps the label in a ScaleTransition', (
      tester,
    ) async {
      final controller = AnimationController(
        vsync: const TestVSync(),
        duration: const Duration(milliseconds: 100),
      );
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        wrap(
          FcBottomActionBar(
            label: 'New Course',
            icon: Icons.add,
            onPressed: () {},
            scale: controller,
          ),
        ),
      );

      expect(
        find.ancestor(
          of: find.text('New Course'),
          matching: find.byType(ScaleTransition),
        ),
        findsOneWidget,
      );
    });

    testWidgets('a null scale renders no ScaleTransition', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcBottomActionBar(
            label: 'New Course',
            icon: Icons.add,
            onPressed: () {},
          ),
        ),
      );

      expect(
        find.descendant(
          of: find.byType(FcBottomActionBar),
          matching: find.byType(ScaleTransition),
        ),
        findsNothing,
      );
    });
  });
}
