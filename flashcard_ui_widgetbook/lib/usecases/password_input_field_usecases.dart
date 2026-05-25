import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FcPasswordInputField)
Widget defaultPasswordInputField(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcPasswordInputField(
        label: 'Password',
        hintText: 'Enter your password',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Required', type: FcPasswordInputField)
Widget requiredPasswordInputField(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcPasswordInputField(
        label: 'Password',
        hintText: 'Enter your password',
        required: true,
        helperText: 'Must be at least 8 characters',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: FcPasswordInputField)
Widget disabledPasswordInputField(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcPasswordInputField(
        label: 'Password',
        hintText: 'Cannot edit',
        enabled: false,
      ),
    ),
  );
}
