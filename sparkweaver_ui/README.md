# Sparkweaver UI

A comprehensive Flutter UI component library with a complete design system for building Sparkweaver applications.

## Features

- **Complete Design System**: Colors, Typography, Spacing, and Design Tokens
- **Reusable Components**: Pre-built UI components
- **SOLID Principles**: Clean architecture and best practices
- **Fully Typed**: Type-safe with comprehensive documentation

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  sparkweaver_ui:
    git:
      url: git@github.com:Job-O-Matic/sparkweaver-library.git
      ref: v0.1.0
      path: sparkweaver_ui
```

## Usage

```dart
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

// Use design system
Container(
  color: SparkweaverColors.primary,
  padding: SparkweaverSpacing.edgeInsetsLg,
  child: Text(
    'Hello',
    style: SparkweaverTypography.heading1,
  ),
)

// Use components
FcChatBubble(
  message: 'Hello!',
  isUser: true,
)
```

## Design System

### Colors

```dart
SparkweaverColors.primary
SparkweaverColors.secondary
SparkweaverColors.success
SparkweaverColors.error
SparkweaverColors.textPrimary
// ... and many more
```

### Typography

```dart
SparkweaverTypography.heading1
SparkweaverTypography.bodyMedium
SparkweaverTypography.button
// ... and many more
```

### Spacing

```dart
SparkweaverSpacing.edgeInsetsLg
SparkweaverSpacing.verticalSpaceMd
SparkweaverSpacing.horizontalSpaceSm
// ... and many more
```

### Design Tokens

```dart
SparkweaverTokens.cardRadius
SparkweaverTokens.shadowMd
SparkweaverTokens.iconLg
SparkweaverTokens.durationNormal
// ... and many more
```

## Components

### FcBadge

```dart
FcBadge(text: 'label', icon: Icons.star)
FcBadgeVariants.primary(text: 'Primary')
FcBadgeVariants.file(filename: 'document.pdf')
```

### FcChatBubble

```dart
FcChatBubble(
  message: 'Hello',
  isUser: true,
)

FcChatBubbleVariants.ai(
  message: 'Response',
  referencedFiles: ['file.pdf'],
)
```

## Documentation

See the main [README](../README.md) for complete documentation.

## License

Part of the Sparkweaver application suite.
