import 'package:flutter/material.dart';

import '../../design_system/spacing.dart';
import '../../design_system/theme.dart';
import '../../design_system/tokens.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// How much weight a [FcSection] carries on the screen it sits on.
enum FcSectionVariant {
  /// The main block of a screen.
  primary,

  /// A supporting block beside or below a primary one.
  secondary,

  /// Grouping without emphasis.
  neutral,

  /// Destructive actions, painted in the theme's error colour.
  danger,
}

/// A titled block of content: a heading, an optional leading icon, and
/// whatever the caller puts below it.
class FcSection extends StatelessWidget {
  const FcSection({
    super.key,
    required this.title,
    required this.child,
    this.variant = FcSectionVariant.neutral,
    this.icon,
    this.padding = SparkweaverSpacing.edgeInsetsLg,
  });

  /// Heading shown above [child].
  final String title;

  /// Body content of the section.
  final Widget child;

  /// Which weight to paint. See [FcSectionVariant].
  final FcSectionVariant variant;

  /// Optional glyph shown before the heading.
  final IconData? icon;

  /// Inner padding around heading and content alike.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final heading = _headingColor(colors);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: SparkweaverTokens.cardRadius,
        border: Border.all(color: _borderColor(colors)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                FcIcon(icon!, size: FcIconSize.medium, color: heading),
                const SizedBox(width: SparkweaverSpacing.sm),
              ],
              Expanded(
                child: FcText(
                  title,
                  style: FcTextStyle.heading5,
                  color: heading,
                ),
              ),
            ],
          ),
          const SizedBox(height: SparkweaverSpacing.md),
          child,
        ],
      ),
    );
  }

  /// The darker or lighter end of each accent, so a 16px heading clears
  /// WCAG AA against the surface in both themes.
  Color _headingColor(SparkweaverTheme colors) => switch (variant) {
    FcSectionVariant.primary =>
      colors.isDark ? colors.primaryLight : colors.primaryDark,
    FcSectionVariant.secondary =>
      colors.isDark ? colors.secondaryLight : colors.secondaryDark,
    FcSectionVariant.neutral => colors.textPrimary,
    FcSectionVariant.danger =>
      colors.isDark ? colors.errorLight : colors.errorDark,
  };

  Color _borderColor(SparkweaverTheme colors) => switch (variant) {
    FcSectionVariant.primary => colors.primary,
    FcSectionVariant.secondary => colors.secondary,
    FcSectionVariant.neutral => colors.borderDark,
    FcSectionVariant.danger => colors.error,
  };
}
