import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  group('FcBanner', () {
    testWidgets('renders the message text', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => FcBanner.error(
                context: context,
                message: 'Failed to connect to server',
                onDismiss: () {},
              ),
            ),
          ),
        ),
      );

      expect(find.text('Failed to connect to server'), findsOneWidget);
    });

    testWidgets('dismiss action fires onDismiss', (tester) async {
      var dismissed = 0;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => FcBanner.warning(
                context: context,
                message: 'This action cannot be undone',
                onDismiss: () => dismissed++,
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Dismiss'));
      await tester.pump();

      expect(dismissed, 1);
    });

    testWidgets('error variant resolves the dark-theme error colour', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Builder(
              builder: (context) => FcBanner.error(
                context: context,
                message: 'Failed to connect to server',
                onDismiss: () {},
              ),
            ),
          ),
        ),
      );

      final banner = tester.widget<FcBanner>(find.byType(FcBanner));
      expect(banner.backgroundColor, SparkweaverTheme.dark().errorFill);
    });

    testWidgets('success variant resolves the dark-theme success colour', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Builder(
              builder: (context) => FcBanner.success(
                context: context,
                message: 'Changes saved successfully',
                onDismiss: () {},
              ),
            ),
          ),
        ),
      );

      final banner = tester.widget<FcBanner>(find.byType(FcBanner));
      expect(banner.backgroundColor, SparkweaverTheme.dark().successFill);
    });

    testWidgets('warning variant resolves the dark-theme warning colour', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Builder(
              builder: (context) => FcBanner.warning(
                context: context,
                message: 'This action cannot be undone',
                onDismiss: () {},
              ),
            ),
          ),
        ),
      );

      final banner = tester.widget<FcBanner>(find.byType(FcBanner));
      expect(banner.backgroundColor, SparkweaverTheme.dark().warningFill);
    });

    testWidgets('info variant resolves the dark-theme info colour', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData.dark(),
          home: Scaffold(
            body: Builder(
              builder: (context) => FcBanner.info(
                context: context,
                message: 'Processing your request...',
                onDismiss: () {},
              ),
            ),
          ),
        ),
      );

      final banner = tester.widget<FcBanner>(find.byType(FcBanner));
      expect(banner.backgroundColor, SparkweaverTheme.dark().infoFill);
    });
  });
}
