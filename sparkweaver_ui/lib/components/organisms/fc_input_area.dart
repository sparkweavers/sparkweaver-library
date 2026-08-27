import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_input_field.dart';

/// Input Area Type
enum FcInputAreaType {
  /// Text input
  text,

  /// Text with file attachment
  textWithAttachment,
}

/// Sparkweaver Input Area Component (Organism)
///
/// A composable input area for chat, messaging, or any input interface.
/// Combines input field + send/attach action button.
///
/// ## Usage
///
/// ```dart
/// FcInputArea(
///   controller: _controller,
///   hintText: 'Type a message...',
///   onSend: (text) {
///     print('Sending: $text');
///   },
/// )
///
/// // With character count
/// FcInputArea(
///   controller: _controller,
///   maxLength: 280,
///   showCounter: true,
///   onSend: (text) => print(text),
/// )
/// ```
class FcInputArea extends StatefulWidget {
  /// Input area type
  final FcInputAreaType type;

  /// Text editing controller
  final TextEditingController? controller;

  /// Hint text
  final String? hintText;

  /// Maximum length
  final int? maxLength;

  /// Whether to show character counter
  final bool showCounter;

  /// Whether the input is disabled
  final bool disabled;

  /// Callback when send button is pressed (receives text)
  final ValueChanged<String>? onSend;

  /// Callback when attachment button is pressed (textWithAttachment type)
  final VoidCallback? onAttachment;

  /// Whether send action is in progress
  final bool isSending;

  /// Send button icon (defaults to send icon)
  final IconData? sendIcon;

  /// Attachment button icon (defaults to attach_file icon)
  final IconData? attachmentIcon;

  /// Content padding, layered inside the bottom-inset padding this widget
  /// adds around itself.
  final EdgeInsetsGeometry padding;

  const FcInputArea({
    super.key,
    this.type = FcInputAreaType.text,
    this.controller,
    this.hintText,
    this.maxLength,
    this.showCounter = false,
    this.disabled = false,
    this.onSend,
    this.onAttachment,
    this.isSending = false,
    this.sendIcon,
    this.attachmentIcon,
    this.padding = SparkweaverSpacing.edgeInsetsLg,
  });

  @override
  State<FcInputArea> createState() => _FcInputAreaState();
}

class _FcInputAreaState extends State<FcInputArea> {
  late TextEditingController _controller;
  bool _isUserController = false;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
      _isUserController = true;
    } else {
      _controller = TextEditingController();
    }
  }

  @override
  void dispose() {
    if (!_isUserController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && widget.onSend != null) {
      widget.onSend!(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final bottomInset =
        mediaQuery.viewInsets.bottom + mediaQuery.padding.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
          color: colors.surface,
          border: Border(top: BorderSide(color: colors.borderLight, width: 1)),
        ),
        child: Row(
          children: [
            // Attachment button (textWithAttachment type)
            if (widget.type == FcInputAreaType.textWithAttachment &&
                widget.onAttachment != null) ...[
              IconButton(
                icon: FcIcon(
                  widget.attachmentIcon ?? Icons.attach_file,
                  color: colors.textSecondary,
                  size: FcIconSize.medium,
                ),
                onPressed: widget.disabled ? null : widget.onAttachment,
              ),
              const SizedBox(width: 8),
            ],

            Expanded(
              child: FcInputField(
                controller: _controller,
                type: FcInputType.multiline,
                hintText: widget.hintText ?? 'Type a message...',
                maxLines: 4,
                minLines: 1,
                textInputAction: TextInputAction.send,
                maxLength: widget.maxLength,
                showCounter: widget.showCounter,
                enabled: !widget.disabled && !widget.isSending,
                onSubmitted: (_) => _handleSend(),
              ),
            ),

            const SizedBox(width: 12),

            FcButton.icon(
              icon: widget.sendIcon ?? Icons.send,
              onPressed: widget.disabled || widget.isSending
                  ? null
                  : _handleSend,
              variant: FcButtonVariant.primary,
              isLoading: widget.isSending,
            ),
          ],
        ),
      ),
    );
  }
}
