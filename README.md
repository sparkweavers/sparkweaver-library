# Sparkweaver Library

---
[![Release sparkweaver_ui](https://github.com/sparkweavers/sparkweaver-library/actions/workflows/release-sparkweaver-ui.yml/badge.svg)](https://github.com/sparkweavers/sparkweaver-library/actions/workflows/release-sparkweaver-ui.yml)
---

Flutter UI component library with design system and interactive Widgetbook showcase for Sparkweaver applications.

## Quick Start

```bash
# Install dependencies
cd sparkweaver_ui && flutter pub get

# View components in Widgetbook
cd sparkweaver_widgetbook && flutter pub get && flutter run
```

## Usage

```yaml
# Add to pubspec.yaml
dependencies:
  sparkweaver_ui:
    git:
      url: git@github.com:sparkweavers/sparkweaver-library.git
      ref: v0.1.0
      path: sparkweaver_ui
```

```dart
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

// Use design system
Container(
  color: SparkweaverColors.primary,
  padding: SparkweaverSpacing.edgeInsetsLg,
  child: Text('Hello', style: SparkweaverTypography.heading1),
)

// Use components
FcChatBubble(message: 'Hello!', isUser: true)
FcBadge(text: 'Label', icon: Icons.star)
```
