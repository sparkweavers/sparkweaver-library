import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  /// The size Flutter actually paints, rather than the enum we passed in.
  double renderedSize(WidgetTester tester) =>
      tester.widget<Icon>(find.byType(Icon)).size!;

  group('FcIcon sizes', () {
    testWidgets('every size maps to its design token', (tester) async {
      const expected = {
        FcIconSize.small: 14.0,
        FcIconSize.medium: SparkweaverTokens.iconMd,
        FcIconSize.large: SparkweaverTokens.iconLg,
        FcIconSize.xLarge: SparkweaverTokens.iconXl,
        FcIconSize.xxLarge: SparkweaverTokens.iconXxl,
      };

      for (final entry in expected.entries) {
        await tester.pumpWidget(wrap(FcIcon(Icons.star, size: entry.key)));
        expect(renderedSize(tester), entry.value, reason: '${entry.key}');
      }
    });

    testWidgets('xxLarge is 48px', (tester) async {
      await tester.pumpWidget(
        wrap(const FcIcon(Icons.star, size: FcIconSize.xxLarge)),
      );
      expect(renderedSize(tester), 48.0);
    });

    testWidgets('every size is covered', (tester) async {
      for (final size in FcIconSize.values) {
        await tester.pumpWidget(wrap(FcIcon(Icons.star, size: size)));
        expect(renderedSize(tester), greaterThan(0));
      }
    });
  });
}
