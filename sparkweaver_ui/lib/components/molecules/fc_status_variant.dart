import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// The four meanings a status surface can carry, shared by every
/// component that reports an outcome to the user.
enum FcStatusVariant { success, error, warning, info }

/// Solid treatment, for surfaces that sit on their own fill.
/// Components that tint instead, such as `FcStatusMessage`, resolve their own.
extension FcStatusVariantStyle on FcStatusVariant {
  IconData get icon => switch (this) {
    FcStatusVariant.success => Icons.check_circle_outline,
    FcStatusVariant.error => Icons.error_outline,
    FcStatusVariant.warning => Icons.warning_amber_outlined,
    FcStatusVariant.info => Icons.info_outline,
  };

  Color fill(SparkweaverTheme colors) => switch (this) {
    FcStatusVariant.success => colors.successFill,
    FcStatusVariant.error => colors.errorFill,
    FcStatusVariant.warning => colors.warningFill,
    FcStatusVariant.info => colors.infoFill,
  };

  /// Icon and text colour that stays legible on [fill].
  Color onFill(SparkweaverTheme colors) => switch (this) {
    FcStatusVariant.success => colors.onSuccess,
    FcStatusVariant.error => colors.onError,
    FcStatusVariant.warning => colors.onWarning,
    FcStatusVariant.info => colors.onInfo,
  };
}
