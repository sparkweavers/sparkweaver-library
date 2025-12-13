import 'package:flutter/material.dart';
import '../../design_system/colors.dart';
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
    this.size = FlashcardTokens.avatarMd,
  });

  /// Creates a user avatar (green theme)
  factory FcAvatar.user({double? size}) {
    return FcAvatar(
      icon: Icons.person,
      backgroundColor: FlashcardColors.userAvatarBg,
      iconColor: FlashcardColors.secondary,
      size: size ?? FlashcardTokens.avatarMd,
    );
  }

  /// Creates an AI/Assistant avatar (blue theme)
  factory FcAvatar.ai({double? size}) {
    return FcAvatar(
      icon: Icons.smart_toy,
      backgroundColor: FlashcardColors.aiAvatarBg,
      iconColor: FlashcardColors.primary,
      size: size ?? FlashcardTokens.avatarMd,
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
      size: size ?? FlashcardTokens.avatarMd,
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
      child: FcIcon(
        icon,
        size: _getIconSize(),
        color: iconColor,
      ),
    );
  }
}

/// Predefined avatar size variants
class FcAvatarSizes {
  FcAvatarSizes._();

  /// Extra small avatar (16px)
  static const double xs = FlashcardTokens.avatarXs;

  /// Small avatar (24px)
  static const double sm = FlashcardTokens.avatarSm;

  /// Medium avatar (32px) - Default
  static const double md = FlashcardTokens.avatarMd;

  /// Large avatar (40px)
  static const double lg = FlashcardTokens.avatarLg;

  /// Extra large avatar (48px)
  static const double xl = FlashcardTokens.avatarXl;

  /// 2X large avatar (64px)
  static const double xxl = FlashcardTokens.avatarXxl;

  /// 3X large avatar (96px)
  static const double xxxl = FlashcardTokens.avatarXxxl;
}

/// Predefined avatar type variants
class FcAvatarVariants {
  FcAvatarVariants._();

  /// User avatar with default size
  static FcAvatar user({double? size}) => FcAvatar.user(size: size);

  /// User avatar - small
  static FcAvatar userSmall() => FcAvatar.user(size: FcAvatarSizes.sm);

  /// User avatar - large
  static FcAvatar userLarge() => FcAvatar.user(size: FcAvatarSizes.lg);

  /// AI avatar with default size
  static FcAvatar ai({double? size}) => FcAvatar.ai(size: size);

  /// AI avatar - small
  static FcAvatar aiSmall() => FcAvatar.ai(size: FcAvatarSizes.sm);

  /// AI avatar - large
  static FcAvatar aiLarge() => FcAvatar.ai(size: FcAvatarSizes.lg);

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
