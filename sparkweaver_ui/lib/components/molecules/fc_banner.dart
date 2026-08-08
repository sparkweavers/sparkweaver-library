import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Banner Variant
enum FcBannerVariant {
  /// Success banner (green)
  success,

  /// Error banner (red)
  error,

  /// Warning banner (orange)
  warning,

  /// Info banner (blue)
  info,
}

/// Flashcard Banner Component (Molecule)
///
/// A full-width banner for displaying important messages at the top of the screen.
/// Similar to MaterialBanner but using Flashcard UI design system.
///
/// ## Usage
///
/// ```dart
/// // Show error banner
/// ScaffoldMessenger.of(context).showMaterialBanner(
///   FcBanner.error(
///     context: context,
///     message: 'Failed to connect to server',
///     onDismiss: () {
///       ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
///     },
///   ),
/// );
///
/// // Show success banner
/// ScaffoldMessenger.of(context).showMaterialBanner(
///   FcBanner.success(
///     context: context,
///     message: 'Changes saved successfully',
///     autoDismiss: true,
///     onDismiss: () {
///       ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
///     },
///   ),
/// );
///
/// // Show warning banner
/// ScaffoldMessenger.of(context).showMaterialBanner(
///   FcBanner.warning(
///     context: context,
///     message: 'This action cannot be undone',
///   ),
/// );
/// ```
class FcBanner extends MaterialBanner {
  /// The banner message text
  final String message;

  /// Banner variant (determines color and icon)
  final FcBannerVariant variant;

  /// Callback when dismiss button is pressed
  final VoidCallback? onDismiss;

  /// [MaterialBanner.backgroundColor] is set once at construction time,
  /// before the banner is ever laid out — there is no `build(context)`
  /// to hook into here the way there is for a plain [StatelessWidget].
  /// So every factory takes the caller's [BuildContext] and resolves the
  /// themed variant colour up front, via [FlashcardColorScheme.of]. The
  /// call site already has one on hand: it's the same context used for
  /// `ScaffoldMessenger.of(context)`.
  FcBanner._({
    required this.message,
    required this.variant,
    required BuildContext context,
    this.onDismiss,
    super.key,
  }) : super(
         content: _BannerContent(message: message, variant: variant),
         backgroundColor: _getBackgroundColor(
           FlashcardColorScheme.of(context),
           variant,
         ),
         actions: [
           if (onDismiss != null)
             TextButton(
               onPressed: onDismiss,
               child: Text(
                 'Dismiss',
                 // White stays literal: it is the foreground for a
                 // filled, saturated banner background in both themes,
                 // not a surface colour that should track brightness.
                 style: FlashcardTypography.labelMedium.copyWith(
                   color: SparkweaverColors.white,
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

  /// Get background color for variant
  static Color _getBackgroundColor(
    FlashcardColorScheme colors,
    FcBannerVariant variant,
  ) {
    switch (variant) {
      case FcBannerVariant.success:
        return colors.success;
      case FcBannerVariant.error:
        return colors.error;
      case FcBannerVariant.warning:
        return colors.warning;
      case FcBannerVariant.info:
        return colors.info;
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
    return Row(
      children: [
        FcIcon(
          _getIcon(),
          size: FcIconSize.medium,
          color: SparkweaverColors.white,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FcText(
            message,
            style: FcTextStyle.bodyMedium,
            color: SparkweaverColors.white,
          ),
        ),
      ],
    );
  }
}
