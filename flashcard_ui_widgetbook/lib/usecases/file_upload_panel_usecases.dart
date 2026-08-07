import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Empty Panel', type: FcFileUploadPanel)
Widget emptyPanel(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcFileUploadPanel(
        description: 'Upload documents to use as context',
        supportedFormats: const ['PDF', 'TXT', 'MD'],
        onUpload: () {},
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With Files', type: FcFileUploadPanel)
Widget panelWithFiles(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcFileUploadPanel(
        description: 'Upload documents to use as context',
        supportedFormats: const ['PDF', 'TXT', 'MD'],
        uploadedFiles: const [
          FileInfo(filename: 'document.pdf', size: '2.4 MB'),
          FileInfo(filename: 'notes.txt', size: '128 KB'),
        ],
        onUpload: () {},
        onFileRemove: (index) {},
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Uploading', type: FcFileUploadPanel)
Widget uploading(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcFileUploadPanel(
        description: 'Upload documents to use as context',
        supportedFormats: const ['PDF', 'TXT', 'MD'],
        isUploading: true,
        onUpload: () {},
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Success Message', type: FcFileUploadPanel)
Widget successMessage(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcFileUploadPanel(
        description: 'Upload documents to use as context',
        supportedFormats: const ['PDF', 'TXT', 'MD'],
        statusMessage: 'File uploaded successfully!',
        statusVariant: FcStatusVariant.success,
        onUpload: () {},
      ),
    ),
  );
}
