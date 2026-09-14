import 'package:flutter/material.dart';

import '../../design_system/spacing.dart';
import '../../design_system/theme.dart';
import '../atoms/fc_button.dart';

/// A fixed `Scaffold.bottomNavigationBar` slot composing a single primary
/// action. The screen owns visibility; the bar never inspects `MediaQuery`.
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

  /// Button text, always rendered beside [icon].
  final String label;

  /// Leading icon shown before [label].
  final IconData icon;

  /// Tap handler; forwarded only when [enabled] is true.
  final VoidCallback onPressed;

  /// Renders the inner button's disabled style when false.
  final bool enabled;

  /// Collapses the whole bar to zero size when false.
  final bool visible;

  /// Wraps only the inner button in a pulse; the bar's own height never
  /// changes because the surrounding padding absorbs the scaled paint.
  final Animation<double>? scale;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return const SizedBox.shrink();
    }

    final colors = SparkweaverTheme.of(context);
    final button = FcButton(
      label: label,
      icon: icon,
      onPressed: enabled ? onPressed : null,
      variant: FcButtonVariant.primary,
      size: FcButtonSize.medium,
      fullWidth: false,
    );
    final scaleValue = scale;

    // The colour sits outside the safe area so the surface reaches the screen
    // edge behind the home indicator.
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.borderLight, width: 1)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: SparkweaverSpacing.edgeInsetsLg,
          child: Align(
            alignment: Alignment.center,
            heightFactor: 1,
            child: scaleValue == null
                ? button
                : ScaleTransition(scale: scaleValue, child: button),
          ),
        ),
      ),
    );
  }
}
