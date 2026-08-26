import 'package:flutter/material.dart';
import '../../design_system/theme.dart';
import '../../design_system/spacing.dart';
import '../../design_system/tokens.dart';

/// The variants a [FcCard] surface can take.
enum FcCardVariant {
  /// The default card: the theme's surface colour with a purple border.
  /// Used for the primary content block on a screen.
  surface,

  /// A quieter block nested inside or beside a [FcCardVariant.surface] card,
  /// with no border. Used for feedback, hints and secondary panels.
  muted,

  /// A card the user has picked out of several, tinted blue against the
  /// purple-bordered [FcCardVariant.surface] cards it sits among.
  selected,
}

/// The single card surface for the design system.
///
/// This component follows the Single Responsibility Principle (SRP) by
/// focusing solely on painting a themed surface: background, border and
/// corner radius. It holds no layout opinion beyond padding and no content
/// logic.
///
/// It exists because every card in this library used to hand-roll its own
/// `Container` with a `BoxDecoration`, each one reaching for the static
/// [SparkweaverColors] palette. Those constants do not change with the
/// theme, so every such card stayed light when the consuming app switched
/// to dark mode. [FcCard] resolves its colours through
/// [SparkweaverTheme], so a card is correct in both themes and there is
/// one place to change if that ever needs revisiting.
///
/// Usage:
/// ```dart
/// FcCard(child: Text('Session results'))
///
/// FcCard(
///   variant: FcCardVariant.muted,
///   child: Text('Nearly, but latent learning is not the same thing.'),
/// )
///
/// FcCard(
///   variant: FcCardVariant.selected,
///   child: Text('Yearly'),
/// )
/// ```
class FcCard extends StatelessWidget {
  const FcCard({
    super.key,
    required this.child,
    this.variant = FcCardVariant.surface,
    this.padding = SparkweaverSpacing.edgeInsetsLg,
    this.width,
  });

  /// Content painted on the card surface.
  final Widget child;

  /// Which surface treatment to paint. See [FcCardVariant].
  final FcCardVariant variant;

  /// Inner padding. Defaults to the standard large card inset.
  final EdgeInsetsGeometry padding;

  /// Optional fixed width. Null means the card sizes to its parent.
  final double? width;

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final border = _borderColor(colors);

    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: _background(colors),
        borderRadius: SparkweaverTokens.cardRadius,
        border: border == null ? null : Border.all(color: border),
      ),
      child: child,
    );
  }

  /// Blended rather than translucent, so the tint does not change with
  /// whatever the card happens to sit on.
  Color _background(SparkweaverTheme colors) => switch (variant) {
    FcCardVariant.surface => colors.surface,
    FcCardVariant.muted => colors.surfaceVariant,
    FcCardVariant.selected => Color.alphaBlend(
      colors.secondary10,
      colors.surface,
    ),
  };

  Color? _borderColor(SparkweaverTheme colors) => switch (variant) {
    FcCardVariant.surface => colors.primaryLight,
    FcCardVariant.muted => null,
    FcCardVariant.selected => colors.secondary,
  };
}
