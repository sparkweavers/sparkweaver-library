import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Future<void> openOverlay(WidgetTester tester, {
    required int itemCount,
    Widget Function(BuildContext, int)? itemBuilder,
    ValueChanged<String>? onSend,
  }) async {
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => FcChatOverlay(
                    itemCount: itemCount,
                    itemBuilder: itemBuilder ??
                        (context, i) => Text('bubble-$i'),
                    onSend: onSend ?? (_) {},
                  ),
                );
              },
              child: const Text('open'),
            ),
          ),
        );
      }),
    ));

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  group('FcChatOverlay', () {
    testWidgets('renders the title', (tester) async {
      await openOverlay(tester, itemCount: 0);

      expect(find.text('Ask a question'), findsOneWidget);
    });

    testWidgets('shows the empty-state text when itemCount is 0',
        (tester) async {
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

    testWidgets('typed text hits onSend when Send is tapped',
        (tester) async {
      String? sent;
      await openOverlay(tester, itemCount: 0, onSend: (t) => sent = t);

      await tester.enterText(find.byType(TextField), 'why?');
      await tester.testTextInput.receiveAction(TextInputAction.send);
      await tester.pumpAndSettle();

      expect(sent, 'why?');
    });
  });
}
