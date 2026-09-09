import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'fc_password_input_field.dart';

/// Blocks submission when [value] is shorter than [minLength].
String? validateNewPasswordLength(
  String value, {
  required int minLength,
  required String errorText,
}) {
  return value.length < minLength ? errorText : null;
}

/// Blocks submission unless [confirmation] repeats [newPassword] exactly.
String? validatePasswordsMatch(
  String newPassword,
  String confirmation, {
  required String errorText,
}) {
  return newPassword == confirmation ? null : errorText;
}

/// New and confirm password inputs, labels and errors supplied by the caller.
class FcNewPasswordFields extends StatelessWidget {
  /// Controller for the new password field.
  final TextEditingController newPasswordController;

  /// Controller for the confirm password field.
  final TextEditingController confirmPasswordController;

  /// Label shown above the new password field.
  final String newPasswordLabel;

  /// Label shown above the confirm password field.
  final String confirmPasswordLabel;

  /// Error text for the new password field.
  final String? newPasswordError;

  /// Error text for the confirm password field.
  final String? confirmPasswordError;

  /// Whether both fields are enabled.
  final bool enabled;

  /// Callback when the new password field changes.
  final ValueChanged<String>? onNewPasswordChanged;

  /// Callback when the confirm password field changes.
  final ValueChanged<String>? onConfirmPasswordChanged;

  const FcNewPasswordFields({
    super.key,
    required this.newPasswordController,
    required this.confirmPasswordController,
    required this.newPasswordLabel,
    required this.confirmPasswordLabel,
    this.newPasswordError,
    this.confirmPasswordError,
    this.enabled = true,
    this.onNewPasswordChanged,
    this.onConfirmPasswordChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FcPasswordInputField(
          label: newPasswordLabel,
          controller: newPasswordController,
          errorText: newPasswordError,
          enabled: enabled,
          onChanged: onNewPasswordChanged,
        ),
        SparkweaverSpacing.verticalSpaceLg,
        FcPasswordInputField(
          label: confirmPasswordLabel,
          controller: confirmPasswordController,
          errorText: confirmPasswordError,
          enabled: enabled,
          onChanged: onConfirmPasswordChanged,
        ),
      ],
    );
  }
}
