import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_text.dart';

/// One selectable row in an [FcChoiceDialog].
class FcChoice<T> {
  /// Value passed to [FcChoiceDialog.onSelected] when this row is tapped.
  final T value;

  /// Row label.
  final String label;

  /// Optional supporting line rendered under the label.
  final String? subtitle;

  /// Renders as the filled primary row instead of an outlined one.
  final bool isPrimary;

  const FcChoice({
    required this.value,
    required this.label,
    this.subtitle,
    this.isPrimary = false,
  });
}

/// Sparkweaver Choice Dialog (Organism)
///
/// A title, an optional message, and one full-width row per [FcChoice],
/// followed by an optional cancel action.
///
/// Never calls [Navigator] itself — the caller owns dismissal, same
/// contract as [FcResultsScreen.onFinish]. [onSelected] and [onCancel]
/// are the only way this widget communicates a decision.
///
/// ## Usage
///
/// ```dart
/// showDialog(
///   context: context,
///   builder: (ctx) => FcChoiceDialog<SessionFilter>(
///     title: 'What would you like to practice?',
///     choices: const [
///       FcChoice(value: SessionFilter.all, label: 'All questions'),
///       FcChoice(
///         value: SessionFilter.wrong,
///         label: 'Only wrong answers',
///         subtitle: '3 cards',
///         isPrimary: true,
///       ),
///     ],
///     onSelected: (filter) => Navigator.of(context).pop(filter),
///     cancelLabel: 'Cancel',
///     onCancel: () => Navigator.of(context).pop(),
///   ),
/// );
/// ```
class FcChoiceDialog<T> extends StatelessWidget {
  /// Dialog title.
  final String title;

  /// Optional paragraph shown under the title.
  final String? message;

  /// Rows offered to the user, rendered in order.
  final List<FcChoice<T>> choices;

  /// Called with the tapped row's value.
  final ValueChanged<T> onSelected;

  /// Cancel action label. The cancel action is omitted entirely when null.
  final String? cancelLabel;

  /// Called when the cancel action is tapped.
  final VoidCallback? onCancel;

  const FcChoiceDialog({
    super.key,
    required this.title,
    required this.choices,
    required this.onSelected,
    this.message,
    this.cancelLabel,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return AlertDialog(
      title: FcText(title, style: FcTextStyle.heading3),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (message != null) ...[
              FcText(message!, style: FcTextStyle.bodyMedium),
              SparkweaverSpacing.verticalSpaceMd,
            ],
            for (final choice in choices) ...[
              FcButton(
                label: choice.label,
                fullWidth: true,
                variant: choice.isPrimary
                    ? FcButtonVariant.primary
                    : FcButtonVariant.outlined,
                onPressed: () => onSelected(choice.value),
              ),
              if (choice.subtitle != null) ...[
                SparkweaverSpacing.verticalSpaceXs,
                Align(
                  alignment: Alignment.centerLeft,
                  child: FcText(
                    choice.subtitle!,
                    style: FcTextStyle.caption,
                    color: colors.textSecondary,
                  ),
                ),
              ],
              if (choice != choices.last) SparkweaverSpacing.verticalSpaceSm,
            ],
          ],
        ),
      ),
      actions: cancelLabel == null
          ? null
          : [
              TextButton(
                onPressed: onCancel,
                child: FcText(
                  cancelLabel!,
                  style: FcTextStyle.labelMedium,
                  color: colors.textSecondary,
                ),
              ),
            ],
    );
  }
}
