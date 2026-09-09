import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

void main() {
  group('validateNewPasswordLength', () {
    test('rejects a password shorter than minLength', () {
      final result = validateNewPasswordLength(
        'short',
        minLength: 8,
        errorText: 'Too short',
      );
      expect(result, 'Too short');
    });

    test('accepts a password exactly at the minLength boundary', () {
      final result = validateNewPasswordLength(
        '12345678',
        minLength: 8,
        errorText: 'Too short',
      );
      expect(result, isNull);
    });

    test('accepts a password longer than minLength', () {
      final result = validateNewPasswordLength(
        '123456789',
        minLength: 8,
        errorText: 'Too short',
      );
      expect(result, isNull);
    });

    test('rejects an empty password', () {
      final result = validateNewPasswordLength(
        '',
        minLength: 8,
        errorText: 'Too short',
      );
      expect(result, 'Too short');
    });
  });

  group('validatePasswordsMatch', () {
    test('accepts a matching pair', () {
      final result = validatePasswordsMatch(
        'Sparkweaver1',
        'Sparkweaver1',
        errorText: 'Passwords do not match',
      );
      expect(result, isNull);
    });

    test('rejects a mismatched pair', () {
      final result = validatePasswordsMatch(
        'Sparkweaver1',
        'Sparkweaver2',
        errorText: 'Passwords do not match',
      );
      expect(result, 'Passwords do not match');
    });

    test('rejects a mismatch that only differs in case', () {
      final result = validatePasswordsMatch(
        'Sparkweaver1',
        'sparkweaver1',
        errorText: 'Passwords do not match',
      );
      expect(result, 'Passwords do not match');
    });

    test('two empty strings count as a match', () {
      final result = validatePasswordsMatch(
        '',
        '',
        errorText: 'Passwords do not match',
      );
      expect(result, isNull);
    });
  });
}
