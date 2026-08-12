import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Success Message', type: FcStatusMessage)
Widget successMessage(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcStatusMessage(
        message: 'File uploaded successfully!',
        variant: FcStatusVariant.success,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Error Message', type: FcStatusMessage)
Widget errorMessage(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcStatusMessage(
        message: 'Upload failed. Please try again.',
        variant: FcStatusVariant.error,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Warning Message', type: FcStatusMessage)
Widget warningMessage(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcStatusMessage(
        message: 'File size exceeds recommended limit.',
        variant: FcStatusVariant.warning,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Info Message', type: FcStatusMessage)
Widget infoMessage(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcStatusMessage(
        message: 'Processing your request...',
        variant: FcStatusVariant.info,
      ),
    ),
  );
}

// inlineOnly maps every block style onto baseStyle and zeroes blockSpacing,
// so the heading and list below still parse but add no extra block margin.
@widgetbook.UseCase(
  name: 'Markdown Message (Inline Only)',
  type: FcStatusMessage,
)
Widget markdownMessage(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcStatusMessage(
        message:
            '## Upload Complete\n\n'
            'Detected sections:\n\n'
            '- Chapter 1\n'
            '- Chapter 2\n'
            '- Chapter 3',
        variant: FcStatusVariant.success,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Closeable Message', type: FcStatusMessage)
Widget closeableMessage(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcStatusMessage(
        message: 'This message can be closed.',
        variant: FcStatusVariant.info,
        closeable: true,
        onClose: null, // In real app, this would dismiss
      ),
    ),
  );
}
