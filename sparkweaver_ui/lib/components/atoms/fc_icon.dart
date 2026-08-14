import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Icon Size variants
enum FcIconSize {
  /// Small icon - 14px
  small,

  /// Medium icon - 20px
  medium,

  /// Large icon - 24px
  large,

  /// Extra large icon - 32px
  xLarge,

  /// 2X large icon - 48px
  xxLarge,
}

/// Semantic icon variants for common use cases
enum FcIconVariant {
  /// Default variant
  defaultIcon,

  /// Success variant (green)
  success,

  /// Error variant (red)
  error,

  /// Warning variant (orange)
  warning,

  /// Info variant (blue)
  info,
}

/// Sparkweaver Icon Component (Atom)
///
/// A reusable icon component with consistent sizing and semantic variants.
///
/// ## Usage
///
/// ```dart
/// // Basic icon
/// FcIcon(Icons.home)
///
/// // Sized icon
/// FcIcon(Icons.check, size: FcIconSize.large)
///
/// // Semantic variant
/// FcIcon(Icons.check_circle, variant: FcIconVariant.success)
///
/// // Custom color
/// FcIcon(Icons.star, color: Colors.yellow)
/// ```
class FcIcon extends StatelessWidget {
  /// The icon data to display
  final IconData icon;

  /// Size variant of the icon
  final FcIconSize size;

  /// Semantic variant (overrides color if provided)
  final FcIconVariant variant;

  /// Custom color (ignored if variant is not defaultIcon)
  final Color? color;

  /// Semantic label for accessibility
  final String? semanticLabel;

  const FcIcon(
    this.icon, {
    super.key,
    this.size = FcIconSize.medium,
    this.variant = FcIconVariant.defaultIcon,
    this.color,
    this.semanticLabel,
  });

  double _getSizeValue() {
    switch (size) {
      // The only size with no matching token; iconXs is 12 and iconSm is 16.
      case FcIconSize.small:
        return 14.0;
      case FcIconSize.medium:
        return SparkweaverTokens.iconMd;
      case FcIconSize.large:
        return SparkweaverTokens.iconLg;
      case FcIconSize.xLarge:
        return SparkweaverTokens.iconXl;
      case FcIconSize.xxLarge:
        return SparkweaverTokens.iconXxl;
    }
  }

  Color _getColor(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    // If variant is specified, use semantic colors
    switch (variant) {
      case FcIconVariant.success:
        return colors.success;
      case FcIconVariant.error:
        return colors.error;
      case FcIconVariant.warning:
        return colors.warning;
      case FcIconVariant.info:
        return colors.info;
      case FcIconVariant.defaultIcon:
        // Use custom color or default to text primary
        return color ?? colors.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: _getSizeValue(),
      color: _getColor(context),
      semanticLabel: semanticLabel,
    );
  }
}
