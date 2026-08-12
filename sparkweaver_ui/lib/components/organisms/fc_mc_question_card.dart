import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_card.dart';
import '../atoms/fc_markdown_text.dart';

/// Multiple-Choice Question Card (Organism)
///
/// Displays a question and four selectable options as a vertical stack of
/// buttons. Tapping an option calls [onSelected] with the option's index.
/// Once an option is selected the buttons stop responding to taps but keep
/// their reveal colour — the option the user picked is highlighted, and the
/// correct option (if [correctIndex] is provided) is styled success (green)
/// so it stays visible whether the pick was right.
///
/// The widget does not evaluate correctness itself; the caller passes in
/// [correctIndex] (typically after the server returns evaluation) and
/// optionally [feedback] to render below the options.
///
/// ## Usage
///
/// ```dart
/// FcMcQuestionCard(
///   question: 'Wer ist der bekannteste Vertreter?',
///   options: const ['Pawlow', 'Skinner', 'Freud', 'Watson'],
///   selectedIndex: null,          // set after user picks
///   correctIndex: null,           // set after server evaluates
///   feedback: null,               // set after server evaluates
///   onSelected: (i) => coordinator.selectOption(i),
///   progressLabel: '2 / 10',
/// )
/// ```
class FcMcQuestionCard extends StatelessWidget {
  /// Question text rendered above the option buttons.
  final String question;

  /// Exactly four options. Enforced at the call site; the widget renders
  /// however many are passed for graceful degradation.
  final List<String> options;

  /// Index of the option the user picked, or null if they haven't yet.
  final int? selectedIndex;

  /// Index of the correct option, or null if the server hasn't evaluated
  /// yet. When present, the correct option is highlighted success (green)
  /// and the selected-but-wrong option is highlighted destructive (red).
  final int? correctIndex;

  /// Optional feedback text rendered under the options (typically the
  /// LLM's short explanation of why an answer is right or wrong).
  final String? feedback;

  /// Called when the user taps an option. Once [selectedIndex] is set the
  /// options render `interactive: false` (see [FcButton]), so taps stop
  /// reaching this callback even though it stays wired.
  final ValueChanged<int> onSelected;

  /// Optional short label rendered above the question (for example a
  /// "3 / 10" progress indicator).
  final String? progressLabel;

  const FcMcQuestionCard({
    super.key,
    required this.question,
    required this.options,
    required this.onSelected,
    this.selectedIndex,
    this.correctIndex,
    this.feedback,
    this.progressLabel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final locked = selectedIndex != null;
    return Padding(
      padding: SparkweaverSpacing.edgeInsetsLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (progressLabel != null) ...[
            Text(
              progressLabel!,
              style: SparkweaverTypography.labelSmall.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SparkweaverSpacing.verticalSpaceSm,
          ],
          FcCard(
            child: FcMarkdownText(
              data: question,
              baseStyle: SparkweaverTypography.heading4.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ),
          SparkweaverSpacing.verticalSpaceLg,
          for (var i = 0; i < options.length; i++) ...[
            _optionButton(index: i, locked: locked),
            if (i < options.length - 1) SparkweaverSpacing.verticalSpaceSm,
          ],
          if (feedback != null && feedback!.isNotEmpty) ...[
            SparkweaverSpacing.verticalSpaceMd,
            FcCard(
              variant: FcCardVariant.muted,
              width: double.infinity,
              padding: SparkweaverSpacing.edgeInsetsMd,
              child: FcMarkdownText(
                data: feedback!,
                baseStyle: SparkweaverTypography.bodyMedium.copyWith(
                  color: colors.textPrimary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _optionButton({required int index, required bool locked}) {
    final variant = _variantFor(index);
    return FcButton(
      label: options[index],
      variant: variant,
      fullWidth: true,
      // Once locked the callback stays wired — `interactive: false` is what
      // blocks the tap. Passing `onPressed: null` here would fall back to
      // FcButton's disabled grey and destroy the reveal colours computed by
      // `_variantFor` above.
      interactive: !locked,
      onPressed: () => onSelected(index),
    );
  }

  FcButtonVariant _variantFor(int index) {
    if (correctIndex != null && index == correctIndex) {
      return FcButtonVariant.success;
    }
    if (selectedIndex != null && index == selectedIndex) {
      return correctIndex == null
          ? FcButtonVariant.primary
          : FcButtonVariant.destructive;
    }
    return FcButtonVariant.outlined;
  }
}
