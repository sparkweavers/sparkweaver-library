import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_text.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_input_field.dart';
import '../molecules/fc_input_field_with_label.dart';

/// Flashcard Confirmation Dialog (Organism)
///
/// A simple confirmation dialog with title, message, and action buttons.
///
/// ## Usage
///
/// ```dart
/// // Show confirmation dialog
/// final result = await showDialog<bool>(
///   context: context,
///   builder: (context) => FcConfirmationDialog(
///     title: 'Delete Item',
///     message: 'Are you sure you want to delete this item?',
///     confirmLabel: 'Delete',
///     cancelLabel: 'Cancel',
///     isDestructive: true,
///   ),
/// );
/// ```
class FcConfirmationDialog extends StatelessWidget {
  /// Dialog title
  final String title;

  /// Dialog message
  final String message;

  /// Confirm button label
  final String confirmLabel;

  /// Cancel button label
  final String cancelLabel;

  /// Whether this is a destructive action (uses error color)
  final bool isDestructive;

  /// Optional icon
  final IconData? icon;

  /// Icon color
  final Color? iconColor;

  const FcConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = 'Confirm',
    this.cancelLabel = 'Cancel',
    this.isDestructive = false,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return AlertDialog(
      title: Row(
        children: [
          if (icon != null) ...[
            FcIcon(
              icon!,
              color: iconColor ??
                  (isDestructive ? colors.error : colors.primary),
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: FcText(
              title,
              style: FcTextStyle.heading3,
            ),
          ),
        ],
      ),
      content: FcText(
        message,
        style: FcTextStyle.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: FcText(
            cancelLabel,
            style: FcTextStyle.labelMedium,
            color: colors.textSecondary,
          ),
        ),
        FcButton(
          label: confirmLabel,
          onPressed: () => Navigator.pop(context, true),
          variant: isDestructive
              ? FcButtonVariant.destructive
              : FcButtonVariant.primary,
        ),
      ],
    );
  }
}

/// Input field data for form dialogs
class DialogInputField {
  final String label;
  final String? hintText;
  final String? initialValue;
  final FcInputType type;
  final bool required;
  final int? maxLines;

  const DialogInputField({
    required this.label,
    this.hintText,
    this.initialValue,
    this.type = FcInputType.text,
    this.required = false,
    this.maxLines,
  });
}

/// Flashcard Form Dialog (Organism)
///
/// A dialog with input fields and submit/cancel buttons.
///
/// ## Usage
///
/// ```dart
/// // Show form dialog
/// final result = await showDialog<Map<String, String>>(
///   context: context,
///   builder: (context) => FcFormDialog(
///     title: 'Create Topic',
///     fields: [
///       DialogInputField(
///         label: 'Topic Name',
///         hintText: 'e.g., Machine Learning',
///         required: true,
///       ),
///       DialogInputField(
///         label: 'Description',
///         hintText: 'Brief description',
///         type: FcInputType.multiline,
///         maxLines: 2,
///       ),
///     ],
///     submitLabel: 'Create',
///     cancelLabel: 'Cancel',
///   ),
/// );
/// ```
class FcFormDialog extends StatefulWidget {
  /// Dialog title
  final String title;

  /// Input fields
  final List<DialogInputField> fields;

  /// Submit button label
  final String submitLabel;

  /// Cancel button label
  final String cancelLabel;

  const FcFormDialog({
    super.key,
    required this.title,
    required this.fields,
    this.submitLabel = 'Submit',
    this.cancelLabel = 'Cancel',
  });

  @override
  State<FcFormDialog> createState() => _FcFormDialogState();
}

class _FcFormDialogState extends State<FcFormDialog> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = widget.fields
        .map((field) => TextEditingController(text: field.initialValue))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleSubmit() {
    // Validate required fields
    for (int i = 0; i < widget.fields.length; i++) {
      if (widget.fields[i].required && _controllers[i].text.trim().isEmpty) {
        return;
      }
    }

    // Return map of field labels to values
    final result = <String, String>{};
    for (int i = 0; i < widget.fields.length; i++) {
      result[widget.fields[i].label] = _controllers[i].text.trim();
    }

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return AlertDialog(
      title: FcText(
        widget.title,
        style: FcTextStyle.heading3,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < widget.fields.length; i++) ...[
              FcInputFieldWithLabel(
                label: widget.fields[i].label,
                controller: _controllers[i],
                type: widget.fields[i].type,
                hintText: widget.fields[i].hintText,
                required: widget.fields[i].required,
                maxLines: widget.fields[i].maxLines,
              ),
              if (i < widget.fields.length - 1) const SizedBox(height: 16),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: FcText(
            widget.cancelLabel,
            style: FcTextStyle.labelMedium,
            color: colors.textSecondary,
          ),
        ),
        FcButton(
          label: widget.submitLabel,
          onPressed: _handleSubmit,
          variant: FcButtonVariant.primary,
        ),
      ],
    );
  }
}

/// Flashcard Alert Dialog (Organism)
///
/// A simple alert dialog with icon, message, and OK button.
///
/// ## Usage
///
/// ```dart
/// await showDialog(
///   context: context,
///   builder: (context) => FcAlertDialog(
///     title: 'Success',
///     message: 'Your changes have been saved.',
///     icon: Icons.check_circle,
///     iconColor: FlashcardColors.success,
///   ),
/// );
/// ```
class FcAlertDialog extends StatelessWidget {
  /// Dialog title
  final String title;

  /// Dialog message
  final String message;

  /// Optional icon
  final IconData? icon;

  /// Icon color
  final Color? iconColor;

  /// OK button label
  final String okLabel;

  const FcAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.iconColor,
    this.okLabel = 'OK',
  });

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return AlertDialog(
      title: Row(
        children: [
          if (icon != null) ...[
            FcIcon(
              icon!,
              color: iconColor ?? colors.primary,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: FcText(
              title,
              style: FcTextStyle.heading3,
            ),
          ),
        ],
      ),
      content: FcText(
        message,
        style: FcTextStyle.bodyMedium,
      ),
      actions: [
        FcButton(
          label: okLabel,
          onPressed: () => Navigator.pop(context),
          variant: FcButtonVariant.primary,
        ),
      ],
    );
  }
}
