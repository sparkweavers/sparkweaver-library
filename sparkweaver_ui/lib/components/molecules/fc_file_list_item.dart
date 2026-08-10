import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Sparkweaver File List Item Component (Molecule)
///
/// A composable file list item showing file icon, name, metadata, and optional action.
/// Used in file upload panels and file management interfaces.
///
/// ## Usage
///
/// ```dart
/// // Basic file item
/// FcFileListItem(
///   filename: 'document.pdf',
///   metadata: '2.4 MB',
/// )
///
/// // File item with delete action
/// FcFileListItem(
///   filename: 'image.png',
///   metadata: '1.2 MB',
///   actionIcon: Icons.delete,
///   onActionPressed: () => print('Delete'),
/// )
///
/// // File item with custom icon
/// FcFileListItem(
///   filename: 'spreadsheet.xlsx',
///   metadata: '543 KB',
///   fileIcon: Icons.table_chart,
/// )
/// ```
class FcFileListItem extends StatelessWidget {
  /// The filename to display
  final String filename;

  /// Metadata text (e.g., file size, date)
  final String? metadata;

  /// File icon (defaults to document icon)
  final IconData? fileIcon;

  /// Action icon (shown at the end)
  final IconData? actionIcon;

  /// Callback when action icon is pressed
  final VoidCallback? onActionPressed;

  /// Action icon color (defaults to error color for delete actions)
  final Color? actionIconColor;

  /// Whether the item is selectable/tappable
  final bool selectable;

  /// Callback when item is tapped (only if selectable)
  final VoidCallback? onTap;

  /// Whether to show the item in dense mode (smaller padding)
  final bool dense;

  const FcFileListItem({
    super.key,
    required this.filename,
    this.metadata,
    this.fileIcon,
    this.actionIcon,
    this.onActionPressed,
    this.actionIconColor,
    this.selectable = false,
    this.onTap,
    this.dense = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final item = Container(
      padding: dense
          ? const EdgeInsets.symmetric(vertical: 6, horizontal: 8)
          : const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        children: [
          // File icon
          FcIcon(
            fileIcon ?? Icons.description,
            size: FcIconSize.medium,
            color: colors.primary,
          ),
          const SizedBox(width: 12),

          // Filename and metadata
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FcText(
                  filename,
                  style: dense ? FcTextStyle.bodySmall : FcTextStyle.bodyMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (metadata != null) ...[
                  const SizedBox(height: 2),
                  FcText(
                    metadata!,
                    style: FcTextStyle.captionSmall,
                    color: colors.textSecondary,
                  ),
                ],
              ],
            ),
          ),

          // Action icon
          if (actionIcon != null && onActionPressed != null) ...[
            const SizedBox(width: 8),
            IconButton(
              icon: FcIcon(
                actionIcon!,
                size: FcIconSize.medium,
                color: actionIconColor ?? colors.error,
              ),
              onPressed: onActionPressed,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ],
      ),
    );

    // Wrap with InkWell if selectable
    if (selectable && onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: item,
      );
    }

    return item;
  }
}
