import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// FcBanner's factories require `context` (its colour is resolved once at
// construction time, since MaterialBanner has no build(context) of its
// own) and, separately, `MaterialBanner` asserts `actions.isNotEmpty` —
// so every use case below always passes `onDismiss`, never omits it.

@widgetbook.UseCase(name: 'Error Banner', type: FcBanner)
Widget errorBanner(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Error Banner',
        onPressed: () {
          ScaffoldMessenger.of(context).showMaterialBanner(
            FcBanner.error(
              context: context,
              message:
                  'Could not submit your answer. Check your connection '
                  'and try again.',
              onDismiss: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success Banner', type: FcBanner)
Widget successBanner(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Success Banner',
        onPressed: () {
          ScaffoldMessenger.of(context).showMaterialBanner(
            FcBanner.success(
              context: context,
              message: 'Session saved. Your results are ready to review.',
              onDismiss: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Warning Banner', type: FcBanner)
Widget warningBanner(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Warning Banner',
        onPressed: () {
          ScaffoldMessenger.of(context).showMaterialBanner(
            FcBanner.warning(
              context: context,
              message:
                  'You have unanswered questions. Leaving now will end '
                  'the session early.',
              onDismiss: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Info Banner', type: FcBanner)
Widget infoBanner(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Show Info Banner',
        onPressed: () {
          ScaffoldMessenger.of(context).showMaterialBanner(
            FcBanner.info(
              context: context,
              message: 'The tutor is generating feedback for your answer...',
              onDismiss: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            ),
          );
        },
      ),
    ),
  );
}
