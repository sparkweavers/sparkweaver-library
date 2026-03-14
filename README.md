# Flashcard Component Library

---
[![Release flashcard_ui](https://github.com/Job-O-Matic/flashcard-component-library/actions/workflows/release-flashcard-ui.yml/badge.svg)](https://github.com/Job-O-Matic/flashcard-component-library/actions/workflows/release-flashcard-ui.yml)
---

Flutter UI component library with design system and interactive Widgetbook showcase for Flashcard applications.

## Quick Start

```bash
# Install dependencies
cd flashcard_ui && flutter pub get

# View components in Widgetbook
cd flashcard_ui_widgetbook && flutter pub get && flutter run
```

## Documentation

- [Design System & Components](docs/DESIGN_SYSTEM.md)
- [Integration Guide](docs/INTEGRATION_GUIDE.md)
- [Project Summary](docs/PROJECT_SUMMARY.md)
- [Development Guidelines](CLAUDE.md)

## Usage

```yaml
# Add to pubspec.yaml
dependencies:
  flashcard_ui:
    git:
      url: git@github.com:Job-O-Matic/flashcard-component-library.git
      ref: v0.1.0
      path: flashcard_ui
```

```dart
import 'package:flashcard_ui/flashcard_ui.dart';

// Use design system
Container(
  color: SparkweaverColors.primary,
  padding: FlashcardSpacing.edgeInsetsLg,
  child: Text('Hello', style: FlashcardTypography.heading1),
)

// Use components
FcChatBubble(message: 'Hello!', isUser: true)
FcBadge(text: 'Label', icon: Icons.star)
```
