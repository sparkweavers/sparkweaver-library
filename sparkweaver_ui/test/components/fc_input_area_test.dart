import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  Widget wrapWithInsets(
    Widget child, {
    required double viewInsetsBottom,
    required double paddingBottom,
  }) {
    return MaterialApp(
      builder: (context, navigator) => MediaQuery(
        data: MediaQueryData(
          viewInsets: EdgeInsets.only(bottom: viewInsetsBottom),
          padding: EdgeInsets.only(bottom: paddingBottom),
        ),
        child: navigator!,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const Expanded(child: SizedBox()),
            child,
          ],
        ),
      ),
    );
  }

  void setScreenSize(WidgetTester tester) {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  }

  double gapBelowInputRow(WidgetTester tester) {
    final screenBottom = tester.getRect(find.byType(MaterialApp)).bottom;
    final rowBottom = tester.getRect(find.byType(Container).first).bottom;
    return screenBottom - rowBottom;
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

  group('FcInputArea — bottom inset', () {
    testWidgets('keyboard closed, nav bar present: clears the nav bar', (
      tester,
    ) async {
      setScreenSize(tester);

      await tester.pumpWidget(
        wrapWithInsets(
          const FcInputArea(),
          viewInsetsBottom: 0,
          paddingBottom: 48,
        ),
      );

      expect(gapBelowInputRow(tester), greaterThanOrEqualTo(48));
    });

    testWidgets('keyboard open: lifted by viewInsets only, no double-count', (
      tester,
    ) async {
      setScreenSize(tester);

      await tester.pumpWidget(
        wrapWithInsets(
          const FcInputArea(),
          viewInsetsBottom: 300,
          paddingBottom: 0,
        ),
      );

      final gap = gapBelowInputRow(tester);
      expect(gap, closeTo(300, 0.5));
      expect(gap, isNot(closeTo(348, 0.5)));
    });

    testWidgets('no insets: no extra bottom padding is added', (tester) async {
      setScreenSize(tester);

      await tester.pumpWidget(
        wrapWithInsets(
          const FcInputArea(),
          viewInsetsBottom: 0,
          paddingBottom: 0,
        ),
      );

      expect(gapBelowInputRow(tester), closeTo(0, 0.5));
    });
  });
}
