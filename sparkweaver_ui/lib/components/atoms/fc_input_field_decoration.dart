import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Builds the shared [InputDecoration] used by `FcInputField`.
InputDecoration buildFcInputDecoration({
  required SparkweaverTheme colors,
  required bool enabled,
  String? labelText,
  String? hintText,
  String? helperText,
  String? errorText,
  IconData? prefixIcon,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: SparkweaverTypography.bodyMedium.copyWith(
      color: errorText != null ? colors.error : colors.textSecondary,
    ),
    hintText: hintText,
    hintStyle: SparkweaverTypography.bodyMedium.copyWith(
      color: colors.textHint,
    ),
    helperText: errorText == null ? helperText : null,
    helperStyle: SparkweaverTypography.caption.copyWith(
      color: colors.textSecondary,
    ),
    errorText: errorText,
    errorStyle: SparkweaverTypography.caption.copyWith(color: colors.error),
    prefixIcon: prefixIcon != null
        ? Icon(
            prefixIcon,
            color: errorText != null ? colors.error : colors.textSecondary,
          )
        : null,
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.borderLight, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.borderLight, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: errorText != null ? colors.error : colors.primary,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.error, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.error, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colors.borderLight, width: 1),
    ),
    filled: true,
    fillColor: enabled ? colors.white : colors.gray100,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
}
