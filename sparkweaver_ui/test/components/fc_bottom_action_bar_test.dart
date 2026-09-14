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
      expect(find.byType(FcButton), findsNothing);
    });

    testWidgets('visible: true renders the label via FcButton', (tester) async {
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
      expect(find.byType(FcButton), findsOneWidget);
    });

    testWidgets('enabled: false forwards a null onPressed to FcButton', (
      tester,
    ) async {
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

      expect(tester.widget<FcButton>(find.byType(FcButton)).onPressed, isNull);
      await tester.tap(find.text('New Course'), warnIfMissed: false);
      await tester.pump();
      expect(tapped, isFalse);
    });

    testWidgets('enabled: true forwards a working onPressed to FcButton', (
      tester,
    ) async {
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

      await tester.tap(find.text('New Course'));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('a non-null scale wraps the button in a ScaleTransition', (
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
          of: find.byType(FcButton),
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
