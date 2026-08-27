import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

enum FcBannerVariant { success, error, warning, info }

/// Full-width message banner, shown through
/// `ScaffoldMessenger.of(context).showMaterialBanner`.
class FcBanner extends MaterialBanner {
  final String message;
  final FcBannerVariant variant;
  final VoidCallback? onDismiss;

  /// [MaterialBanner.backgroundColor] is fixed at construction, so every
  /// factory takes the caller's context to resolve the themed colours.
  FcBanner._({
    required this.message,
    required this.variant,
    required BuildContext context,
    this.onDismiss,
    super.key,
  }) : super(
         content: _BannerContent(message: message, variant: variant),
         backgroundColor: _getBackgroundColor(
           SparkweaverTheme.of(context),
           variant,
         ),
         actions: [
           if (onDismiss != null)
             TextButton(
               onPressed: onDismiss,
               child: Text(
                 'Dismiss',
                 style: SparkweaverTypography.labelMedium.copyWith(
                   color: _getForegroundColor(
                     SparkweaverTheme.of(context),
                     variant,
                   ),
                 ),
               ),
             ),
         ],
       );

  /// Create an error banner (red)
  factory FcBanner.error({
    required BuildContext context,
    required String message,
    VoidCallback? onDismiss,
    Key? key,
  }) {
    return FcBanner._(
      message: message,
      variant: FcBannerVariant.error,
      context: context,
      onDismiss: onDismiss,
      key: key,
    );
  }

  /// Create a success banner (green)
  factory FcBanner.success({
    required BuildContext context,
    required String message,
    VoidCallback? onDismiss,
    Key? key,
  }) {
    return FcBanner._(
      message: message,
      variant: FcBannerVariant.success,
      context: context,
      onDismiss: onDismiss,
      key: key,
    );
  }

  /// Create a warning banner (orange)
  factory FcBanner.warning({
    required BuildContext context,
    required String message,
    VoidCallback? onDismiss,
    Key? key,
  }) {
    return FcBanner._(
      message: message,
      variant: FcBannerVariant.warning,
      context: context,
      onDismiss: onDismiss,
      key: key,
    );
  }

  /// Create an info banner (blue)
  factory FcBanner.info({
    required BuildContext context,
    required String message,
    VoidCallback? onDismiss,
    Key? key,
  }) {
    return FcBanner._(
      message: message,
      variant: FcBannerVariant.info,
      context: context,
      onDismiss: onDismiss,
      key: key,
    );
  }

  static Color _getBackgroundColor(
    SparkweaverTheme colors,
    FcBannerVariant variant,
  ) {
    switch (variant) {
      case FcBannerVariant.success:
        return colors.successFill;
      case FcBannerVariant.error:
        return colors.errorFill;
      case FcBannerVariant.warning:
        return colors.warningFill;
      case FcBannerVariant.info:
        return colors.infoFill;
    }
  }

  /// Icon and text colour that stays legible on [_getBackgroundColor].
  static Color _getForegroundColor(
    SparkweaverTheme colors,
    FcBannerVariant variant,
  ) {
    switch (variant) {
      case FcBannerVariant.success:
        return colors.onSuccess;
      case FcBannerVariant.error:
        return colors.onError;
      case FcBannerVariant.warning:
        return colors.onWarning;
      case FcBannerVariant.info:
        return colors.onInfo;
    }
  }
}

/// Internal banner content widget
class _BannerContent extends StatelessWidget {
  final String message;
  final FcBannerVariant variant;

  const _BannerContent({required this.message, required this.variant});

  IconData _getIcon() {
    switch (variant) {
      case FcBannerVariant.success:
        return Icons.check_circle_outline;
      case FcBannerVariant.error:
        return Icons.error_outline;
      case FcBannerVariant.warning:
        return Icons.warning_amber_outlined;
      case FcBannerVariant.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final foreground = FcBanner._getForegroundColor(
      SparkweaverTheme.of(context),
      variant,
    );
    return Row(
      children: [
        FcIcon(_getIcon(), size: FcIconSize.medium, color: foreground),
        const SizedBox(width: 12),
        Expanded(
          child: FcText(
            message,
            style: FcTextStyle.bodyMedium,
            color: foreground,
          ),
        ),
      ],
    );
  }
}
