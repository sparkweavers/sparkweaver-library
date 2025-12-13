import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Flashcard Empty State Component (Organism)
///
/// Displays an empty state message with icon, title, subtitle, and optional action.
/// Composed from atoms (Icon, Text, Button).
///
/// ## Usage
///
/// ```dart
/// // Basic empty state
/// FcEmptyState(
///   icon: Icons.inbox_outlined,
///   title: 'No messages yet',
///   subtitle: 'Start a conversation to see messages here',
/// )
///
/// // Empty state with action button
/// FcEmptyState(
///   icon: Icons.topic_outlined,
///   title: 'No topics created yet',
///   subtitle: 'Create a topic to organize your documents',
///   actionLabel: 'Create Topic',
///   onAction: () => print('Create topic'),
/// )
///
/// // Custom icon color
/// FcEmptyState(
///   icon: Icons.search_off,
///   iconColor: FlashcardColors.warning,
///   title: 'No results found',
///   subtitle: 'Try adjusting your search',
/// )
/// ```
class FcEmptyState extends StatelessWidget {
  /// Icon to display
  final IconData icon;

  /// Title text
  final String title;

  /// Subtitle text (optional)
  final String? subtitle;

  /// Action button label (optional)
  final String? actionLabel;

  /// Callback when action button is pressed
  final VoidCallback? onAction;

  /// Icon color (defaults to gray)
  final Color? iconColor;

  /// Icon size (defaults to xLarge)
  final FcIconSize iconSize;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  const FcEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionLabel,
    this.onAction,
    this.iconColor,
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
            // Icon
            FcIcon(
              icon,
              size: iconSize,
              color: iconColor ?? FlashcardColors.gray400,
            ),
            const SizedBox(height: 24),

            // Title
            FcText(
              title,
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

            // Action Button
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 24),
              FcButton(
                label: actionLabel,
                onPressed: onAction,
                variant: FcButtonVariant.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
