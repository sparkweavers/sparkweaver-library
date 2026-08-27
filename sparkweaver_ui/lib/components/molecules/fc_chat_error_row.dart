import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Sparkweaver Chat Error Row Component (Molecule)
///
/// A single inline row for a message list, shown in place of a message
/// that failed to send. Combines an error icon, wrapped message text and
/// a Reconnect action, matching [FcStatusMessage]'s error styling.
///
/// Holds no reference to any chat/app type; the caller supplies the exact
/// text to display and the callback to run on reconnect.
///
/// ## Usage
///
/// ```dart
/// FcChatErrorRow(
///   message: 'Could not reach the server. Tap Reconnect to try again.',
///   isReconnecting: controller.sending,
///   onReconnect: controller.reconnect,
/// )
/// ```
class FcChatErrorRow extends StatelessWidget {
  /// The error message text to display, supplied by the caller.
  final String message;

  /// Callback when the Reconnect button is pressed.
  final VoidCallback onReconnect;

  /// When true, the Reconnect button shows a spinner and ignores presses.
  final bool isReconnecting;

  const FcChatErrorRow({
    super.key,
    required this.message,
    required this.onReconnect,
    this.isReconnecting = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);

    return Container(
      padding: SparkweaverSpacing.edgeInsetsMd,
      decoration: BoxDecoration(
        color: colors.errorLight.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(SparkweaverTokens.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FcIcon(
                Icons.error_outline,
                size: FcIconSize.medium,
                color: colors.error,
              ),
              SparkweaverSpacing.horizontalSpaceMd,
              Expanded(
                child: FcText(
                  message,
                  style: FcTextStyle.bodySmall,
                  color: colors.error,
                ),
              ),
            ],
          ),
          SparkweaverSpacing.verticalSpaceSm,
          Align(
            alignment: Alignment.centerRight,
            child: FcButton(
              label: 'Reconnect',
              icon: Icons.refresh,
              size: FcButtonSize.small,
              isLoading: isReconnecting,
              onPressed: isReconnecting ? null : onReconnect,
            ),
          ),
        ],
      ),
    );
  }
}
