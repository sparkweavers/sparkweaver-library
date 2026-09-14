import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'fc_input_field_decoration.dart';
import 'fc_input_field_types.dart';

export 'fc_input_field_types.dart';

part 'fc_input_field_state.dart';

/// Sparkweaver Input Field Component (Atom)
///
/// A password type renders its own show/hide toggle; pass [showPasswordLabel]
/// and [hidePasswordLabel] to give the toggle a localised tooltip.
class FcInputField extends StatefulWidget {
  /// Text editing controller
  final TextEditingController? controller;

  /// Initial value (if controller is not provided)
  final String? initialValue;

  /// Input type variant
  final FcInputType type;

  /// Label text
  final String? labelText;

  /// Hint text
  final String? hintText;

  /// Helper text shown below the field
  final String? helperText;

  /// Error text (overrides helper text and sets error state)
  final String? errorText;

  /// Maximum number of lines (for multiline type)
  final int? maxLines;

  /// Minimum number of lines (for multiline type)
  final int? minLines;

  /// Maximum length of input
  final int? maxLength;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether to show the character counter
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

  /// Suffix icon, takes precedence over the password toggle when set
  final IconData? suffixIcon;

  /// Suffix icon button callback
  final VoidCallback? onSuffixIconPressed;

  /// When non-null, overrides the type-derived obscure-text default.
  final bool? obscureText;

  /// Tooltip for the password toggle while the text is hidden
  final String? showPasswordLabel;

  /// Tooltip for the password toggle while the text is visible
  final String? hidePasswordLabel;

  const FcInputField({
    super.key,
    this.controller,
    this.initialValue,
    this.type = FcInputType.text,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
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
    this.showPasswordLabel,
    this.hidePasswordLabel,
  });

  @override
  State<FcInputField> createState() => _FcInputFieldState();
}
