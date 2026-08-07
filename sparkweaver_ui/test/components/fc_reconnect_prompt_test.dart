import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  testWidgets('renders default title and button label', (tester) async {
    await tester.pumpWidget(
      wrap(FcReconnectPrompt(onReconnect: () {})),
    );

    expect(find.text('Disconnected'), findsOneWidget);
    expect(find.text('Reconnect'), findsOneWidget);
    expect(find.byIcon(Icons.cloud_off), findsOneWidget);
  });

  testWidgets('renders subtitle when provided', (tester) async {
    await tester.pumpWidget(
      wrap(
        FcReconnectPrompt(
          subtitle: 'The connection was lost.',
          onReconnect: () {},
        ),
      ),
    );

    expect(find.text('The connection was lost.'), findsOneWidget);
  });

  testWidgets('omits subtitle when null', (tester) async {
    await tester.pumpWidget(
      wrap(FcReconnectPrompt(onReconnect: () {})),
    );

    expect(find.text('The connection was lost.'), findsNothing);
  });

  testWidgets('invokes onReconnect when tapped', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      wrap(FcReconnectPrompt(onReconnect: () => taps++)),
    );

    await tester.tap(find.text('Reconnect'));
    await tester.pump();

    expect(taps, 1);
  });

  testWidgets('shows loading indicator and ignores taps when reconnecting',
      (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      wrap(
        FcReconnectPrompt(
          isReconnecting: true,
          onReconnect: () => taps++,
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Reconnect'), findsNothing);

    await tester.tap(find.byType(FcReconnectPrompt));
    await tester.pump();

    expect(taps, 0);
  });
}
