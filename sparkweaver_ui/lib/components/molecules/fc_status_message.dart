import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';

/// Status Message Variant
enum FcStatusVariant {
  /// Success status (green)
  success,

  /// Error status (red)
  error,

  /// Warning status (orange)
  warning,

  /// Info status (blue)
  info,
}

/// Flashcard Status Message Component (Molecule)
///
/// A composable status/feedback message combining icon + text.
/// Used for showing success, error, warning, or info messages.
///
/// ## Usage
///
/// ```dart
/// // Success message
/// FcStatusMessage(
///   message: 'File uploaded successfully!',
///   variant: FcStatusVariant.success,
/// )
///
/// // Error message
/// FcStatusMessage(
///   message: 'Upload failed. Please try again.',
///   variant: FcStatusVariant.error,
/// )
///
/// // Auto-dismissible message
/// FcStatusMessage(
///   message: 'Changes saved',
///   variant: FcStatusVariant.success,
///   autoDismiss: true,
///   onDismiss: () => print('Dismissed'),
/// )
///
/// // Closeable message
/// FcStatusMessage(
///   message: 'This is a warning',
///   variant: FcStatusVariant.warning,
///   closeable: true,
///   onClose: () => print('Closed'),
/// )
/// ```
class FcStatusMessage extends StatefulWidget {
  /// The status message text
  final String message;

  /// Status variant (determines color and icon)
  final FcStatusVariant variant;

  /// Whether the message is closeable (shows close button)
  final bool closeable;

  /// Callback when close button is pressed
  final VoidCallback? onClose;

  /// Whether to auto-dismiss after duration
  final bool autoDismiss;

  /// Auto-dismiss duration (defaults to 3 seconds)
  final Duration autoDismissDuration;

  /// Callback when auto-dismissed
  final VoidCallback? onDismiss;

  const FcStatusMessage({
    super.key,
    required this.message,
    this.variant = FcStatusVariant.info,
    this.closeable = false,
    this.onClose,
    this.autoDismiss = false,
    this.autoDismissDuration = const Duration(seconds: 3),
    this.onDismiss,
  });

  @override
  State<FcStatusMessage> createState() => _FcStatusMessageState();
}

class _FcStatusMessageState extends State<FcStatusMessage> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    if (widget.autoDismiss) {
      Future.delayed(widget.autoDismissDuration, () {
        if (mounted && _visible) {
          setState(() => _visible = false);
          widget.onDismiss?.call();
        }
      });
    }
  }

  IconData _getIcon() {
    switch (widget.variant) {
      case FcStatusVariant.success:
        return Icons.check_circle_outline;
      case FcStatusVariant.error:
        return Icons.error_outline;
      case FcStatusVariant.warning:
        return Icons.warning_amber_outlined;
      case FcStatusVariant.info:
        return Icons.info_outline;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    switch (widget.variant) {
      case FcStatusVariant.success:
        return colors.successLight.withValues(alpha: 0.1);
      case FcStatusVariant.error:
        return colors.errorLight.withValues(alpha: 0.1);
      case FcStatusVariant.warning:
        return colors.warningLight.withValues(alpha: 0.1);
      case FcStatusVariant.info:
        return colors.infoLight.withValues(alpha: 0.1);
    }
  }

  Color _getForegroundColor(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    switch (widget.variant) {
      case FcStatusVariant.success:
        return colors.success;
      case FcStatusVariant.error:
        return colors.error;
      case FcStatusVariant.warning:
        return colors.warningDark;
      case FcStatusVariant.info:
        return colors.info;
    }
  }

  void _handleClose() {
    setState(() => _visible = false);
    widget.onClose?.call();
  }

  @override
  Widget build(BuildContext context) {
    if (!_visible) {
      return const SizedBox.shrink();
    }

    final foregroundColor = _getForegroundColor(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          FcIcon(
            _getIcon(),
            size: FcIconSize.medium,
            color: foregroundColor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FcText(
              widget.message,
              style: FcTextStyle.bodySmall,
              color: foregroundColor,
            ),
          ),
          if (widget.closeable && widget.onClose != null) ...[
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _handleClose,
              child: FcIcon(
                Icons.close,
                size: FcIconSize.small,
                color: foregroundColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
