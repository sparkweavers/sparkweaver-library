import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Sign In Template', type: FcAuthFormTemplate)
Widget signInTemplate(BuildContext context) {
  return FcAuthFormTemplate(
    title: 'Sign In',
    fields: const [
      FcInputFieldWithLabel(
        label: 'Email',
        type: FcInputType.email,
        hintText: 'you@example.com',
        required: true,
      ),
      FcInputFieldWithLabel(
        label: 'Password',
        type: FcInputType.password,
        required: true,
      ),
    ],
    submitButtonLabel: 'Sign In',
    onSubmit: () {},
    footer: TextButton(
      onPressed: () {},
      child: const Text("Don't have an account? Sign up"),
    ),
  );
}

@widgetbook.UseCase(name: 'Sign Up Template', type: FcAuthFormTemplate)
Widget signUpTemplate(BuildContext context) {
  return FcAuthFormTemplate(
    title: 'Sign Up',
    fields: const [
      FcInputFieldWithLabel(
        label: 'Name',
        hintText: 'Enter your name',
        required: true,
      ),
      FcInputFieldWithLabel(
        label: 'Email',
        type: FcInputType.email,
        hintText: 'you@example.com',
        required: true,
      ),
      FcInputFieldWithLabel(
        label: 'Password',
        type: FcInputType.password,
        helperText: 'Must be at least 8 characters',
        required: true,
      ),
    ],
    submitButtonLabel: 'Create Account',
    onSubmit: () {},
    footer: TextButton(
      onPressed: () {},
      child: const Text('Already have an account? Sign in'),
    ),
  );
}

@widgetbook.UseCase(name: 'Loading State', type: FcAuthFormTemplate)
Widget authFormLoading(BuildContext context) {
  return FcAuthFormTemplate(
    title: 'Sign In',
    fields: const [
      FcInputFieldWithLabel(label: 'Email', type: FcInputType.email),
      FcInputFieldWithLabel(label: 'Password', type: FcInputType.password),
    ],
    submitButtonLabel: 'Signing In',
    isLoading: true,
    onSubmit: () {},
  );
}
