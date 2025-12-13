import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Input Field Type variants
enum FcInputType {
  /// Single line text input
  text,

  /// Email input with keyboard type
  email,

  /// Password input (obscured text)
  password,

  /// Multiline text input
  multiline,
}

/// Input Field State
enum FcInputState {
  /// Default state
  normal,

  /// Focused state
  focused,

  /// Error state
  error,

  /// Disabled state
  disabled,
}

/// Flashcard Input Field Component (Atom)
///
/// A reusable input field with consistent styling and variants.
///
/// ## Usage
///
/// ```dart
/// // Basic text input
/// FcInputField(
///   controller: _controller,
///   hintText: 'Enter text',
/// )
///
/// // Email input
/// FcInputField(
///   controller: _emailController,
///   type: FcInputType.email,
///   labelText: 'Email',
/// )
///
/// // Password input
/// FcInputField(
///   controller: _passwordController,
///   type: FcInputType.password,
///   labelText: 'Password',
/// )
///
/// // Multiline input
/// FcInputField(
///   controller: _descController,
///   type: FcInputType.multiline,
///   maxLines: 3,
/// )
///
/// // With error
/// FcInputField(
///   controller: _controller,
///   errorText: 'This field is required',
/// )
/// ```
class FcInputField extends StatelessWidget {
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

  /// Suffix icon
  final IconData? suffixIcon;

  /// Suffix icon button callback
  final VoidCallback? onSuffixIconPressed;

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
  });

  TextInputType _getKeyboardType() {
    switch (type) {
      case FcInputType.email:
        return TextInputType.emailAddress;
      case FcInputType.multiline:
        return TextInputType.multiline;
      case FcInputType.text:
      case FcInputType.password:
        return TextInputType.text;
    }
  }

  int? _getMaxLines() {
    if (type == FcInputType.multiline) {
      return maxLines ?? 3;
    }
    return maxLines ?? 1;
  }

  int? _getMinLines() {
    if (type == FcInputType.multiline) {
      return minLines ?? 1;
    }
    return null;
  }

  bool get _isPassword => type == FcInputType.password;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      obscureText: _isPassword,
      keyboardType: _getKeyboardType(),
      textInputAction: textInputAction,
      maxLines: _getMaxLines(),
      minLines: _getMinLines(),
      maxLength: showCounter ? maxLength : null,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      style: FlashcardTypography.bodyMedium.copyWith(
        color: enabled ? FlashcardColors.textPrimary : FlashcardColors.textDisabled,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: FlashcardTypography.bodyMedium.copyWith(
          color: errorText != null
              ? FlashcardColors.error
              : FlashcardColors.textSecondary,
        ),
        hintText: hintText,
        hintStyle: FlashcardTypography.bodyMedium.copyWith(
          color: FlashcardColors.textHint,
        ),
        helperText: errorText == null ? helperText : null,
        helperStyle: FlashcardTypography.caption.copyWith(
          color: FlashcardColors.textSecondary,
        ),
        errorText: errorText,
        errorStyle: FlashcardTypography.caption.copyWith(
          color: FlashcardColors.error,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: errorText != null
                    ? FlashcardColors.error
                    : FlashcardColors.textSecondary,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: errorText != null
                      ? FlashcardColors.error
                      : FlashcardColors.textSecondary,
                ),
                onPressed: onSuffixIconPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: FlashcardColors.borderLight,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: FlashcardColors.borderLight,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: errorText != null
                ? FlashcardColors.error
                : FlashcardColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: FlashcardColors.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: FlashcardColors.error,
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: FlashcardColors.borderLight,
            width: 1,
          ),
        ),
        filled: true,
        fillColor: enabled ? FlashcardColors.white : FlashcardColors.gray100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
