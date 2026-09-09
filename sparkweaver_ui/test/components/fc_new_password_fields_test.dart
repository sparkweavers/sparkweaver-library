import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

import '../helpers/contrast.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  Widget wrapDark(Widget child) => MaterialApp(
    theme: ThemeData(brightness: Brightness.dark),
    home: Scaffold(body: child),
  );

  List<TextField> textFields(WidgetTester tester) =>
      tester.widgetList<TextField>(find.byType(TextField)).toList();

  FcNewPasswordFields buildFields({
    String? newPasswordError,
    String? confirmPasswordError,
    bool enabled = true,
    ValueChanged<String>? onNewPasswordChanged,
    ValueChanged<String>? onConfirmPasswordChanged,
  }) {
    return FcNewPasswordFields(
      newPasswordController: TextEditingController(),
      confirmPasswordController: TextEditingController(),
      newPasswordLabel: 'New password',
      confirmPasswordLabel: 'Confirm password',
      newPasswordError: newPasswordError,
      confirmPasswordError: confirmPasswordError,
      enabled: enabled,
      onNewPasswordChanged: onNewPasswordChanged,
      onConfirmPasswordChanged: onConfirmPasswordChanged,
    );
  }

  group('FcNewPasswordFields', () {
    testWidgets('renders both caller-supplied labels, no hardcoded copy', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(buildFields()));

      expect(find.text('New password'), findsOneWidget);
      expect(find.text('Confirm password'), findsOneWidget);
    });

    testWidgets('error text surfaces on the field it was passed for', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(buildFields(newPasswordError: 'Too short')));

      expect(find.text('Too short'), findsOneWidget);
      final fields = textFields(tester);
      expect(fields[0].decoration?.errorText, 'Too short');
      expect(fields[1].decoration?.errorText, isNull);
    });

    testWidgets('mismatch error surfaces on the confirm field only', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(buildFields(confirmPasswordError: 'Passwords do not match')),
      );

      final fields = textFields(tester);
      expect(fields[0].decoration?.errorText, isNull);
      expect(fields[1].decoration?.errorText, 'Passwords do not match');
    });

    testWidgets('both fields start obscured, like the underlying atom', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(buildFields()));

      final fields = textFields(tester);
      expect(fields[0].obscureText, isTrue);
      expect(fields[1].obscureText, isTrue);
      expect(find.byIcon(Icons.visibility), findsNWidgets(2));
    });

    testWidgets('each field owns its own visibility toggle independently', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(buildFields()));

      await tester.tap(find.byIcon(Icons.visibility).first);
      await tester.pump();

      final fields = textFields(tester);
      expect(fields[0].obscureText, isFalse);
      expect(fields[1].obscureText, isTrue);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('enabled: false disables both visibility toggles', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(buildFields(enabled: false)));

      final toggles = tester
          .widgetList<IconButton>(find.byType(IconButton))
          .toList();
      expect(toggles, hasLength(2));
      expect(toggles.every((t) => t.onPressed == null), isTrue);
    });

    testWidgets('typing in each field invokes only its own callback', (
      tester,
    ) async {
      String? newValue;
      String? confirmValue;
      await tester.pumpWidget(
        wrap(
          buildFields(
            onNewPasswordChanged: (v) => newValue = v,
            onConfirmPasswordChanged: (v) => confirmValue = v,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).first, 'secret1');
      expect(newValue, 'secret1');
      expect(confirmValue, isNull);

      await tester.enterText(find.byType(TextField).last, 'secret1');
      expect(confirmValue, 'secret1');
    });
  });

  group('FcNewPasswordFields in dark theme', () {
    testWidgets('renders both labels without a light-theme layout crash', (
      tester,
    ) async {
      await tester.pumpWidget(wrapDark(buildFields()));

      expect(find.text('New password'), findsOneWidget);
      expect(find.text('Confirm password'), findsOneWidget);
    });

    testWidgets('error text clears WCAG AA against its field fill', (
      tester,
    ) async {
      await tester.pumpWidget(wrap(buildFields(newPasswordError: 'Too short')));
      final light = SparkweaverTheme.light();
      expect(
        contrastRatio(light.white, light.error),
        greaterThanOrEqualTo(4.5),
      );

      await tester.pumpWidget(
        wrapDark(buildFields(newPasswordError: 'Too short')),
      );
      final dark = SparkweaverTheme.dark();
      expect(contrastRatio(dark.white, dark.error), greaterThanOrEqualTo(4.5));
    });

    testWidgets('typed text clears WCAG AA against its own field fill', (
      tester,
    ) async {
      await tester.pumpWidget(wrapDark(buildFields()));

      final fields = textFields(tester);
      for (final field in fields) {
        final fill = field.decoration!.fillColor!;
        final textColor = field.style!.color!;
        expect(
          contrastRatio(fill, textColor),
          greaterThanOrEqualTo(4.5),
          reason: 'typed text is unreadable against the field fill',
        );
      }
    });
  });
}
