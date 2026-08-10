import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  group('SparkweaverColors', () {
    test('should have primary colors defined', () {
      expect(SparkweaverColors.primary, isNotNull);
      expect(SparkweaverColors.secondary, isNotNull);
    });

    test('should have semantic colors defined', () {
      expect(SparkweaverColors.success, isNotNull);
      expect(SparkweaverColors.error, isNotNull);
      expect(SparkweaverColors.warning, isNotNull);
      expect(SparkweaverColors.info, isNotNull);
    });
  });

  group('SparkweaverSpacing', () {
    test('should have spacing scale values', () {
      expect(SparkweaverSpacing.xs, 4.0);
      expect(SparkweaverSpacing.sm, 8.0);
      expect(SparkweaverSpacing.md, 12.0);
      expect(SparkweaverSpacing.lg, 16.0);
    });
  });

  group('SparkweaverTokens', () {
    test('should have border radius values', () {
      expect(SparkweaverTokens.radiusSm, 4.0);
      expect(SparkweaverTokens.radiusMd, 8.0);
      expect(SparkweaverTokens.radiusLg, 12.0);
    });

    test('should have icon size values', () {
      expect(SparkweaverTokens.iconSm, 16.0);
      expect(SparkweaverTokens.iconMd, 20.0);
      expect(SparkweaverTokens.iconLg, 24.0);
    });
  });
}
