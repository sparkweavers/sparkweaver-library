import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';
import 'fc_status_variant.dart';

/// Full-width message banner, shown through
/// `ScaffoldMessenger.of(context).showMaterialBanner`.
class FcBanner extends MaterialBanner {
  final String message;
  final FcStatusVariant variant;
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
         backgroundColor: variant.fill(SparkweaverTheme.of(context)),
         actions: [
           if (onDismiss != null)
             TextButton(
               onPressed: onDismiss,
               child: Text(
                 'Dismiss',
                 style: SparkweaverTypography.labelMedium.copyWith(
                   color: variant.onFill(SparkweaverTheme.of(context)),
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
      variant: FcStatusVariant.error,
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
      variant: FcStatusVariant.success,
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
      variant: FcStatusVariant.warning,
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
      variant: FcStatusVariant.info,
      context: context,
      onDismiss: onDismiss,
      key: key,
    );
  }
}

/// Internal banner content widget
class _BannerContent extends StatelessWidget {
  final String message;
  final FcStatusVariant variant;

  const _BannerContent({required this.message, required this.variant});

  @override
  Widget build(BuildContext context) {
    final foreground = variant.onFill(SparkweaverTheme.of(context));
    return Row(
      children: [
        FcIcon(variant.icon, size: FcIconSize.medium, color: foreground),
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
