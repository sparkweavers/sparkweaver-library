import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Flashcard Flip Card Component (Molecule)
///
/// A two-sided card that flips on tap to reveal its back face. Used in
/// flashcard-mode learning sessions: the front shows the question, the
/// back shows the reference answer. Tap anywhere on the card to flip.
///
/// The flip animation runs on the card's own [AnimationController], so no
/// external state is required.
///
/// ## Usage
///
/// ```dart
/// FcFlipCard(
///   front: 'What is photosynthesis?',
///   back: 'The process plants use to convert light into energy.',
///   progressLabel: '3 / 10',
/// )
/// ```
class FcFlipCard extends StatefulWidget {
  /// Front face content — typically the question text.
  final String front;

  /// Back face content — typically the reference answer.
  final String back;

  /// Optional short label rendered above the card (for example a
  /// "3 / 10" progress indicator).
  final String? progressLabel;

  /// Called after the card fully lands on the back face — the caller can
  /// use this to reveal the self-rating bar only once the answer is
  /// actually visible.
  final VoidCallback? onFlippedToBack;

  const FcFlipCard({
    super.key,
    required this.front,
    required this.back,
    this.progressLabel,
    this.onFlippedToBack,
  });

  @override
  State<FcFlipCard> createState() => _FcFlipCardState();
}

class _FcFlipCardState extends State<FcFlipCard>
    with SingleTickerProviderStateMixin {
  static const Duration _flipDuration = Duration(milliseconds: 400);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: _flipDuration,
  );

  bool _showingBack = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    if (_showingBack) {
      await _controller.reverse();
      setState(() => _showingBack = false);
    } else {
      await _controller.forward();
      setState(() => _showingBack = true);
      widget.onFlippedToBack?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.progressLabel != null) ...[
          Padding(
            padding: FlashcardSpacing.horizontalMd,
            child: Text(
              widget.progressLabel!,
              style: FlashcardTypography.labelSmall.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          FlashcardSpacing.verticalSpaceSm,
        ],
        GestureDetector(
          onTap: _toggle,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              final value = _controller.value;
              final angle = value * 3.14159; // 0..π
              final isFrontVisible = value < 0.5;
              final displayedText = isFrontVisible ? widget.front : widget.back;
              final backgroundColor = isFrontVisible
                  ? colors.surface
                  : colors.surfaceVariant;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(angle),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateY(isFrontVisible ? 0 : 3.14159),
                  child: _FlipFace(
                    text: displayedText,
                    backgroundColor: backgroundColor,
                    isBack: !isFrontVisible,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FlipFace extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final bool isBack;

  const _FlipFace({
    required this.text,
    required this.backgroundColor,
    required this.isBack,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return Container(
      constraints: const BoxConstraints(minHeight: 240),
      padding: FlashcardSpacing.edgeInsetsXl,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: FlashcardTokens.cardRadius,
        // Not [FcCard]: both faces keep the purple border regardless of
        // fill colour, so the card reads as one continuous surface while
        // it flips. That always-bordered back face doesn't match either
        // FcCardVariant (muted has no border), so the colours are
        // resolved inline instead.
        border: Border.all(color: colors.primaryLight),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            isBack ? 'Answer' : 'Question',
            style: FlashcardTypography.labelSmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          FlashcardSpacing.verticalSpaceSm,
          Text(
            text,
            style: FlashcardTypography.heading4.copyWith(
              color: colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          FlashcardSpacing.verticalSpaceMd,
          Text(
            isBack ? 'Tap to see the question' : 'Tap to reveal the answer',
            style: FlashcardTypography.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
