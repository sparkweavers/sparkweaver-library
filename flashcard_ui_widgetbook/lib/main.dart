import 'package:sparkweaver_ui/sparkweaver_ui.dart';
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

  /// Creates a light theme with Flashcard design system colors
  ThemeData _buildLightTheme() {
    final colors = FlashcardColorScheme.light();

    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: colors.primary,
        primaryContainer: colors.primaryLight,
        secondary: colors.secondary,
        secondaryContainer: colors.secondaryLight,
        error: colors.error,
        errorContainer: colors.errorLight,
        surface: colors.surface,
        surfaceContainerHighest: colors.surfaceVariant,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: colors.textPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: colors.backgroundLight,
      cardColor: colors.surface,
      dividerColor: colors.borderLight,
    );
  }

  /// Creates a dark theme with Flashcard design system colors
  ThemeData _buildDarkTheme() {
    final colors = FlashcardColorScheme.dark();

    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        primaryContainer: colors.primaryDark,
        secondary: colors.secondary,
        secondaryContainer: colors.secondaryDark,
        error: colors.error,
        errorContainer: colors.errorDark,
        surface: colors.surface,
        surfaceContainerHighest: colors.surfaceVariant,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: colors.textPrimary,
        onError: Colors.black,
      ),
      scaffoldBackgroundColor: colors.backgroundLight,
      cardColor: colors.surface,
      dividerColor: colors.borderLight,
    );
  }

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
              name: 'Light (Flashcard)',
              data: _buildLightTheme(),
            ),
            WidgetbookTheme(
              name: 'Dark (Flashcard)',
              data: _buildDarkTheme(),
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
