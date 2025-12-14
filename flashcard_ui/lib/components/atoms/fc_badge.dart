import 'package:flutter/material.dart';
import '../../design_system/color_scheme.dart';
import '../../design_system/spacing.dart';
import '../../design_system/tokens.dart';
import '../../design_system/typography.dart';
import 'fc_icon.dart';

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

  /// Whether the badge is closeable (shows close icon)
  final bool closeable;

  /// Callback when close icon is pressed
  final VoidCallback? onClose;

  const FcBadge({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.foregroundColor,
    this.iconSize,
    this.padding,
    this.closeable = false,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    final bgColor = backgroundColor ?? colors.primary10;
    final fgColor = foregroundColor ?? colors.primary;
    final bdColor = borderColor ?? colors.primary20;

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
            FcIcon(
              icon!,
              size: FcIconSize.small,
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
          if (closeable && onClose != null) ...[
            FlashcardSpacing.horizontalSpaceXs,
            GestureDetector(
              onTap: onClose,
              child: FcIcon(
                Icons.close,
                size: FcIconSize.small,
                color: fgColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Predefined badge variants for common use cases
class FcBadgeVariants {
  FcBadgeVariants._();

  /// Primary badge (blue theme)
  static Widget primary({required String text, IconData? icon, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: colors.primary10,
      borderColor: colors.primary20,
      foregroundColor: colors.primary,
    );
  }

  /// Success badge (green theme)
  static Widget success({required String text, IconData? icon, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: colors.successLight.withValues(alpha: 0.1),
      borderColor: colors.successLight.withValues(alpha: 0.2),
      foregroundColor: colors.success,
    );
  }

  /// Warning badge (orange theme)
  static Widget warning({required String text, IconData? icon, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: colors.warningLight.withValues(alpha: 0.1),
      borderColor: colors.warningLight.withValues(alpha: 0.2),
      foregroundColor: colors.warning,
    );
  }

  /// Error badge (red theme)
  static Widget error({required String text, IconData? icon, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: colors.errorLight.withValues(alpha: 0.1),
      borderColor: colors.errorLight.withValues(alpha: 0.2),
      foregroundColor: colors.error,
    );
  }

  /// Info badge (blue theme)
  static Widget info({required String text, IconData? icon, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: colors.infoLight.withValues(alpha: 0.1),
      borderColor: colors.infoLight.withValues(alpha: 0.2),
      foregroundColor: colors.info,
    );
  }

  /// Neutral badge (gray theme)
  static Widget neutral({required String text, IconData? icon, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: text,
      icon: icon,
      backgroundColor: colors.gray100,
      borderColor: colors.gray200,
      foregroundColor: colors.gray700,
    );
  }

  /// File badge (document icon with primary theme)
  static Widget file({required String filename, required BuildContext context}) {
    final colors = FlashcardColorScheme.of(context);
    return FcBadge(
      text: filename,
      icon: Icons.description,
      backgroundColor: colors.primary10,
      borderColor: colors.primary20,
      foregroundColor: colors.primary,
    );
  }
}
