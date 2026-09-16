import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// FcSnackBar extends SnackBar and its factories need `context`, so each
// case shows it from a button via `ScaffoldMessenger.of(context).showSnackBar`.

@widgetbook.UseCase(name: 'Success SnackBar', type: FcSnackBar)
Widget successSnackBar(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Success SnackBar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            FcSnackBar.success(
              context: context,
              message: 'Session saved. Your results are ready to review.',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Error SnackBar', type: FcSnackBar)
Widget errorSnackBar(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Error SnackBar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            FcSnackBar.error(
              context: context,
              message:
                  'Could not submit your answer. Check your connection '
                  'and try again.',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Warning SnackBar', type: FcSnackBar)
Widget warningSnackBar(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Warning SnackBar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            FcSnackBar.warning(
              context: context,
              message:
                  'You have unanswered questions. Leaving now will end '
                  'the session early.',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Info SnackBar', type: FcSnackBar)
Widget infoSnackBar(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Info SnackBar',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            FcSnackBar.info(
              context: context,
              message: 'The tutor is generating feedback for your answer...',
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'SnackBar with Action', type: FcSnackBar)
Widget snackBarWithAction(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show SnackBar with Action',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            FcSnackBar.error(
              context: context,
              message: 'Could not submit your answer.',
              action: (label: 'Retry', onPressed: () {}),
            ),
          );
        },
      ),
    ),
  );
}
