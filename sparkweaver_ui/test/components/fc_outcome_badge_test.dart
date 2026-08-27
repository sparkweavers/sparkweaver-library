import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

import '../helpers/contrast.dart';

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

    testWidgets('scored-true renders solid Correct on the success fill', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(true))),
      );

      expect(find.text('Correct'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Correct'), light.successFill);
      expect(foregroundColorFor(tester, 'Correct'), light.onSuccess);
    });

    testWidgets('scored-false renders solid Incorrect on the error fill', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(false))),
      );

      expect(find.text('Incorrect'), findsOneWidget);
      expect(backgroundColorFor(tester, 'Incorrect'), light.errorFill);
      expect(foregroundColorFor(tester, 'Incorrect'), light.onError);
    });

    testWidgets('graded-again renders solid Again on the error fill', (
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
      expect(backgroundColorFor(tester, 'Again'), light.errorFill);
      expect(foregroundColorFor(tester, 'Again'), light.onError);
    });

    testWidgets('graded-almost renders solid Almost on the warning fill', (
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
      expect(backgroundColorFor(tester, 'Almost'), light.warningFill);
      expect(foregroundColorFor(tester, 'Almost'), light.onWarning);
    });

    testWidgets('graded-knewIt renders solid Knew it on the success fill', (
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
      expect(backgroundColorFor(tester, 'Knew it'), light.successFill);
      expect(foregroundColorFor(tester, 'Knew it'), light.onSuccess);
    });

    testWidgets('renders a solid background, not a tinted one, the badge-style '
        'non-negotiable', (tester) async {
      await tester.pumpWidget(
        wrap(const FcOutcomeBadge(outcome: FcScoredOutcome(true))),
      );

      final solidBackground = backgroundColorFor(tester, 'Correct');
      final tintedBackground = light.successLight.withValues(alpha: 0.1);
      expect(solidBackground, isNot(equals(tintedBackground)));
      expect(solidBackground, light.successFill);
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
        SparkweaverTypography.labelSmall.copyWith(color: light.onSuccess),
      );
    });
  });

  group('FcOutcomeBadge in dark mode', () {
    Widget wrapDark(Widget child) => MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(body: child),
    );

    final dark = SparkweaverTheme.dark();

    testWidgets('every chip clears WCAG AA against its own fill', (
      tester,
    ) async {
      const outcomes = <FcResultOutcome, String>{
        FcScoredOutcome(true): 'Correct',
        FcScoredOutcome(false): 'Incorrect',
        FcGradedOutcome(FcSelfRatingGrade.again): 'Again',
        FcGradedOutcome(FcSelfRatingGrade.almost): 'Almost',
        FcGradedOutcome(FcSelfRatingGrade.knewIt): 'Knew it',
      };

      for (final entry in outcomes.entries) {
        await tester.pumpWidget(wrapDark(FcOutcomeBadge(outcome: entry.key)));
        expect(
          contrastRatio(
            backgroundColorFor(tester, entry.value),
            foregroundColorFor(tester, entry.value),
          ),
          greaterThanOrEqualTo(4.5),
          reason: '${entry.value} chip is unreadable in dark mode',
        );
      }
    });

    testWidgets('the Almost chip is not white on yellow', (tester) async {
      await tester.pumpWidget(
        wrapDark(
          const FcOutcomeBadge(
            outcome: FcGradedOutcome(FcSelfRatingGrade.almost),
          ),
        ),
      );

      expect(backgroundColorFor(tester, 'Almost'), dark.warningFill);
      expect(
        foregroundColorFor(tester, 'Almost'),
        isNot(equals(SparkweaverColors.white)),
      );
    });
  });
}
