import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic File Item', type: FcFileListItem)
Widget basicFileItem(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcFileListItem(filename: 'document.pdf', metadata: '2.4 MB'),
    ),
  );
}

@widgetbook.UseCase(name: 'With Delete Action', type: FcFileListItem)
Widget fileItemWithAction(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcFileListItem(
        filename: 'presentation.pptx',
        metadata: '5.2 MB',
        actionIcon: Icons.delete_outline,
        onActionPressed: () {},
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Dense Mode', type: FcFileListItem)
Widget denseFileItem(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: FcFileListItem(
        filename: 'notes.txt',
        metadata: '128 KB',
        dense: true,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'File List', type: FcFileListItem)
Widget fileList(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FcFileListItem(
            filename: 'report.pdf',
            metadata: '3.1 MB',
            actionIcon: Icons.delete_outline,
            onActionPressed: () {},
          ),
          const Divider(height: 1),
          FcFileListItem(
            filename: 'image.png',
            metadata: '890 KB',
            fileIcon: Icons.image,
            actionIcon: Icons.delete_outline,
            onActionPressed: () {},
          ),
          const Divider(height: 1),
          FcFileListItem(
            filename: 'spreadsheet.xlsx',
            metadata: '456 KB',
            fileIcon: Icons.table_chart,
            actionIcon: Icons.delete_outline,
            onActionPressed: () {},
          ),
        ],
      ),
    ),
  );
}
