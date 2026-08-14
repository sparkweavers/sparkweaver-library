import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('submits typed text in textWithVoice mode', (tester) async {
    String? submitted;
    final controller = TextEditingController();

    await tester.pumpWidget(
      wrap(
        FcInputArea(
          type: FcInputAreaType.textWithVoice,
          controller: controller,
          onSend: (text) => submitted = text,
        ),
      ),
    );

    final textField = find.byType(TextField);
    await tester.tap(textField);
    await tester.pump();
    await tester.enterText(textField, 'Hallo AI');
    await tester.testTextInput.receiveAction(TextInputAction.send);
    await tester.pump();

    expect(submitted, 'Hallo AI');
    expect(controller.text, '');
  });

  testWidgets('calls mic press start then mic press end', (tester) async {
    final events = <String>[];

    await tester.pumpWidget(
      wrap(
        FcInputArea(
          type: FcInputAreaType.textWithVoice,
          onMicPressStart: () => events.add('start'),
          onMicPressEnd: () => events.add('end'),
        ),
      ),
    );

    final inputArea = tester.widget<FcInputArea>(find.byType(FcInputArea));
    inputArea.onMicPressStart?.call();
    inputArea.onMicPressEnd?.call();

    expect(events, ['start', 'end']);
  });

  testWidgets('shows recording icon when isRecording is true', (tester) async {
    await tester.pumpWidget(
      wrap(
        const FcInputArea(
          type: FcInputAreaType.textWithVoice,
          isRecording: true,
        ),
      ),
    );

    expect(find.byIcon(Icons.graphic_eq), findsOneWidget);
  });
}
