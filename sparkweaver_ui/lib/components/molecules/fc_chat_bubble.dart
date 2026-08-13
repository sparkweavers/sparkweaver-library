import 'package:flutter/material.dart';
import '../../design_system/theme.dart';
import '../../design_system/spacing.dart';
import '../../design_system/tokens.dart';
import '../../design_system/typography.dart';
import '../atoms/fc_avatar.dart';
import '../atoms/fc_badge.dart';
import '../atoms/fc_markdown_text.dart';

/// A chat bubble component for displaying messages in a conversation
///
/// This component follows SOLID principles:
/// - Single Responsibility: Renders a chat message bubble
/// - Open/Closed: Extensible through parameters without modification
/// - Dependency Inversion: Depends on abstractions (parameters) not concretions
///
/// Usage:
/// ```dart
/// // User message
/// FcChatBubble(
///   message: 'Hello, AI!',
///   isUser: true,
/// )
///
/// // AI message with file references
/// FcChatBubble(
///   message: 'Here is the information from the files...',
///   isUser: false,
///   referencedFiles: ['document.pdf', 'notes.txt'],
/// )
/// ```
class FcChatBubble extends StatelessWidget {
  /// The message text to display
  final String message;

  /// Whether this is a user message (true) or AI message (false)
  final bool isUser;

  /// Whether the message is being typed (shows italic style)
  final bool isTyping;

  /// List of referenced file names to display as badges (AI messages only)
  final List<String>? referencedFiles;

  /// Optional multiple-choice options rendered as tappable chips beneath
  /// the message text (AI messages only). When both [options] and
  /// [onOptionSelected] are provided the chips are enabled and invoke
  /// the callback with the chosen index. When [onOptionSelected] is
  /// omitted the chips are read-only — useful for replaying a past
  /// question in a scrollback where the user already answered.
  ///
  /// Passing an empty list has the same effect as `null` (nothing is
  /// rendered), so upstream callers don't need to guard against it.
  final List<String>? options;

  /// Callback fired when the user taps an option chip. Receives the
  /// 0-based index into [options]. Ignored when [options] is null/empty.
  final void Function(int index)? onOptionSelected;

  /// When non-null and matches an index in [options], that chip is
  /// rendered as "selected" (filled color) — used to show which answer
  /// the user has already submitted in a completed / scrollback view.
  final int? selectedOptionIndex;

  /// Custom avatar widget (overrides default avatar)
  final Widget? avatar;

  /// Custom message text style
  final TextStyle? messageStyle;

  /// Custom bubble background color
  final Color? backgroundColor;

  /// Custom bubble border color
  final Color? borderColor;

  /// When true, message text is rendered as Markdown (headings, **bold**, *italic*, etc.).
  /// When false (default), message is shown as plain text.
  final bool interpretMarkdown;

  const FcChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isTyping = false,
    this.interpretMarkdown = false,
    this.referencedFiles,
    this.options,
    this.onOptionSelected,
    this.selectedOptionIndex,
    this.avatar,
    this.messageStyle,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    final bubbleColor =
        backgroundColor ?? (isUser ? colors.userMessageBg : colors.aiMessageBg);

    final bubbleBorderColor =
        borderColor ?? (isUser ? colors.primary30 : colors.gray30);

    final textColor = isUser ? colors.primary : colors.textPrimary;

    return Padding(
      padding: SparkweaverSpacing.chatBubbleMargin,
      child: Row(
        mainAxisAlignment: isUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI Avatar (left side)
          if (!isUser) ...[
            avatar ?? _buildDefaultAvatar(context: context, isAi: true),
            SparkweaverSpacing.horizontalSpaceSm,
          ],

          // Message Content
          Flexible(
            child: Container(
              padding: SparkweaverSpacing.chatBubblePadding,
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: SparkweaverTokens.chatBubbleRadius,
                border: Border.all(color: bubbleBorderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Message Text (plain or markdown)
                  interpretMarkdown
                      ? FcMarkdownText(
                          data: message,
                          baseStyle:
                              (messageStyle ?? SparkweaverTypography.chatUser)
                                  .copyWith(
                                    color: textColor,
                                    fontStyle: isTyping
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                  ),
                          textColor: textColor,
                        )
                      : Text(
                          message,
                          style:
                              (messageStyle ?? SparkweaverTypography.chatUser)
                                  .copyWith(
                                    color: textColor,
                                    fontStyle: isTyping
                                        ? FontStyle.italic
                                        : FontStyle.normal,
                                  ),
                        ),

                  // Multiple-choice options (AI messages only). Rendered as
                  // ChoiceChips; disabled when [onOptionSelected] is null
                  // (scrollback view of an already-answered question).
                  if (!isUser && options != null && options!.isNotEmpty) ...[
                    SparkweaverSpacing.verticalSpaceSm,
                    Wrap(
                      spacing: SparkweaverSpacing.xs,
                      runSpacing: SparkweaverSpacing.xs,
                      children: List<Widget>.generate(options!.length, (i) {
                        final isSelected = selectedOptionIndex == i;
                        return ChoiceChip(
                          label: Text(options![i]),
                          selected: isSelected,
                          onSelected: onOptionSelected == null
                              ? null
                              : (_) => onOptionSelected!(i),
                          selectedColor: colors.primary30,
                          backgroundColor: colors.aiMessageBg,
                          labelStyle: SparkweaverTypography.bodyMedium.copyWith(
                            color: isSelected ? colors.primary : textColor,
                          ),
                          side: BorderSide(color: colors.primary30),
                        );
                      }),
                    ),
                  ],

                  // File References (AI messages only)
                  if (!isUser &&
                      referencedFiles != null &&
                      referencedFiles!.isNotEmpty) ...[
                    SparkweaverSpacing.verticalSpaceSm,
                    Wrap(
                      spacing: SparkweaverSpacing.xs,
                      runSpacing: SparkweaverSpacing.xs,
                      children: referencedFiles!
                          .map(
                            (filename) => FcBadgeVariants.file(
                              filename: filename,
                              context: context,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // User Avatar (right side)
          if (isUser) ...[
            SparkweaverSpacing.horizontalSpaceSm,
            avatar ?? _buildDefaultAvatar(context: context, isAi: false),
          ],
        ],
      ),
    );
  }

  /// Builds the default avatar widget
  Widget _buildDefaultAvatar({
    required BuildContext context,
    required bool isAi,
  }) {
    return isAi
        ? FcAvatar.ai(size: SparkweaverTokens.avatarSm, context: context)
        : FcAvatar.user(size: SparkweaverTokens.avatarSm, context: context);
  }
}

/// Predefined chat bubble variants
class FcChatBubbleVariants {
  FcChatBubbleVariants._();

  /// User message variant
  static FcChatBubble user({
    required String message,
    bool isTyping = false,
    bool interpretMarkdown = false,
    Widget? avatar,
  }) {
    return FcChatBubble(
      message: message,
      isUser: true,
      isTyping: isTyping,
      interpretMarkdown: interpretMarkdown,
      avatar: avatar,
    );
  }

  /// AI/Assistant message variant
  static FcChatBubble ai({
    required String message,
    List<String>? referencedFiles,
    bool isTyping = false,
    bool interpretMarkdown = false,
    Widget? avatar,
  }) {
    return FcChatBubble(
      message: message,
      isUser: false,
      referencedFiles: referencedFiles,
      isTyping: isTyping,
      interpretMarkdown: interpretMarkdown,
      avatar: avatar,
    );
  }

  /// Typing indicator message
  static FcChatBubble typing({bool isUser = false}) {
    return FcChatBubble(
      message: isUser ? 'Typing...' : 'AI is thinking...',
      isUser: isUser,
      isTyping: true,
    );
  }
}
