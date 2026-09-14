import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  TextField findTextField(WidgetTester tester) =>
      tester.widget<TextField>(find.byType(TextField));

  group('FcInputField password toggle', () {
    testWidgets('renders the visibility (eye) icon by default', (tester) async {
      await tester.pumpWidget(
        wrap(const FcInputField(type: FcInputType.password)),
      );

      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
    });

    testWidgets('password starts obscured', (tester) async {
      await tester.pumpWidget(
        wrap(const FcInputField(type: FcInputType.password)),
      );

      expect(findTextField(tester).obscureText, isTrue);
    });

    testWidgets('tapping the eye reveals the password', (tester) async {
      await tester.pumpWidget(
        wrap(const FcInputField(type: FcInputType.password)),
      );

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      expect(findTextField(tester).obscureText, isFalse);
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });

    testWidgets('tapping the eye again re-obscures the password', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcInputField(type: FcInputType.password)),
      );

      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      expect(findTextField(tester).obscureText, isTrue);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('toggle is disabled when enabled is false', (tester) async {
      await tester.pumpWidget(
        wrap(const FcInputField(type: FcInputType.password, enabled: false)),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.onPressed, isNull);
    });

    testWidgets('exposes the show and hide labels as the tooltip', (
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

      expect(
        tester.widget<IconButton>(find.byType(IconButton)).tooltip,
        'Show password',
      );
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(
        tester.widget<IconButton>(find.byType(IconButton)).tooltip,
        'Hide password',
      );
    });

    testWidgets('an explicit suffixIcon wins over the password toggle', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcInputField(
            type: FcInputType.password,
            suffixIcon: Icons.search,
          ),
        ),
      );
      final icon = tester.widget<IconButton>(find.byType(IconButton)).icon;
      expect((icon as Icon).icon, Icons.search);
    });
  });
}
