import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

/// Standard app shell for widgets that need Material/ambient theming.
Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

/// Bare shell that leaves the ambient [DefaultTextStyle] fully under the
/// test's control, for pinning colour fallback precedence.
Widget bareWrap(Widget child, {TextStyle style = const TextStyle()}) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: MediaQuery(
      data: const MediaQueryData(),
      child: DefaultTextStyle(style: style, child: child),
    ),
  );
}

/// Concatenates the plain text of every rendered [RichText] in the tree,
/// so tests can assert Markdown delimiters were parsed away.
String renderedText(WidgetTester tester) {
  return tester
      .widgetList<RichText>(find.byType(RichText))
      .map((w) => w.text.toPlainText())
      .join();
}

class _CountingNavigatorObserver extends NavigatorObserver {
  int pushCount = 0;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    pushCount++;
  }
}

void main() {
  group('FcMarkdownText — plain-text path', () {
    testWidgets('renders a bare Text with the caller baseStyle', (
      tester,
    ) async {
      const baseStyle = TextStyle(fontSize: 16, color: Colors.blue);
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: 'Just a normal sentence.',
            baseStyle: baseStyle,
          ),
        ),
      );

      expect(find.byType(MarkdownBody), findsNothing);
      final text = tester.widget<Text>(find.byType(Text));
      expect(text.data, 'Just a normal sentence.');
      expect(text.style, baseStyle);
    });

    testWidgets('forwards textAlign to the Text widget', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: 'Centered plain text',
            baseStyle: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );

      final text = tester.widget<Text>(find.byType(Text));
      expect(text.textAlign, TextAlign.center);
    });

    testWidgets('renders an empty string as plain Text', (tester) async {
      await tester.pumpWidget(
        wrap(const FcMarkdownText(data: '', baseStyle: TextStyle())),
      );

      expect(find.byType(MarkdownBody), findsNothing);
      expect(find.byType(Text), findsOneWidget);
    });
  });

  group('FcMarkdownText — detection boundary: stays plain', () {
    for (final data in ['3-5 EUR', 'snake_case_words', 'C_1']) {
      testWidgets('"$data" takes the Text path', (tester) async {
        await tester.pumpWidget(
          wrap(FcMarkdownText(data: data, baseStyle: const TextStyle())),
        );

        expect(find.byType(MarkdownBody), findsNothing);
        expect(find.byType(Text), findsOneWidget);
      });
    }

    testWidgets('"3 * 3 * 9" takes the Text path', (tester) async {
      await tester.pumpWidget(
        wrap(const FcMarkdownText(data: '3 * 3 * 9', baseStyle: TextStyle())),
      );

      expect(find.byType(MarkdownBody), findsNothing);
    });
  });

  group('FcMarkdownText — detection boundary: renders as Markdown', () {
    final cases = <(String data, String expectedText, String forbidden)>[
      ('**bold**', 'bold', '**'),
      ('*italic*', 'italic', '*italic*'),
      ('_italic_', 'italic', '_italic_'),
      ('- one\n- two', 'one', '- one'),
      ('`code`', 'code', '`code`'),
      ('# Heading', 'Heading', '# Heading'),
      ('[Example](https://example.com)', 'Example', '[Example]'),
    ];

    for (final c in cases) {
      testWidgets('"${c.$1}" renders via MarkdownBody, delimiters stripped', (
        tester,
      ) async {
        await tester.pumpWidget(
          wrap(FcMarkdownText(data: c.$1, baseStyle: const TextStyle())),
        );

        expect(find.byType(MarkdownBody), findsOneWidget);
        final rendered = renderedText(tester);
        expect(rendered, contains(c.$2));
        expect(rendered, isNot(contains(c.$3)));
      });
    }
  });

  group('FcMarkdownText — links are inert', () {
    testWidgets('tapping a rendered link does not navigate', (tester) async {
      final observer = _CountingNavigatorObserver();
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [observer],
          home: Scaffold(
            body: const FcMarkdownText(
              data: '[Example](https://example.com)',
              baseStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
      );
      final pushesBeforeTap = observer.pushCount;

      await tester.tap(find.text('Example', findRichText: true));
      await tester.pumpAndSettle();

      expect(observer.pushCount, pushesBeforeTap);
      expect(find.byType(FcMarkdownText), findsOneWidget);
    });

    testWidgets('an image renders nothing and issues no request', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: '![chart](https://example.com/beacon.png)',
            baseStyle: TextStyle(fontSize: 14),
          ),
        ),
      );

      expect(find.byType(Image), findsNothing);
    });
  });

  group('FcMarkdownText — inlineOnly', () {
    const baseStyle = TextStyle(fontSize: 14);
    const heading = '# Heading text';

    testWidgets(
      'inlineOnly keeps headings at baseStyle size, forBody enlarges them',
      (tester) async {
        await tester.pumpWidget(
          wrap(
            const FcMarkdownText(
              data: heading,
              baseStyle: baseStyle,
              inlineOnly: true,
            ),
          ),
        );
        final inlineSheet = tester
            .widget<MarkdownBody>(find.byType(MarkdownBody))
            .styleSheet!;

        await tester.pumpWidget(
          wrap(const FcMarkdownText(data: heading, baseStyle: baseStyle)),
        );
        final bodySheet = tester
            .widget<MarkdownBody>(find.byType(MarkdownBody))
            .styleSheet!;

        expect(inlineSheet.h1?.fontSize, baseStyle.fontSize);
        expect(bodySheet.h1?.fontSize, SparkweaverTypography.heading1.fontSize);
        expect(bodySheet.h1?.fontSize, isNot(inlineSheet.h1?.fontSize));
      },
    );

    testWidgets('inlineOnly renders a shorter block than forBody', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const SizedBox(
            width: 300,
            child: FcMarkdownText(
              data: heading,
              baseStyle: baseStyle,
              inlineOnly: true,
            ),
          ),
        ),
      );
      final inlineHeight = tester.getSize(find.byType(FcMarkdownText)).height;

      await tester.pumpWidget(
        wrap(
          const SizedBox(
            width: 300,
            child: FcMarkdownText(data: heading, baseStyle: baseStyle),
          ),
        ),
      );
      final bodyHeight = tester.getSize(find.byType(FcMarkdownText)).height;

      expect(inlineHeight, lessThan(bodyHeight));
    });
  });

  group('FcMarkdownText — textAlign', () {
    testWidgets('markdown path maps TextAlign.center to WrapAlignment.center', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: '**Centered markdown**',
            baseStyle: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      );

      final body = tester.widget<MarkdownBody>(find.byType(MarkdownBody));
      expect(body.styleSheet!.textAlign, WrapAlignment.center);
    });

    testWidgets('markdown path leaves textAlign at the stylesheet default '
        'when omitted', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: '**No alignment override**',
            baseStyle: TextStyle(fontSize: 14),
          ),
        ),
      );

      final body = tester.widget<MarkdownBody>(find.byType(MarkdownBody));
      expect(body.styleSheet!.textAlign, WrapAlignment.start);
    });
  });

  group('FcMarkdownText — colour resolution', () {
    testWidgets('textColor wins over baseStyle.color', (tester) async {
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: '**bold**',
            baseStyle: TextStyle(color: Colors.red),
            textColor: Colors.green,
          ),
        ),
      );

      final body = tester.widget<MarkdownBody>(find.byType(MarkdownBody));
      expect(body.styleSheet!.strong?.color, Colors.green);
    });

    testWidgets('falls back to baseStyle.color when textColor is omitted', (
      tester,
    ) async {
      await tester.pumpWidget(
        wrap(
          const FcMarkdownText(
            data: '**bold**',
            baseStyle: TextStyle(color: Colors.red),
          ),
        ),
      );

      final body = tester.widget<MarkdownBody>(find.byType(MarkdownBody));
      expect(body.styleSheet!.strong?.color, Colors.red);
    });

    testWidgets('falls back to the ambient DefaultTextStyle color', (
      tester,
    ) async {
      await tester.pumpWidget(
        bareWrap(
          const FcMarkdownText(
            data: '**bold**',
            baseStyle: TextStyle(fontSize: 14),
          ),
          style: const TextStyle(color: Colors.purple),
        ),
      );

      final body = tester.widget<MarkdownBody>(find.byType(MarkdownBody));
      expect(body.styleSheet!.strong?.color, Colors.purple);
    });

    testWidgets(
      'falls back to SparkweaverColors.textPrimary as the last resort',
      (tester) async {
        await tester.pumpWidget(
          bareWrap(
            const FcMarkdownText(
              data: '**bold**',
              baseStyle: TextStyle(fontSize: 14),
            ),
          ),
        );

        final body = tester.widget<MarkdownBody>(find.byType(MarkdownBody));
        expect(body.styleSheet!.strong?.color, SparkweaverColors.textPrimary);
      },
    );
  });
}
