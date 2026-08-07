import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Input', type: FcInputField)
Widget textInput(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcInputField(
        hintText: 'Enter text...',
        labelText: 'Text Input',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Email Input', type: FcInputField)
Widget emailInput(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcInputField(
        type: FcInputType.email,
        hintText: 'you@example.com',
        labelText: 'Email',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Password Input', type: FcInputField)
Widget passwordInput(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcInputField(
        type: FcInputType.password,
        hintText: '••••••••',
        labelText: 'Password',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Multiline Input', type: FcInputField)
Widget multilineInput(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcInputField(
        type: FcInputType.multiline,
        hintText: 'Enter description...',
        labelText: 'Description',
        maxLines: 4,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Error', type: FcInputField)
Widget inputWithError(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcInputField(
        labelText: 'Username',
        errorText: 'Username is required',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: FcInputField)
Widget disabledInput(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcInputField(
        labelText: 'Disabled',
        hintText: 'Cannot edit',
        enabled: false,
      ),
    ),
  );
}
