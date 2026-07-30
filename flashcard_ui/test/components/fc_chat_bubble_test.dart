import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  Widget wrap(Widget child) =>
      MaterialApp(home: Scaffold(body: child));

  group('FcChatBubble — multiple-choice options', () {
    const question = 'Wer ist der bekannteste Vertreter?';
    const options = ['Pawlow', 'Skinner', 'Freud', 'Watson'];

    testWidgets('renders no chips when options is null', (tester) async {
      await tester.pumpWidget(
        wrap(const FcChatBubble(message: question, isUser: false)),
      );
      expect(find.byType(ChoiceChip), findsNothing);
    });

    testWidgets('renders no chips when options is empty', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcChatBubble(
            message: question,
            isUser: false,
            options: [],
          ),
        ),
      );
      expect(find.byType(ChoiceChip), findsNothing);
    });

    testWidgets('renders one ChoiceChip per option with its label', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcChatBubble(
            message: question,
            isUser: false,
            options: options,
          ),
        ),
      );

      expect(find.byType(ChoiceChip), findsNWidgets(options.length));
      for (final opt in options) {
        expect(find.text(opt), findsOneWidget);
      }
    });

    testWidgets(
      'invokes onOptionSelected with the tapped index and does not '
      'toggle a chip when the callback is absent',
      (tester) async {
        int? tapped;
        await tester.pumpWidget(
          wrap(
            FcChatBubble(
              message: question,
              isUser: false,
              options: options,
              onOptionSelected: (i) => tapped = i,
            ),
          ),
        );

        await tester.tap(find.text('Skinner'));
        await tester.pump();
        expect(tapped, 1);
      },
    );

    testWidgets(
      'renders chips as disabled (non-tappable) when onOptionSelected '
      'is null — scrollback / already-answered case',
      (tester) async {
        await tester.pumpWidget(
          wrap(
            const FcChatBubble(
              message: question,
              isUser: false,
              options: options,
              selectedOptionIndex: 2,
            ),
          ),
        );

        final chips =
            tester.widgetList<ChoiceChip>(find.byType(ChoiceChip)).toList();
        expect(chips, hasLength(options.length));
        expect(chips.every((c) => c.onSelected == null), isTrue);
        expect(chips[2].selected, isTrue);
        expect(chips[0].selected, isFalse);
      },
    );

    testWidgets('user bubbles never render options, even if passed', (tester) async {
      await tester.pumpWidget(
        wrap(
          FcChatBubble(
            message: 'Skinner',
            isUser: true,
            options: options,
            onOptionSelected: (_) {},
          ),
        ),
      );
      expect(find.byType(ChoiceChip), findsNothing);
    });
  });
}
