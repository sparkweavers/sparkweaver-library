import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Flashcard Error State Component (Organism)
///
/// Displays an error state with icon, error message, and retry action.
/// Composed from atoms (Icon, Text, Button).
///
/// ## Usage
///
/// ```dart
/// // Basic error state
/// FcErrorState(
///   message: 'Failed to load data',
///   onRetry: () => print('Retry'),
/// )
///
/// // Error with custom message
/// FcErrorState(
///   message: 'Network connection failed',
///   subtitle: 'Please check your internet connection',
///   onRetry: () => print('Retry'),
/// )
///
/// // Error without retry button
/// FcErrorState(
///   message: 'An error occurred',
///   subtitle: 'Please contact support',
/// )
/// ```
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

  const FcErrorState({
    super.key,
    required this.message,
    this.subtitle,
    this.onRetry,
    this.retryLabel = 'Retry',
    this.icon,
    this.iconSize = FcIconSize.xLarge,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
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
              color: FlashcardColors.error,
            ),
            const SizedBox(height: 24),

            // Error Message
            FcText(
              message,
              style: FcTextStyle.heading4,
              textAlign: TextAlign.center,
              color: FlashcardColors.textPrimary,
            ),

            // Subtitle
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              FcText(
                subtitle!,
                style: FcTextStyle.bodyMedium,
                textAlign: TextAlign.center,
                color: FlashcardColors.textSecondary,
              ),
            ],

            // Retry Button
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              FcButton(
                label: retryLabel,
                onPressed: onRetry,
                variant: FcButtonVariant.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
