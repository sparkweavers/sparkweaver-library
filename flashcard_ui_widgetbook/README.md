# Flashcard UI Widgetbook

Interactive component showcase and documentation for the Flashcard UI library using Widgetbook.

## About

This app provides an interactive way to explore, test, and document all components from the `flashcard_ui` library.

## Features

- Browse all UI components in isolation
- Test components with different variants
- View components on different devices (iPhone, Android, iPad)
- Test with light and dark themes
- Adjust text scale factors for accessibility testing
- Interactive component playground

## Running the Widgetbook

```bash
flutter run
```

Or for web:

```bash
flutter run -d chrome
```

## Building After Component Changes

When you add new components or use cases, regenerate the Widgetbook code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Adding New Components

1. Create your component in `flashcard_ui/lib/components/`
2. Export it from `flashcard_ui/lib/flashcard_ui.dart`
3. Create use cases in `lib/usecases/your_component_usecases.dart`:

```dart
import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: YourComponent)
Widget defaultUseCase(BuildContext context) {
  return const YourComponent();
}
```

4. Run build_runner to generate the code
5. Run the app to see your component

## Project Structure

```
lib/
├── usecases/                   # Component use cases
│   ├── badge_usecases.dart
│   └── chat_bubble_usecases.dart
└── main.dart                   # Widgetbook app entry
```

## Use Cases

Each component has multiple use cases demonstrating:
- Default state
- Different variants
- Edge cases
- Interactive examples
- Real-world usage scenarios

## Learn More

- [Widgetbook Documentation](https://docs.widgetbook.io/)
- [Flashcard UI Library](../flashcard_ui/README.md)
- [Main Project README](../README.md)
