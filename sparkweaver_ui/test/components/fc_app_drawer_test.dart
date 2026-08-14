import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  Future<void> pumpDrawer(WidgetTester tester, FcAppDrawer drawer) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          drawer: drawer,
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('renders userName and userSubtitle in header', (tester) async {
    await pumpDrawer(
      tester,
      const FcAppDrawer(userName: 'Birgit', userSubtitle: 'Premium'),
    );

    expect(find.text('Birgit'), findsOneWidget);
    expect(find.text('Premium'), findsOneWidget);
  });

  testWidgets('renders items and invokes onTap', (tester) async {
    final tapped = <String>[];

    await pumpDrawer(
      tester,
      FcAppDrawer(
        userName: 'Anonymous',
        items: [
          FcDrawerItem(
            icon: Icons.settings,
            label: 'Settings',
            onTap: () => tapped.add('settings'),
          ),
          FcDrawerItem(
            icon: Icons.info_outline,
            label: 'About',
            onTap: () => tapped.add('about'),
          ),
        ],
      ),
    );

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);
    expect(find.byType(Divider), findsOneWidget);

    await tester.tap(find.text('Settings'));
    await tester.pumpAndSettle();

    expect(tapped, ['settings']);
  });

  testWidgets('renders footer widget when provided', (tester) async {
    await pumpDrawer(
      tester,
      FcAppDrawer(
        userName: 'Anonymous',
        footer: FcButton(
          label: 'Logout',
          icon: Icons.logout,
          variant: FcButtonVariant.text,
          fullWidth: true,
          onPressed: () {},
        ),
      ),
    );

    expect(find.text('Logout'), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);
  });

  testWidgets('omits Divider when items list is empty', (tester) async {
    await pumpDrawer(tester, const FcAppDrawer(userName: 'Anonymous'));

    expect(find.byType(Divider), findsNothing);
  });
}
