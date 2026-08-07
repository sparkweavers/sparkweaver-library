import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_input_field.dart';
import 'fc_input_field_with_label.dart';

/// Flashcard Password Input Field Component (Molecule)
///
/// A labeled password input with an eye-icon suffix that toggles between
/// obscured (`••••••••`) and clear text. Composes [FcInputFieldWithLabel]
/// with [FcInputType.password] and owns the visibility-toggle state.
///
/// ## Usage
///
/// ```dart
/// FcPasswordInputField(
///   label: 'Password',
///   controller: _passwordController,
/// )
/// ```
class FcPasswordInputField extends StatefulWidget {
  /// Label text shown above the field.
  final String label;

  /// Text editing controller.
  final TextEditingController? controller;

  /// Hint text shown in the field.
  final String? hintText;

  /// Helper text shown below the field.
  final String? helperText;

  /// Error text (overrides helper text).
  final String? errorText;

  /// Whether the label shows a required asterisk.
  final bool required;

  /// Whether the field is enabled. When `false`, the eye toggle is also
  /// disabled so the disabled field has no interactive affordance.
  final bool enabled;

  /// Callback when text changes.
  final ValueChanged<String>? onChanged;

  /// Callback when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Callback when field is submitted.
  final ValueChanged<String>? onSubmitted;

  /// Focus node.
  final FocusNode? focusNode;

  /// Text input action.
  final TextInputAction? textInputAction;

  const FcPasswordInputField({
    super.key,
    required this.label,
    this.controller,
    this.hintText,
    this.helperText,
    this.errorText,
    this.required = false,
    this.enabled = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
  });

  @override
  State<FcPasswordInputField> createState() => _FcPasswordInputFieldState();
}

class _FcPasswordInputFieldState extends State<FcPasswordInputField> {
  bool _isObscured = true;

  void _toggle() => setState(() => _isObscured = !_isObscured);

  @override
  Widget build(BuildContext context) {
    return FcInputFieldWithLabel(
      label: widget.label,
      controller: widget.controller,
      type: FcInputType.password,
      hintText: widget.hintText,
      helperText: widget.helperText,
      errorText: widget.errorText,
      required: widget.required,
      enabled: widget.enabled,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      obscureText: _isObscured,
      suffixIcon: _isObscured
          ? FlashcardIcons.actionVisibility
          : FlashcardIcons.actionVisibilityOff,
      onSuffixIconPressed: widget.enabled ? _toggle : null,
    );
  }
}
