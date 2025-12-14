import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';
import '../molecules/fc_file_list_item.dart';
import '../molecules/fc_status_message.dart';

/// File Upload Panel Component (Organism)
///
/// A complete file upload interface with button, status, and file list.
/// Composed from molecules and atoms following atomic design.
///
/// ## Usage
///
/// ```dart
/// FcFileUploadPanel(
///   title: 'Upload Files',
///   description: 'Upload documents to use as context',
///   supportedFormats: ['PDF', 'TXT', 'MD'],
///   uploadedFiles: _files,
///   isUploading: _isUploading,
///   statusMessage: _statusMessage,
///   statusVariant: _statusVariant,
///   onUpload: () async {
///     // File picker logic
///   },
///   onFileRemove: (index) {
///     // Remove file logic
///   },
/// )
/// ```
class FcFileUploadPanel extends StatelessWidget {
  /// Panel title
  final String title;

  /// Panel description
  final String? description;

  /// Supported file formats (e.g., ['PDF', 'TXT', 'MD'])
  final List<String>? supportedFormats;

  /// List of uploaded files (filename, size)
  final List<FileInfo>? uploadedFiles;

  /// Whether upload is in progress
  final bool isUploading;

  /// Status message to display
  final String? statusMessage;

  /// Status message variant
  final FcStatusVariant? statusVariant;

  /// Callback when upload button is pressed
  final VoidCallback onUpload;

  /// Callback when file is removed (receives file index)
  final void Function(int)? onFileRemove;

  /// Upload button label
  final String uploadButtonLabel;

  const FcFileUploadPanel({
    super.key,
    this.title = 'Upload Files',
    this.description,
    this.supportedFormats,
    this.uploadedFiles,
    this.isUploading = false,
    this.statusMessage,
    this.statusVariant,
    required this.onUpload,
    this.onFileRemove,
    this.uploadButtonLabel = 'Choose File',
  });

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                FcIcon(
                  Icons.upload_file,
                  color: colors.primary,
                ),
                const SizedBox(width: 8),
                FcText(
                  title,
                  style: FcTextStyle.heading4,
                ),
              ],
            ),

            // Description
            if (description != null) ...[
              const SizedBox(height: 8),
              FcText(
                description!,
                style: FcTextStyle.bodySmall,
                color: colors.textSecondary,
              ),
            ],

            const SizedBox(height: 16),

            // Upload Button
            FcButton(
              label: uploadButtonLabel,
              icon: isUploading ? null : Icons.add_circle_outline,
              onPressed: isUploading ? null : onUpload,
              isLoading: isUploading,
              fullWidth: true,
            ),

            // Status Message
            if (statusMessage != null && statusVariant != null) ...[
              const SizedBox(height: 12),
              FcStatusMessage(
                message: statusMessage!,
                variant: statusVariant!,
              ),
            ],

            // Uploaded Files List
            if (uploadedFiles != null && uploadedFiles!.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              FcText(
                'Uploaded Files:',
                style: FcTextStyle.labelMedium,
              ),
              const SizedBox(height: 8),
              ...uploadedFiles!.asMap().entries.map((entry) {
                final index = entry.key;
                final file = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: FcFileListItem(
                    filename: file.filename,
                    metadata: file.size,
                    actionIcon: onFileRemove != null ? Icons.delete_outline : null,
                    onActionPressed: onFileRemove != null
                        ? () => onFileRemove!(index)
                        : null,
                    actionIconColor: colors.error,
                    dense: true,
                  ),
                );
              }),
            ],

            // Supported Formats
            if (supportedFormats != null && supportedFormats!.isNotEmpty) ...[
              const SizedBox(height: 16),
              FcText(
                'Supported: ${supportedFormats!.join(', ')}',
                style: FcTextStyle.captionSmall,
                color: colors.textSecondary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// File information model
class FileInfo {
  final String filename;
  final String size;

  const FileInfo({
    required this.filename,
    required this.size,
  });
}
