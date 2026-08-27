import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  /// The badge's own painted background. Reads off the [Container]
  /// ancestor of the badge [text].
  Color backgroundColorFor(WidgetTester tester, String text) {
    final container = tester.widget<Container>(
      find.ancestor(of: find.text(text), matching: find.byType(Container)),
    );
    return (container.decoration as BoxDecoration).color!;
  }

  Color foregroundColorFor(WidgetTester tester, String text) {
    return tester.widget<Text>(find.text(text)).style!.color!;
  }

  Container containerFor(WidgetTester tester, String text) {
    return tester.widget<Container>(
      find.ancestor(of: find.text(text), matching: find.byType(Container)),
    );
  }

  group('FcOutcomeBadge', () {
    final light = SparkweaverTheme.light();

    testWidgets('scored-true renders solid Correct, colors.success + white', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(true))),
      );

      expect(find.text('Correct'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Correct'), light.success);
      expect(foregroundColorFor(tester, 'Correct'), SparkweaverColors.white);
    });

    testWidgets('scored-false renders solid Incorrect, colors.error + white', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(false))),
      );

      expect(find.text('Incorrect'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Incorrect'), light.error);
      expect(foregroundColorFor(tester, 'Incorrect'), SparkweaverColors.white);
    });

    testWidgets('graded-again renders solid Again, colors.error + white', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcOutcomeBadge(
            outcome: FcGradedOutcome(FcSelfRatingGrade.again),
          ),
        ),
      );

      expect(find.text('Again'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Again'), light.error);
      expect(foregroundColorFor(tester, 'Again'), SparkweaverColors.white);
    });

    testWidgets('graded-almost renders solid Almost, colors.warning + white', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcOutcomeBadge(
            outcome: FcGradedOutcome(FcSelfRatingGrade.almost),
          ),
        ),
      );

      expect(find.text('Almost'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Almost'), light.warning);
      expect(foregroundColorFor(tester, 'Almost'), SparkweaverColors.white);
    });

    testWidgets('graded-knewIt renders solid Knew it, colors.success + white', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcOutcomeBadge(
            outcome: FcGradedOutcome(FcSelfRatingGrade.knewIt),
          ),
        ),
      );

      expect(find.text('Knew it'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Knew it'), light.success);
      expect(foregroundColorFor(tester, 'Knew it'), SparkweaverColors.white);
    });

    testWidgets('renders a solid background, not a tinted one, the badge-style '
        'non-negotiable', (tester) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(true))),
      );

      final solidBackground = backgroundColorFor(tester, 'Correct');
      final tintedBackground = light.successLight.withValues(alpha: 0.1);
      expect(solidBackground, isNot(equals(tintedBackground)));
      expect(solidBackground, light.success);
    });

    testWidgets('renders the original chip markup, not an FcBadge', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(true))),
      );

      final container = containerFor(tester, 'Correct');
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.border, isNull);
      expect(decoration.borderRadius, SparkweaverTokens.badgeRadius);
      expect(
        container.padding,
        const EdgeInsets.symmetric(
          horizontal: SparkweaverSpacing.sm,
          vertical: SparkweaverSpacing.xs,
        ),
      );

      final textStyle = tester.widget<Text>(find.text('Correct')).style!;
      expect(
        textStyle,
        SparkweaverTypography.labelSmall.copyWith(
          color: SparkweaverColors.white,
        ),
      );
    });
  });
}
