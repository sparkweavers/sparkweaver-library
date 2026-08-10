import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Sparkweaver Reconnect Prompt Component (Organism)
///
/// Displays a persistent prompt for live/streaming features (e.g. chat,
/// voice) when a transport connection has dropped. Shows an icon, a
/// title, an optional subtitle, and a reconnect action button with a
/// built-in loading state.
///
/// Composed from atoms (Icon, Text, Button) and design-system tokens.
///
/// ## Usage
///
/// ```dart
/// FcReconnectPrompt(
///   subtitle: 'The connection to the AI service was lost.',
///   isReconnecting: _isReconnecting,
///   onReconnect: _reconnect,
/// )
/// ```
class FcReconnectPrompt extends StatelessWidget {
  /// Primary message.
  final String title;

  /// Optional explanatory text below the title.
  final String? subtitle;

  /// Icon shown above the title.
  final IconData icon;

  /// Reconnect button label.
  final String buttonLabel;

  /// Callback when the reconnect button is pressed.
  final VoidCallback onReconnect;

  /// When true, the button shows a spinner and ignores presses.
  final bool isReconnecting;

  /// Padding around the prompt content.
  final EdgeInsetsGeometry padding;

  const FcReconnectPrompt({
    super.key,
    this.title = 'Disconnected',
    this.subtitle,
    this.icon = Icons.cloud_off,
    this.buttonLabel = 'Reconnect',
    required this.onReconnect,
    this.isReconnecting = false,
    this.padding = SparkweaverSpacing.edgeInsetsLg,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FcIcon(icon, size: FcIconSize.xLarge, color: colors.error),
          SparkweaverSpacing.verticalSpaceSm,
          FcText(
            title,
            style: FcTextStyle.heading5,
            textAlign: TextAlign.center,
            color: colors.textPrimary,
          ),
          if (subtitle != null) ...[
            SparkweaverSpacing.verticalSpaceXs,
            FcText(
              subtitle!,
              style: FcTextStyle.bodySmall,
              textAlign: TextAlign.center,
              color: colors.textSecondary,
            ),
          ],
          SparkweaverSpacing.verticalSpaceMd,
          FcButton(
            label: buttonLabel,
            icon: Icons.refresh,
            isLoading: isReconnecting,
            onPressed: isReconnecting ? null : onReconnect,
          ),
        ],
      ),
    );
  }
}
