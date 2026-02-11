import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_input_field.dart';

/// Input Area Type
enum FcInputAreaType {
  /// Text input
  text,

  /// Voice input
  voice,

  /// Text with file attachment
  textWithAttachment,

  /// Text input with push-to-talk microphone
  textWithVoice,
}

/// Flashcard Input Area Component (Organism)
///
/// A composable input area for chat, messaging, or any input interface.
/// Combines input field + action button (send/record/attach).
///
/// ## Usage
///
/// ```dart
/// // Text input area
/// FcInputArea(
///   controller: _controller,
///   hintText: 'Type a message...',
///   onSend: (text) {
///     print('Sending: $text');
///   },
/// )
///
/// // Voice input area
/// FcInputArea(
///   type: FcInputAreaType.voice,
///   isRecording: _isRecording,
///   onRecord: () {
///     // Toggle recording
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

  /// Callback when record button is pressed (voice type)
  final VoidCallback? onRecord;

  /// Callback when mic press starts (push-to-talk)
  final VoidCallback? onMicPressStart;

  /// Callback when mic press ends/cancels (push-to-talk)
  final VoidCallback? onMicPressEnd;

  /// Callback when attachment button is pressed (textWithAttachment type)
  final VoidCallback? onAttachment;

  /// Whether recording is active (voice type)
  final bool isRecording;

  /// Whether send action is in progress
  final bool isSending;

  /// Send button icon (defaults to send icon)
  final IconData? sendIcon;

  /// Record button icon (defaults to mic icon)
  final IconData? recordIcon;

  /// Attachment button icon (defaults to attach_file icon)
  final IconData? attachmentIcon;

  /// Send button label (shown when recording)
  final String sendLabel;

  /// Record button label
  final String recordLabel;

  /// Outer container padding
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
    this.onRecord,
    this.onMicPressStart,
    this.onMicPressEnd,
    this.onAttachment,
    this.isRecording = false,
    this.isSending = false,
    this.sendIcon,
    this.recordIcon,
    this.attachmentIcon,
    this.sendLabel = 'Send',
    this.recordLabel = 'Record',
    this.padding = const EdgeInsets.all(16),
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

  void _handleMicPressStart() {
    if (widget.disabled) return;
    if (widget.onMicPressStart != null) {
      widget.onMicPressStart!();
      return;
    }
    if (widget.onRecord != null) {
      widget.onRecord!();
    }
  }

  void _handleMicPressEnd() {
    if (widget.disabled) return;
    if (widget.onMicPressEnd != null) {
      widget.onMicPressEnd!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(
          top: BorderSide(
            color: colors.borderLight,
            width: 1,
          ),
        ),
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

          // Input field (text types)
          if (widget.type == FcInputAreaType.text ||
              widget.type == FcInputAreaType.textWithAttachment ||
              widget.type == FcInputAreaType.textWithVoice)
            Expanded(
              child: FcInputField(
                controller: _controller,
                type: widget.type == FcInputAreaType.textWithVoice
                    ? FcInputType.text
                    : FcInputType.multiline,
                hintText: widget.hintText ?? 'Type a message...',
                maxLines: widget.type == FcInputAreaType.textWithVoice ? 1 : 4,
                minLines: 1,
                textInputAction: TextInputAction.send,
                maxLength: widget.maxLength,
                showCounter: widget.showCounter,
                enabled: !widget.disabled && !widget.isSending && !widget.isRecording,
                onSubmitted: (_) => _handleSend(),
              ),
            ),

          const SizedBox(width: 12),

          // Action button
          if (widget.type == FcInputAreaType.voice ||
              widget.type == FcInputAreaType.textWithVoice)
            // Voice recording button (push-to-talk when onMicPressStart/onMicPressEnd are provided)
            GestureDetector(
              onTapDown: (_) => _handleMicPressStart(),
              onTapUp: (_) => _handleMicPressEnd(),
              onTapCancel: _handleMicPressEnd,
              child: FcButton.icon(
                icon: widget.isRecording
                    ? (widget.sendIcon ?? Icons.graphic_eq)
                    : (widget.recordIcon ?? Icons.mic),
                onPressed: widget.disabled ? null : () {},
                variant: FcButtonVariant.primary,
              ),
            )
          else
            // Send button
            FcButton.icon(
              icon: widget.sendIcon ?? Icons.send,
              onPressed: widget.disabled || widget.isSending ? null : _handleSend,
              variant: FcButtonVariant.primary,
              isLoading: widget.isSending,
            ),
        ],
      ),
    );
  }
}
