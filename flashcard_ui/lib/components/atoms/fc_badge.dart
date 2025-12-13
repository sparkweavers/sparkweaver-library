import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
import '../../design_system/spacing.dart';
import '../../design_system/tokens.dart';
import '../../design_system/typography.dart';

/// A reusable badge component for displaying labeled content
///
/// This component follows the Single Responsibility Principle (SRP)
/// by focusing solely on rendering a badge UI element.
///
/// Usage:
/// ```dart
/// FcBadge(text: 'document.pdf')
/// FcBadge(
///   text: 'Premium',
///   icon: Icons.star,
///   color: FlashcardColors.warning,
/// )
/// ```
class FcBadge extends StatelessWidget {
  /// The text to display in the badge
  final String text;

  /// Optional icon to display before the text
  final IconData? icon;

  /// Badge background color (defaults to primary color with 10% opacity)
  final Color? backgroundColor;

  /// Badge border color (defaults to primary color with 20% opacity)
  final Color? borderColor;

  /// Text and icon color (defaults to primary color)
  final Color? foregroundColor;

  /// Icon size (defaults to 14px)
  final double? iconSize;

  /// Custom padding (defaults to design system badge padding)
  final EdgeInsetsGeometry? padding;

  const FcBadge({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.iconSize,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? FlashcardColors.primary10;
    final fgColor = foregroundColor ?? FlashcardColors.primary;
    final bdColor = borderColor ?? FlashcardColors.primary20;

    return Container(
      padding: padding ?? FlashcardSpacing.badgePadding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: FlashcardTokens.badgeRadius,
        border: Border.all(color: bdColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: iconSize ?? FlashcardTokens.iconXs,
              color: fgColor,
            ),
            FlashcardSpacing.horizontalSpaceXs,
          ],
          Text(
            text,
            style: FlashcardTypography.badge.copyWith(
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }
}

/// Predefined badge variants for common use cases
class FcBadgeVariants {
  FcBadgeVariants._();

  /// Primary badge (blue theme)
  static FcBadge primary({required String text, IconData? icon}) {
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: FlashcardColors.primary10,
      borderColor: FlashcardColors.primary20,
      foregroundColor: FlashcardColors.primary,
    );
  }

  /// Success badge (green theme)
  static FcBadge success({required String text, IconData? icon}) {
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: FlashcardColors.successLight.withValues(alpha: 0.1),
      borderColor: FlashcardColors.successLight.withValues(alpha: 0.2),
      foregroundColor: FlashcardColors.success,
    );
  }

  /// Warning badge (orange theme)
  static FcBadge warning({required String text, IconData? icon}) {
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: FlashcardColors.warningLight.withValues(alpha: 0.1),
      borderColor: FlashcardColors.warningLight.withValues(alpha: 0.2),
      foregroundColor: FlashcardColors.warning,
    );
  }

  /// Error badge (red theme)
  static FcBadge error({required String text, IconData? icon}) {
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: FlashcardColors.errorLight.withValues(alpha: 0.1),
      borderColor: FlashcardColors.errorLight.withValues(alpha: 0.2),
      foregroundColor: FlashcardColors.error,
    );
  }

  /// Info badge (blue theme)
  static FcBadge info({required String text, IconData? icon}) {
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: FlashcardColors.infoLight.withValues(alpha: 0.1),
      borderColor: FlashcardColors.infoLight.withValues(alpha: 0.2),
      foregroundColor: FlashcardColors.info,
    );
  }

  /// Neutral badge (gray theme)
  static FcBadge neutral({required String text, IconData? icon}) {
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: FlashcardColors.gray100,
      borderColor: FlashcardColors.gray200,
      foregroundColor: FlashcardColors.gray700,
    );
  }

  /// File badge (document icon with primary theme)
  static FcBadge file({required String filename}) {
    return FcBadge(
      text: filename,
      icon: Icons.description,
      backgroundColor: FlashcardColors.primary10,
      borderColor: FlashcardColors.primary20,
      foregroundColor: FlashcardColors.primary,
    );
  }
}
