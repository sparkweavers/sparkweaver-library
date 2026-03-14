import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Confirmation Dialog', type: FcConfirmationDialog)
Widget confirmationDialog(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Confirmation',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const FcConfirmationDialog(
              title: 'Delete Item',
              message: 'Are you sure you want to delete this item?',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Destructive Dialog', type: FcConfirmationDialog)
Widget destructiveDialog(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Destructive Dialog',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const FcConfirmationDialog(
              title: 'Delete Account',
              message: 'This action cannot be undone.',
              isDestructive: true,
              confirmLabel: 'Delete',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Form Dialog', type: FcFormDialog)
Widget formDialog(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Form',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const FcFormDialog(
              title: 'Create Topic',
              fields: [
                DialogInputField(label: 'Name', required: true),
                DialogInputField(
                  label: 'Description',
                  type: FcInputType.multiline,
                  maxLines: 2,
                ),
              ],
              submitLabel: 'Create',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Alert Dialog', type: FcAlertDialog)
Widget alertDialog(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Alert',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const FcAlertDialog(
              title: 'Success',
              message: 'Your changes have been saved successfully.',
              icon: Icons.check_circle,
              iconColor: SparkweaverColors.success,
            ),
          );
        },
      ),
    ),
  );
}
