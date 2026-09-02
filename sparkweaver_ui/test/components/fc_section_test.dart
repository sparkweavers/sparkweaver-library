import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

Future<void> _pump(
  WidgetTester tester,
  FcSectionVariant variant, {
  Brightness brightness = Brightness.light,
  IconData? icon,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      theme: ThemeData(brightness: brightness),
      home: Scaffold(
        body: FcSection(
          variant: variant,
          title: 'Danger Zone',
          icon: icon,
          child: const Text('body content'),
        ),
      ),
    ),
  );
  // MaterialApp lerps the theme, so a re-pump still reads the old brightness.
  await tester.pumpAndSettle();
}

Color _borderOf(WidgetTester tester) {
  final container = tester.widget<Container>(
    find.ancestor(
      of: find.text('body content'),
      matching: find.byType(Container),
    ),
  );
  final decoration = container.decoration! as BoxDecoration;
  return (decoration.border! as Border).top.color;
}

Color _headingColorOf(WidgetTester tester) =>
    tester.widget<Text>(find.text('Danger Zone')).style!.color!;

double _luminance(Color color) {
  double channel(double c) =>
      c <= 0.03928 ? c / 12.92 : math.pow((c + 0.055) / 1.055, 2.4).toDouble();
  return 0.2126 * channel(color.r) +
      0.7152 * channel(color.g) +
      0.0722 * channel(color.b);
}

/// Asserted rather than eyeballed, since a variant only fails in one theme.
double _contrast(Color a, Color b) {
  final hi = math.max(_luminance(a), _luminance(b));
  final lo = math.min(_luminance(a), _luminance(b));
  return (hi + 0.05) / (lo + 0.05);
}

void main() {
  group('FcSection', () {
    testWidgets('shows the title and the body content', (tester) async {
      await _pump(tester, FcSectionVariant.neutral);

      expect(find.text('Danger Zone'), findsOneWidget);
      expect(find.text('body content'), findsOneWidget);
    });

    testWidgets('shows a leading icon only when one is given', (tester) async {
      await _pump(tester, FcSectionVariant.neutral);
      expect(find.byType(Icon), findsNothing);

      await _pump(
        tester,
        FcSectionVariant.danger,
        icon: Icons.warning_amber_rounded,
      );
      expect(find.byIcon(Icons.warning_amber_rounded), findsOneWidget);
    });

    testWidgets('each variant borders in its own accent', (tester) async {
      final colors = SparkweaverTheme.light();

      await _pump(tester, FcSectionVariant.primary);
      expect(_borderOf(tester), colors.primary);

      await _pump(tester, FcSectionVariant.secondary);
      expect(_borderOf(tester), colors.secondary);

      await _pump(tester, FcSectionVariant.neutral);
      expect(_borderOf(tester), colors.borderDark);

      await _pump(tester, FcSectionVariant.danger);
      expect(_borderOf(tester), colors.error);
    });

    for (final brightness in Brightness.values) {
      testWidgets('every heading clears WCAG AA in $brightness', (
        tester,
      ) async {
        final surface = brightness == Brightness.dark
            ? SparkweaverTheme.dark().surface
            : SparkweaverTheme.light().surface;

        for (final variant in FcSectionVariant.values) {
          await _pump(tester, variant, brightness: brightness);
          expect(
            _contrast(_headingColorOf(tester), surface),
            greaterThanOrEqualTo(4.5),
            reason: '$variant heading is unreadable in $brightness',
          );
        }
      });
    }
  });
}
