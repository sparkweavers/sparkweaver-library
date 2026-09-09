import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FcNewPasswordFields)
Widget defaultNewPasswordFields(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcNewPasswordFields(
        newPasswordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        newPasswordLabel: 'New password',
        confirmPasswordLabel: 'Confirm new password',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Errors', type: FcNewPasswordFields)
Widget withErrorsNewPasswordFields(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcNewPasswordFields(
        newPasswordController: TextEditingController(text: 'abc'),
        confirmPasswordController: TextEditingController(text: 'abcd'),
        newPasswordLabel: 'New password',
        confirmPasswordLabel: 'Confirm new password',
        newPasswordError: 'Password must be at least 6 characters',
        confirmPasswordError: 'Passwords do not match',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: FcNewPasswordFields)
Widget disabledNewPasswordFields(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcNewPasswordFields(
        newPasswordController: TextEditingController(text: 'password123'),
        confirmPasswordController: TextEditingController(text: 'password123'),
        newPasswordLabel: 'New password',
        confirmPasswordLabel: 'Confirm new password',
        enabled: false,
      ),
    ),
  );
}
