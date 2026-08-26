import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

Future<BoxDecoration> _decorationOf(
  WidgetTester tester,
  FcCardVariant variant, {
  Brightness brightness = Brightness.light,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(brightness: brightness),
      home: FcCard(variant: variant, child: const Text('Yearly')),
    ),
  );
  // MaterialApp lerps the theme, so a re-pump still reads the old brightness.
  await tester.pumpAndSettle();
  final container = tester.widget<Container>(
    find.ancestor(of: find.text('Yearly'), matching: find.byType(Container)),
  );
  return container.decoration! as BoxDecoration;
}

void main() {
  group('FcCard variants', () {
    testWidgets('surface keeps the purple border', (tester) async {
      final decoration = await _decorationOf(tester, FcCardVariant.surface);
      final colors = SparkweaverTheme.light();

      expect(decoration.color, colors.surface);
      expect((decoration.border as Border).top.color, colors.primaryLight);
    });

    testWidgets('muted has no border', (tester) async {
      final decoration = await _decorationOf(tester, FcCardVariant.muted);

      expect(decoration.color, SparkweaverTheme.light().surfaceVariant);
      expect(decoration.border, isNull);
    });

    testWidgets('selected is blue and opaque', (tester) async {
      final decoration = await _decorationOf(tester, FcCardVariant.selected);
      final colors = SparkweaverTheme.light();

      expect((decoration.border as Border).top.color, colors.secondary);
      expect(decoration.color, isNot(colors.surface));
      expect(decoration.color!.a, 1.0);
    });

    testWidgets('selected follows the dark theme', (tester) async {
      final light = await _decorationOf(tester, FcCardVariant.selected);
      final dark = await _decorationOf(
        tester,
        FcCardVariant.selected,
        brightness: Brightness.dark,
      );

      expect(dark.color, isNot(light.color));
    });
  });
}
