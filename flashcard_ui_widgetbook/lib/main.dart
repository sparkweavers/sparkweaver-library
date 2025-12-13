import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the generated widgetbook
import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        TextScaleAddon(
          min: 1.0,
          max: 2.0,
        ),
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: child,
              ),
            );
          },
        ),
      ],
    );
  }
}
