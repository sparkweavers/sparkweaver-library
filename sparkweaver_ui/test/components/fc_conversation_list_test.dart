import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  group('FcConversationList', () {
    testWidgets(
      'derives interpretMarkdown from the message, not a hardcoded value',
      (tester) async {
        await tester.pumpWidget(
          wrap(
            const FcConversationList(
              reverse: false,
              messages: [
                ChatMessageData(content: '**bold**', isUser: true),
                ChatMessageData(content: '**bold**', isUser: false),
              ],
            ),
          ),
        );

        final bubbles = tester
            .widgetList<FcChatBubble>(find.byType(FcChatBubble))
            .toList();
        expect(bubbles, hasLength(2));

        final userBubble = bubbles.firstWhere((b) => b.isUser);
        final aiBubble = bubbles.firstWhere((b) => !b.isUser);

        expect(userBubble.interpretMarkdown, isFalse);
        expect(aiBubble.interpretMarkdown, isTrue);
      },
    );
  });
}
