import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Displays an error state with icon, message, and an optional retry action.
/// The sole error component in this library; do not add a sibling for a narrower case.
class FcErrorState extends StatelessWidget {
  /// Error message
  final String message;

  /// Additional subtitle/details (optional)
  final String? subtitle;

  /// Callback when retry button is pressed
  final VoidCallback? onRetry;

  /// Retry button label (defaults to 'Retry')
  final String retryLabel;

  /// Icon to display (defaults to error icon)
  final IconData? icon;

  /// Icon size (defaults to xLarge)
  final FcIconSize iconSize;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  /// When true, the retry button shows a spinner and ignores presses.
  final bool isRetrying;

  const FcErrorState({
    super.key,
    required this.message,
    this.subtitle,
    this.onRetry,
    this.retryLabel = 'Retry',
    this.icon,
    this.iconSize = FcIconSize.xLarge,
    this.padding,
    this.isRetrying = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return Center(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error Icon
            FcIcon(
              icon ?? Icons.error_outline,
              size: iconSize,
              color: colors.error,
            ),
            const SizedBox(height: 24),

            // Error Message
            FcText(
              message,
              style: FcTextStyle.heading4,
              textAlign: TextAlign.center,
              color: colors.textPrimary,
            ),

            // Subtitle
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              FcText(
                subtitle!,
                style: FcTextStyle.bodyMedium,
                textAlign: TextAlign.center,
                color: colors.textSecondary,
              ),
            ],

            // Retry Button
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FcButton(
                label: retryLabel,
                onPressed: isRetrying ? null : onRetry,
                variant: FcButtonVariant.primary,
                isLoading: isRetrying,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
