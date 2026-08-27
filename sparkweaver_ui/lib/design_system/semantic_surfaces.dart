import 'package:flutter/material.dart';

import 'colors.dart';
import 'theme.dart';

/// Filled semantic surfaces and the foreground that stays legible on each.
/// Every pairing here clears WCAG AA at 4.5:1 in both themes.
extension SparkweaverSemanticSurfaces on SparkweaverTheme {
  Color get _ink => SparkweaverColors.textPrimary;

  Color get successFill => success;

  Color get errorFill => error;

  Color get warningFill => warning;

  /// Dark mode uses the lighter blue because no foreground clears AA
  /// against [info] itself.
  Color get infoFill => isDark ? infoLight : info;

  Color get onSuccess => isDark ? _ink : SparkweaverColors.white;

  Color get onError => isDark ? _ink : SparkweaverColors.white;

  /// Yellow is too luminous for white in either theme.
  Color get onWarning => _ink;

  Color get onInfo => isDark ? _ink : SparkweaverColors.white;
}
