import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcStatusMessage', () {
    testWidgets('renders plain messages unchanged', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcStatusMessage(
            message: 'Upload complete',
            variant: FcStatusVariant.success,
          ),
        ),
      );

      expect(find.text('Upload complete'), findsOneWidget);
      expect(find.byType(MarkdownBody), findsNothing);
    });

    testWidgets('renders Markdown emphasis inline within the message row', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcStatusMessage(
            message: 'Saved **3** new cards',
            variant: FcStatusVariant.success,
          ),
        ),
      );

      expect(find.byType(MarkdownBody), findsOneWidget);
      final rendered = tester
          .widgetList<RichText>(find.byType(RichText))
          .map((w) => w.text.toPlainText())
          .join();
      expect(rendered, contains('Saved 3 new cards'));
      expect(rendered, isNot(contains('**')));
    });
  });
}
