import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_card.dart';
import '../atoms/fc_text.dart';

/// One selectable row in an [FcChoiceDialog].
class FcChoice<T> {
  /// Value passed to [FcChoiceDialog.onSelected] when this row is tapped.
  final T value;

  /// Row label.
  final String label;

  /// Optional supporting line rendered under the label.
  final String? subtitle;

  /// Renders as the selected-tint card instead of the default surface one.
  final bool isPrimary;

  const FcChoice({
    required this.value,
    required this.label,
    this.subtitle,
    this.isPrimary = false,
  });
}

/// A title, an optional message, one row per [FcChoice], and an optional cancel action.
/// Never calls [Navigator]; the caller owns dismissal through the callbacks.
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
            for (var i = 0; i < choices.length; i++) ...[
              _ChoiceRow<T>(choice: choices[i], onSelected: onSelected),
              if (i < choices.length - 1) SparkweaverSpacing.verticalSpaceSm,
            ],
          ],
        ),
      ),
      actions: cancelLabel == null
          ? null
          : [
              FcButton(
                label: cancelLabel!,
                variant: FcButtonVariant.text,
                onPressed: onCancel,
              ),
            ],
    );
  }
}

/// One tappable row: label and optional subtitle stacked inside a single [FcCard] hit area.
class _ChoiceRow<T> extends StatelessWidget {
  final FcChoice<T> choice;
  final ValueChanged<T> onSelected;

  const _ChoiceRow({required this.choice, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return Material(
      type: MaterialType.transparency,
      borderRadius: SparkweaverTokens.cardRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onSelected(choice.value),
        child: FcCard(
          variant: choice.isPrimary
              ? FcCardVariant.selected
              : FcCardVariant.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              FcText(choice.label, style: FcTextStyle.labelLarge),
              if (choice.subtitle != null) ...[
                SparkweaverSpacing.verticalSpaceXs,
                FcText(
                  choice.subtitle!,
                  style: FcTextStyle.caption,
                  color: colors.textSecondary,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
