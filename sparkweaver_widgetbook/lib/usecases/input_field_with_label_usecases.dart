import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Input with Label', type: FcInputFieldWithLabel)
Widget basicInputWithLabel(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcInputFieldWithLabel(label: 'Email', hintText: 'you@example.com'),
    ),
  );
}

@widgetbook.UseCase(name: 'Required Field', type: FcInputFieldWithLabel)
Widget requiredField(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcInputFieldWithLabel(
        label: 'Username',
        hintText: 'Enter username',
        required: true,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Helper Text', type: FcInputFieldWithLabel)
Widget withHelperText(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcInputFieldWithLabel(
        label: 'Password',
        type: FcInputType.password,
        helperText: 'Must be at least 8 characters',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Error', type: FcInputFieldWithLabel)
Widget withError(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcInputFieldWithLabel(
        label: 'Email',
        errorText: 'Invalid email format',
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Form Example', type: FcInputFieldWithLabel)
Widget formExample(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          FcInputFieldWithLabel(
            label: 'Name',
            hintText: 'Enter your name',
            required: true,
          ),
          SizedBox(height: 16),
          FcInputFieldWithLabel(
            label: 'Email',
            type: FcInputType.email,
            hintText: 'you@example.com',
            required: true,
          ),
          SizedBox(height: 16),
          FcInputFieldWithLabel(
            label: 'Message',
            type: FcInputType.multiline,
            hintText: 'Your message...',
            maxLines: 4,
          ),
        ],
      ),
    ),
  );
}
