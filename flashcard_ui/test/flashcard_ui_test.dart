import 'package:flutter_test/flutter_test.dart';
import 'package:flashcard_ui/flashcard_ui.dart';

void main() {
  group('FlashcardColors', () {
    test('should have primary colors defined', () {
      expect(FlashcardColors.primary, isNotNull);
      expect(FlashcardColors.secondary, isNotNull);
    });

    test('should have semantic colors defined', () {
      expect(FlashcardColors.success, isNotNull);
      expect(FlashcardColors.error, isNotNull);
      expect(FlashcardColors.warning, isNotNull);
      expect(FlashcardColors.info, isNotNull);
    });
  });

  group('FlashcardSpacing', () {
    test('should have spacing scale values', () {
      expect(FlashcardSpacing.xs, 4.0);
      expect(FlashcardSpacing.sm, 8.0);
      expect(FlashcardSpacing.md, 12.0);
      expect(FlashcardSpacing.lg, 16.0);
    });
  });

  group('FlashcardTokens', () {
    test('should have border radius values', () {
      expect(FlashcardTokens.radiusSm, 4.0);
      expect(FlashcardTokens.radiusMd, 8.0);
      expect(FlashcardTokens.radiusLg, 12.0);
    });

    test('should have icon size values', () {
      expect(FlashcardTokens.iconSm, 16.0);
      expect(FlashcardTokens.iconMd, 20.0);
      expect(FlashcardTokens.iconLg, 24.0);
    });
  });
}
