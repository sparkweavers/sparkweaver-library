# Integration Guide: Using sparkweaver-library in ai-flash-card

This guide shows how to integrate the `sparkweaver_ui` component library into the `ai-flash-card` Flutter application.

## Step 1: Add Dependency

Update `ai-flash-card/pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.6.1
  # ... other dependencies ...

  # Add the component library
  sparkweaver_ui:
    path: ../sparkweaver-library/sparkweaver_ui
```

Then run:

```bash
cd ai-flash-card
flutter pub get
```

## Step 2: Import the Library

In your Dart files, import the component library:

```dart
import 'package:sparkweaver_ui/sparkweaver_ui.dart';
```

## Step 3: Replace Existing Components

### Replace Badge Component

**Before** (`lib/components/badge.dart`):
```dart
import '../components/badge.dart';

Batch(text: filename)
```

**After**:
```dart
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

FcBadge(text: filename, icon: Icons.description)
// or
FcBadgeVariants.file(filename: filename)
```

### Replace Chat Bubble Component

**Before** (`lib/components/chat_bubble.dart`):
```dart
import '../components/chat_bubble.dart';

ChatBubble(
  message: message,
  isUser: isUser,
  referencedFiles: files,
)
```

**After**:
```dart
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

FcChatBubble(
  message: message,
  isUser: isUser,
  referencedFiles: files,
)
```

## Step 4: Use Design System

### Replace Hardcoded Colors

**Before**:
```dart
Container(
  color: Colors.blue.withValues(alpha: 0.1),
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.blue.withValues(alpha: 0.3),
    ),
  ),
)
```

**After**:
```dart
Container(
  color: SparkweaverColors.primary10,
  decoration: BoxDecoration(
    border: Border.all(
      color: SparkweaverColors.primary30,
    ),
  ),
)
```

### Replace Hardcoded Spacing

**Before**:
```dart
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  margin: const EdgeInsets.symmetric(vertical: 4),
)
```

**After**:
```dart
Container(
  padding: FlashcardSpacing.chatBubblePadding,
  margin: FlashcardSpacing.chatBubbleMargin,
)
```

### Replace Hardcoded Text Styles

**Before**:
```dart
Text(
  message,
  style: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ),
)
```

**After**:
```dart
Text(
  message,
  style: FlashcardTypography.bodyMedium,
)
```

### Replace Border Radius

**Before**:
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16),
  ),
)
```

**After**:
```dart
Container(
  decoration: BoxDecoration(
    borderRadius: FlashcardTokens.chatBubbleRadius,
  ),
)
```

## Step 5: Update Specific Files

### File: `lib/components/conversation.dart`

```dart
// Old import
import 'chat_bubble.dart';

// New import
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

// Update usage
ChatBubble(
  message: message.content,
  isUser: message.isUser,
  isTyping: false,
  referencedFiles: message.referencedFiles,
)

// Becomes
FcChatBubble(
  message: message.content,
  isUser: message.isUser,
  isTyping: false,
  referencedFiles: message.referencedFiles,
)
```

### File: `lib/components/file_upload_component.dart`

If using badges to show uploaded files:

```dart
// Old
import 'badge.dart';
Batch(text: filename)

// New
import 'package:sparkweaver_ui/sparkweaver_ui.dart';
FcBadgeVariants.file(filename: filename)
```

## Step 6: Optional - Remove Old Components

After migrating to the component library, you can remove the old component files:

```bash
# Optional: Remove old components (backup first!)
rm lib/components/badge.dart
rm lib/components/chat_bubble.dart
```

## Benefits of Using the Component Library

1. **Consistency**: All components use the same design system
2. **Maintainability**: Update designs in one place
3. **Reusability**: Share components across multiple projects
4. **Documentation**: Complete documentation and examples via Widgetbook
5. **Type Safety**: Strongly typed design tokens
6. **Best Practices**: Components follow SOLID principles

## Testing the Integration

1. Run the app to ensure everything works:
```bash
flutter run --flavor staging
```

2. Test all screens that use the updated components:
   - Chat/Conversation screens
   - File upload screens
   - Any screens showing badges

3. Verify visual consistency across the app

## Troubleshooting

### Import Errors

If you see import errors:
```bash
flutter pub get
flutter clean
flutter pub get
```

### Different Appearance

The new components use the design system colors. If appearance differs:
- Check that you're using the correct color variants
- Adjust `FlashcardColors` in the library if needed
- Use custom parameters to override defaults

### Build Errors

If you encounter build errors:
1. Ensure `sparkweaver_ui` package builds successfully:
   ```bash
   cd sparkweaver-library/sparkweaver_ui
   flutter analyze
   ```

2. Clear build cache:
   ```bash
   cd ai-flash-card
   flutter clean
   flutter pub get
   ```

## Customizing the Design System

If you need to customize colors or other tokens:

1. Fork or modify `sparkweaver_ui/lib/design_system/colors.dart`
2. Update the values to match your brand
3. The changes will apply to all components automatically

## Next Steps

1. **Explore Widgetbook**: Run the Widgetbook app to see all components
   ```bash
   cd sparkweaver-library/flashcard_ui_widgetbook
   flutter run
   ```

2. **Add More Components**: Extract additional components from ai-flash-card into the library

3. **Create Variants**: Add component variants for different use cases

4. **Share**: Use the same component library in other Flashcard-related projects

## Support

For questions or issues:
- Check the [main README](README.md)
- Review component documentation in Widgetbook
- Examine use case examples in `flashcard_ui_widgetbook/lib/usecases/`

---

Happy coding! 🎉
