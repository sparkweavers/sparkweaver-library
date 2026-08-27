import 'package:flutter_test/flutter_test.dart';
import 'package:sparkweaver_ui/sparkweaver_ui.dart';

import '../helpers/contrast.dart';

void main() {
  const aa = 4.5;

  group('semantic surfaces', () {
    for (final colors in [SparkweaverTheme.light(), SparkweaverTheme.dark()]) {
      final theme = colors.isDark ? 'dark' : 'light';

      test('$theme success fill carries its foreground at AA', () {
        expect(
          contrastRatio(colors.successFill, colors.onSuccess),
          greaterThanOrEqualTo(aa),
        );
      });

      test('$theme error fill carries its foreground at AA', () {
        expect(
          contrastRatio(colors.errorFill, colors.onError),
          greaterThanOrEqualTo(aa),
        );
      });

      test('$theme warning fill carries its foreground at AA', () {
        expect(
          contrastRatio(colors.warningFill, colors.onWarning),
          greaterThanOrEqualTo(aa),
        );
      });

      test('$theme info fill carries its foreground at AA', () {
        expect(
          contrastRatio(colors.infoFill, colors.onInfo),
          greaterThanOrEqualTo(aa),
        );
      });

      test('$theme warning fill fails against white', () {
        expect(
          contrastRatio(colors.warningFill, SparkweaverColors.white),
          lessThan(aa),
        );
      });
    }
  });
}
