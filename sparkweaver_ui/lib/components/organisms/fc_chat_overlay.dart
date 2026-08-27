import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'fc_input_area.dart';

/// Chat Overlay Bottom Sheet (Organism)
///
/// A scrollable, keyboard-aware chat surface designed to be hosted inside
/// [showModalBottomSheet]. Presents the side-chat during a flashcard,
/// MC, or open-answer session so the student can ask clarifying questions
/// without leaving the current question.
///
/// The library does not know the app's ChatMessage type, so the overlay
/// takes an [itemBuilder] + [itemCount] pair — the caller passes in
/// pre-rendered bubble widgets.
///
/// ## Usage
///
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   builder: (_) => FcChatOverlay(
///     itemCount: sideChatMessages.length,
///     itemBuilder: (context, i) => FcChatBubble(
///       message: sideChatMessages[i].content,
///       isUser: sideChatMessages[i].isUser,
///     ),
///     onSend: (text) => coordinator.sendTextInput(text),
///   ),
/// );
/// ```
class FcChatOverlay extends StatefulWidget {
  /// Total number of chat items to render.
  final int itemCount;

  /// Renders one item at [index]. Called at least once per [itemCount].
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Called when the user submits a message from the input area.
  final ValueChanged<String> onSend;

  /// Optional title rendered at the top of the sheet. Defaults to `Ask a question`.
  final String title;

  /// Placeholder inside the input area.
  final String hintText;

  const FcChatOverlay({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onSend,
    this.title = 'Ask a question',
    this.hintText = 'Type your question…',
  });

  @override
  State<FcChatOverlay> createState() => _FcChatOverlayState();
}

class _FcChatOverlayState extends State<FcChatOverlay> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, sheetScrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(SparkweaverTokens.radiusXl),
            ),
          ),
          child: Column(
            children: [
              _buildHandle(colors),
              _buildTitle(colors),
              const Divider(height: 1),
              Expanded(
                child: widget.itemCount == 0
                    ? _buildEmptyState(colors)
                    : ListView.builder(
                        controller: sheetScrollController,
                        padding: SparkweaverSpacing.edgeInsetsMd,
                        itemCount: widget.itemCount,
                        itemBuilder: widget.itemBuilder,
                      ),
              ),
              FcInputArea(
                type: FcInputAreaType.text,
                padding: SparkweaverSpacing.edgeInsetsMd,
                controller: _textController,
                hintText: widget.hintText,
                onSend: widget.onSend,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle(SparkweaverTheme colors) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          // accent4 (#EEEEEE) is exactly colors.gray200 in light mode —
          // the closest themed neutral for this decorative drag handle.
          color: colors.gray200,
          borderRadius: SparkweaverTokens.badgeRadius,
        ),
      ),
    );
  }

  Widget _buildTitle(SparkweaverTheme colors) {
    return Padding(
      padding: SparkweaverSpacing.horizontalMd.copyWith(
        bottom: SparkweaverSpacing.sm,
      ),
      child: Text(
        widget.title,
        style: SparkweaverTypography.heading6.copyWith(
          color: colors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildEmptyState(SparkweaverTheme colors) {
    return Center(
      child: Padding(
        padding: SparkweaverSpacing.edgeInsetsLg,
        child: Text(
          'Ask anything about the current question. The tutor answers here without ending your question.',
          style: SparkweaverTypography.bodyMedium.copyWith(
            color: colors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
