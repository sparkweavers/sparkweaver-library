import 'package:flutter/material.dart';
import '../../design_system/theme.dart';
import '../../design_system/tokens.dart';
import 'fc_icon.dart';

/// A reusable avatar component for user and AI representations
///
/// This component follows the Single Responsibility Principle (SRP)
/// by focusing solely on rendering an avatar with icon.
///
/// Usage:
/// ```dart
/// // User avatar
/// FcAvatar.user()
///
/// // AI avatar
/// FcAvatar.ai()
///
/// // Custom avatar
/// FcAvatar(
///   icon: Icons.star,
///   backgroundColor: Colors.purple,
///   iconColor: Colors.white,
///   size: 32,
/// )
/// ```
class FcAvatar extends StatelessWidget {
  /// The icon to display in the avatar
  final IconData icon;

  /// Avatar background color
  final Color backgroundColor;

  /// Icon color
  final Color iconColor;

  /// Avatar size (radius will be size / 2)
  final double size;

  const FcAvatar({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.size = SparkweaverTokens.avatarMd,
  });

  /// Creates a user avatar (green theme)
  factory FcAvatar.user({double? size, required BuildContext context}) {
    final colors = SparkweaverTheme.of(context);
    return FcAvatar(
      icon: Icons.person,
      backgroundColor: colors.userAvatarBg,
      iconColor: colors.secondary,
      size: size ?? SparkweaverTokens.avatarMd,
    );
  }

  /// Creates an AI/Assistant avatar (blue theme)
  factory FcAvatar.ai({double? size, required BuildContext context}) {
    final colors = SparkweaverTheme.of(context);
    return FcAvatar(
      icon: Icons.smart_toy,
      backgroundColor: colors.aiAvatarBg,
      iconColor: colors.primary,
      size: size ?? SparkweaverTokens.avatarMd,
    );
  }

  /// Creates a custom avatar with specified properties
  factory FcAvatar.custom({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    double? size,
  }) {
    return FcAvatar(
      icon: icon,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      size: size ?? SparkweaverTokens.avatarMd,
    );
  }

  /// Map avatar size to FcIconSize
  FcIconSize _getIconSize() {
    final iconSize = size / 2;
    if (iconSize <= 14) return FcIconSize.small;
    if (iconSize <= 20) return FcIconSize.medium;
    if (iconSize <= 24) return FcIconSize.large;
    return FcIconSize.xLarge;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor,
      child: FcIcon(icon, size: _getIconSize(), color: iconColor),
    );
  }
}

/// Predefined avatar size variants
class FcAvatarSizes {
  FcAvatarSizes._();

  /// Extra small avatar (16px)
  static const double xs = SparkweaverTokens.avatarXs;

  /// Small avatar (24px)
  static const double sm = SparkweaverTokens.avatarSm;

  /// Medium avatar (32px) - Default
  static const double md = SparkweaverTokens.avatarMd;

  /// Large avatar (40px)
  static const double lg = SparkweaverTokens.avatarLg;

  /// Extra large avatar (48px)
  static const double xl = SparkweaverTokens.avatarXl;

  /// 2X large avatar (64px)
  static const double xxl = SparkweaverTokens.avatarXxl;

  /// 3X large avatar (96px)
  static const double xxxl = SparkweaverTokens.avatarXxxl;
}

/// Predefined avatar type variants
class FcAvatarVariants {
  FcAvatarVariants._();

  /// User avatar with default size
  static FcAvatar user({double? size, required BuildContext context}) =>
      FcAvatar.user(size: size, context: context);

  /// User avatar - small
  static FcAvatar userSmall({required BuildContext context}) =>
      FcAvatar.user(size: FcAvatarSizes.sm, context: context);

  /// User avatar - large
  static FcAvatar userLarge({required BuildContext context}) =>
      FcAvatar.user(size: FcAvatarSizes.lg, context: context);

  /// AI avatar with default size
  static FcAvatar ai({double? size, required BuildContext context}) =>
      FcAvatar.ai(size: size, context: context);

  /// AI avatar - small
  static FcAvatar aiSmall({required BuildContext context}) =>
      FcAvatar.ai(size: FcAvatarSizes.sm, context: context);

  /// AI avatar - large
  static FcAvatar aiLarge({required BuildContext context}) =>
      FcAvatar.ai(size: FcAvatarSizes.lg, context: context);

  /// Custom avatar
  static FcAvatar custom({
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    double? size,
  }) {
    return FcAvatar.custom(
      icon: icon,
      backgroundColor: backgroundColor,
      iconColor: iconColor,
      size: size,
    );
  }
}
