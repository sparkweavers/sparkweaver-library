import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

typedef _Factory =
    FcSnackBar Function({
      required BuildContext context,
      required String message,
      FcSnackBarAction? action,
      Key? key,
    });

/// Pumps a button that shows the snackbar, so assertions run against the
/// mounted widget rather than an unshown instance.
Future<void> _showSnackBar(
  WidgetTester tester,
  FcSnackBar Function(BuildContext) build,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).showSnackBar(build(context)),
            child: const Text('Show'),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Show'));
  await tester.pumpAndSettle();
}

void main() {
  group('FcSnackBar', () {
    final variants = <FcStatusVariant, _Factory>{
      FcStatusVariant.success: FcSnackBar.success,
      FcStatusVariant.error: FcSnackBar.error,
      FcStatusVariant.warning: FcSnackBar.warning,
      FcStatusVariant.info: FcSnackBar.info,
    };

    for (final entry in variants.entries) {
      testWidgets('${entry.key.name} variant shows its themed fill', (
        tester,
      ) async {
        await _showSnackBar(
          tester,
          (context) => entry.value(context: context, message: 'A message'),
        );

        final theme = SparkweaverTheme.light();
        final expectedFill = switch (entry.key) {
          FcStatusVariant.success => theme.successFill,
          FcStatusVariant.error => theme.errorFill,
          FcStatusVariant.warning => theme.warningFill,
          FcStatusVariant.info => theme.infoFill,
        };
        expect(find.text('A message'), findsOneWidget);
        expect(
          tester.widget<SnackBar>(find.byType(SnackBar)).backgroundColor,
          expectedFill,
        );
      });
    }

    testWidgets('action fires its callback when tapped', (tester) async {
      var tapped = 0;
      await _showSnackBar(
        tester,
        (context) => FcSnackBar.error(
          context: context,
          message: 'Failed to upload',
          action: (label: 'Retry', onPressed: () => tapped++),
        ),
      );

      await tester.tap(find.text('Retry'));
      await tester.pump();

      expect(tapped, 1);
    });
  });
}
