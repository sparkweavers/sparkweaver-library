import 'package:flutter/material.dart';

import '../../design_system/spacing.dart';
import '../../design_system/theme.dart';
import '../../design_system/tokens.dart';
import '../atoms/fc_text.dart';

/// A fixed `Scaffold.bottomNavigationBar` slot whose whole surface is the tap
/// target. The screen owns visibility; the bar never inspects `MediaQuery`.
class FcBottomActionBar extends StatelessWidget {
  const FcBottomActionBar({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.enabled = true,
    this.visible = true,
    this.scale,
  });

  /// Action text, centred beside [icon].
  final String label;

  /// Leading icon shown before [label].
  final IconData icon;

  /// Tap handler; forwarded only when [enabled] is true.
  final VoidCallback onPressed;

  /// Dims the content and stops taps when false.
  final bool enabled;

  /// Collapses the whole bar to zero size when false.
  final bool visible;

  /// Scales the icon and label only, so the bar's own height never changes.
  final Animation<double>? scale;

  /// Keeps the strip above the minimum comfortable tap target.
  static const double _minHeight = 48;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox.shrink();
    }

    final colors = SparkweaverTheme.of(context);
    final foreground = enabled ? colors.primary : colors.textDisabled;
    final scaleValue = scale;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: SparkweaverTokens.iconMd, color: foreground),
        const SizedBox(width: SparkweaverSpacing.sm),
        FcText(label, style: FcTextStyle.labelLarge, color: foreground),
      ],
    );

    // The colour sits outside the safe area so the surface reaches the screen
    // edge behind the home indicator.
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.borderLight, width: 1)),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          child: SafeArea(
            top: false,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: _minHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SparkweaverSpacing.lg,
                  vertical: SparkweaverSpacing.md,
                ),
                // heightFactor keeps the strip hugging its content; a plain
                // Center would expand to fill the whole screen.
                child: Align(
                  heightFactor: 1,
                  child: scaleValue == null
                      ? content
                      : ScaleTransition(scale: scaleValue, child: content),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
