import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  TextField textField(WidgetTester tester) =>
      tester.widget<TextField>(find.byType(TextField));

  IconButton iconButton(WidgetTester tester) =>
      tester.widget<IconButton>(find.byType(IconButton));

  group('FcInputField password toggle', () {
    testWidgets('toggles obscurity, icon and tooltip on each tap', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcInputField(
            type: FcInputType.password,
            showPasswordLabel: 'Show password',
            hidePasswordLabel: 'Hide password',
          ),
        ),
      );

      expect(textField(tester).obscureText, isTrue);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(iconButton(tester).tooltip, 'Show password');

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(textField(tester).obscureText, isFalse);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(iconButton(tester).tooltip, 'Hide password');

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(textField(tester).obscureText, isTrue);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('a disabled field cannot be toggled', (tester) async {
      await tester.pumpWidget(
        wrap(const FcInputField(type: FcInputType.password, enabled: false)),
      );

      expect(iconButton(tester).onPressed, isNull);
    });

    testWidgets('an explicit suffixIcon replaces the toggle', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcInputField(
            type: FcInputType.password,
            suffixIcon: Icons.search,
          ),
        ),
      );

      expect((iconButton(tester).icon as Icon).icon, Icons.search);
    });
  });
}
