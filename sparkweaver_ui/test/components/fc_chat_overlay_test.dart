import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Future<void> openOverlay(
    WidgetTester tester, {
    required int itemCount,
    Widget Function(BuildContext, int)? itemBuilder,
    ValueChanged<String>? onSend,
    ThemeData? theme,
    double? paddingBottom,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: theme,
        builder: paddingBottom == null
            ? null
            : (context, navigator) => MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(padding: EdgeInsets.only(bottom: paddingBottom)),
                child: navigator!,
              ),
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => FcChatOverlay(
                        itemCount: itemCount,
                        itemBuilder:
                            itemBuilder ?? (context, i) => Text('bubble-$i'),
                        onSend: onSend ?? (_) {},
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  group('FcChatOverlay', () {
    testWidgets('renders the title', (tester) async {
      await openOverlay(tester, itemCount: 0);

      expect(find.text('Ask a question'), findsOneWidget);
    });

    testWidgets('shows the empty-state text when itemCount is 0', (
      tester,
    ) async {
      await openOverlay(tester, itemCount: 0);

      expect(
        find.textContaining('Ask anything about the current question'),
        findsOneWidget,
      );
    });

    testWidgets('renders one item per itemCount', (tester) async {
      await openOverlay(tester, itemCount: 3);

      expect(find.text('bubble-0'), findsOneWidget);
      expect(find.text('bubble-1'), findsOneWidget);
      expect(find.text('bubble-2'), findsOneWidget);
    });

    testWidgets('typed text hits onSend when Send is tapped', (tester) async {
      String? sent;
      await openOverlay(tester, itemCount: 0, onSend: (t) => sent = t);

      await tester.enterText(find.byType(TextField), 'why?');
      await tester.testTextInput.receiveAction(TextInputAction.send);
      await tester.pumpAndSettle();

      expect(sent, 'why?');
    });

    testWidgets(
      'resolves dark-theme colours for the sheet surface, handle and title',
      (tester) async {
        await openOverlay(tester, itemCount: 0, theme: ThemeData.dark());

        final dark = SparkweaverTheme.dark();

        final sheet = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.surface,
            );
        expect((sheet.decoration as BoxDecoration).border, isNull);

        final handle = tester
            .widgetList<Container>(find.byType(Container))
            .firstWhere(
              (c) =>
                  c.decoration is BoxDecoration &&
                  (c.decoration as BoxDecoration).color == dark.gray200,
            );
        expect((handle.decoration as BoxDecoration).border, isNull);

        final title = tester.widget<Text>(find.text('Ask a question'));
        expect(title.style?.color, dark.textPrimary);

        final emptyState = tester.widget<Text>(
          find.textContaining('Ask anything about the current question'),
        );
        expect(emptyState.style?.color, dark.textSecondary);
      },
    );

    testWidgets('input row clears the nav bar inside the modal sheet', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await openOverlay(tester, itemCount: 0, paddingBottom: 48);

      final screenBottom = tester.getRect(find.byType(MaterialApp)).bottom;
      final rowBottom = tester
          .getRect(
            find.descendant(
              of: find.byType(FcInputArea),
              matching: find.byType(Container),
            ),
          )
          .bottom;

      expect(screenBottom - rowBottom, greaterThanOrEqualTo(48));
    });
  });
}
