import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_input_field.dart';
import '../atoms/fc_text.dart';

/// Sparkweaver Input Field with Label Component (Molecule)
///
/// A composable input field with label, helper text, and error message.
/// Composes FcText + FcInputField for form usage.
///
/// ## Usage
///
/// ```dart
/// // Basic labeled input
/// FcInputFieldWithLabel(
///   label: 'Email',
///   controller: _emailController,
/// )
///
/// // With helper text
/// FcInputFieldWithLabel(
///   label: 'Password',
///   helperText: 'Must be at least 8 characters',
///   type: FcInputType.password,
///   controller: _passwordController,
/// )
///
/// // With error
/// FcInputFieldWithLabel(
///   label: 'Username',
///   errorText: 'Username is required',
///   controller: _usernameController,
/// )
/// ```
class FcInputFieldWithLabel extends StatelessWidget {
  /// Label text shown above the field
  final String label;

  /// Text editing controller
  final TextEditingController? controller;

  /// Input type variant
  final FcInputType type;

  /// Hint text shown in the field
  final String? hintText;

  /// Helper text shown below the field
  final String? helperText;

  /// Error text (overrides helper text)
  final String? errorText;

  /// Whether the label is required (shows asterisk)
  final bool required;

  /// Maximum number of lines
  final int? maxLines;

  /// Minimum number of lines
  final int? minLines;

  /// Maximum length
  final int? maxLength;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether to show character counter
  final bool showCounter;

  /// Callback when text changes
  final ValueChanged<String>? onChanged;

  /// Callback when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback when field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Focus node
  final FocusNode? focusNode;

  /// Text input action
  final TextInputAction? textInputAction;

  /// Prefix icon
  final IconData? prefixIcon;

  /// Suffix icon
  final IconData? suffixIcon;

  /// Suffix icon button callback
  final VoidCallback? onSuffixIconPressed;

  /// When non-null, overrides the type-derived obscure-text default.
  /// Forwarded to [FcInputField.obscureText].
  final bool? obscureText;

  const FcInputFieldWithLabel({
    super.key,
    required this.label,
    this.controller,
    this.type = FcInputType.text,
    this.hintText,
    this.helperText,
    this.errorText,
    this.required = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.showCounter = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.focusNode,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label with optional asterisk for required fields
        Row(
          children: [
            FcText(
              label,
              style: FcTextStyle.labelMedium,
              color: enabled ? colors.textPrimary : colors.textDisabled,
            ),
            if (required) ...[
              const SizedBox(width: 4),
              FcText('*', style: FcTextStyle.labelMedium, color: colors.error),
            ],
          ],
        ),
        const SizedBox(height: 8),

        // Input field
        FcInputField(
          controller: controller,
          type: type,
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          enabled: enabled,
          showCounter: showCounter,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onSubmitted: onSubmitted,
          focusNode: focusNode,
          textInputAction: textInputAction,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          onSuffixIconPressed: onSuffixIconPressed,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
