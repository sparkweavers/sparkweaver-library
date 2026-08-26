import 'package:sparkweaver_ui/sparkweaver_ui.dart';
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

@widgetbook.UseCase(
  name: 'Confirmation Dialog with back link',
  type: FcConfirmationDialog,
)
Widget confirmationDialogWithBackLink(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Confirmation With Back',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => const FcConfirmationDialog(
              title: 'Nothing left to review',
              message: 'No cards match that filter. Start a full run instead?',
              confirmLabel: 'Practice all questions',
              backLabel: 'Back to topics',
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

@widgetbook.UseCase(name: 'Choice Dialog - Default', type: FcChoiceDialog)
Widget choiceDialogDefault(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Choices',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FcChoiceDialog<String>(
              title: 'What would you like to practice?',
              choices: const [
                FcChoice(value: 'all', label: 'All questions'),
                FcChoice(value: 'wrong', label: 'Only wrong answers'),
              ],
              onSelected: (_) => Navigator.of(ctx).pop(),
              cancelLabel: 'Cancel',
              onCancel: () => Navigator.of(ctx).pop(),
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Choice Dialog - Subtitles', type: FcChoiceDialog)
Widget choiceDialogSubtitles(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Choices',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FcChoiceDialog<String>(
              title: 'What would you like to practice?',
              message: 'Pick a filter for this study set.',
              choices: const [
                FcChoice(
                  value: 'all',
                  label: 'All questions',
                  subtitle: 'All 10 cards again',
                ),
                FcChoice(
                  value: 'wrong',
                  label: 'Only wrong answers',
                  subtitle: '3 cards',
                ),
              ],
              onSelected: (_) => Navigator.of(ctx).pop(),
              cancelLabel: 'Cancel',
              onCancel: () => Navigator.of(ctx).pop(),
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Choice Dialog - No Cancel', type: FcChoiceDialog)
Widget choiceDialogNoCancel(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Choices',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FcChoiceDialog<String>(
              title: 'Pick a study mode',
              choices: const [
                FcChoice(value: 'flashcard', label: 'Flashcards'),
                FcChoice(value: 'quiz', label: 'Multiple choice'),
              ],
              onSelected: (_) => Navigator.of(ctx).pop(),
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Choice Dialog - Primary Row', type: FcChoiceDialog)
Widget choiceDialogPrimaryRow(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Choices',
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FcChoiceDialog<String>(
              title: 'Session already in progress',
              message: 'You have unsaved answers from a previous attempt.',
              choices: const [
                FcChoice(
                  value: 'resume',
                  label: 'Resume session',
                  isPrimary: true,
                ),
                FcChoice(value: 'restart', label: 'Start over'),
              ],
              onSelected: (_) => Navigator.of(ctx).pop(),
              cancelLabel: 'Cancel',
              onCancel: () => Navigator.of(ctx).pop(),
            ),
          );
        },
      ),
    ),
  );
}
