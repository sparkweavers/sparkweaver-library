import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

Future<bool?> _show(WidgetTester tester, FcConfirmationDialog dialog) async {
  bool? result;
  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () async {
            result = await showDialog<bool>(
              context: context,
              builder: (_) => dialog,
            );
          },
          child: const Text('open'),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
  return result;
}

void main() {
  const withBack = FcConfirmationDialog(
    title: 'Nothing left to review',
    message: 'No cards match that filter.',
    confirmLabel: 'Practice all questions',
    backLabel: 'Back to topics',
  );

  testWidgets('back link sits above the title, aligned to its left edge', (
    tester,
  ) async {
    await _show(tester, withBack);

    final arrow = tester.getTopLeft(
      find.byIcon(SparkweaverIcons.navigationBack),
    );
    final title = tester.getTopLeft(find.text('Nothing left to review'));
    expect(arrow.dy, lessThan(title.dy));
    expect(arrow.dx, closeTo(title.dx, 1));
  });

  testWidgets('back link carries a back arrow', (tester) async {
    await _show(tester, withBack);

    expect(find.byIcon(SparkweaverIcons.navigationBack), findsOneWidget);
  });

  testWidgets('a back link replaces the bottom cancel action', (tester) async {
    await _show(tester, withBack);

    expect(find.text('Cancel'), findsNothing);
    expect(find.text('Back to topics'), findsOneWidget);
  });

  testWidgets('tapping back returns false', (tester) async {
    await _show(tester, withBack);
    await tester.tap(find.text('Back to topics'));
    await tester.pumpAndSettle();

    expect(find.text('Nothing left to review'), findsNothing);
  });

  testWidgets('without a back label the cancel action stays', (tester) async {
    await _show(
      tester,
      const FcConfirmationDialog(title: 'Delete', message: 'Sure?'),
    );

    expect(find.text('Cancel'), findsOneWidget);
    expect(find.byIcon(SparkweaverIcons.navigationBack), findsNothing);
  });
}
