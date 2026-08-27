import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('submits typed text and clears the controller', (tester) async {
    String? submitted;
    final controller = TextEditingController();

    await tester.pumpWidget(
      wrap(
        FcInputArea(controller: controller, onSend: (text) => submitted = text),
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
}
