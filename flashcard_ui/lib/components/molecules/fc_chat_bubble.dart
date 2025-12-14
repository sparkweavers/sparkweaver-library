import 'package:flutter/material.dart';
import '../../design_system/color_scheme.dart';
import '../../design_system/spacing.dart';
import '../../design_system/tokens.dart';
import '../../design_system/typography.dart';
import '../atoms/fc_avatar.dart';
import '../atoms/fc_badge.dart';

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

  /// Custom avatar widget (overrides default avatar)
  final Widget? avatar;

  /// Custom message text style
  final TextStyle? messageStyle;

  /// Custom bubble background color
  final Color? backgroundColor;

  /// Custom bubble border color
  final Color? borderColor;

  const FcChatBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.isTyping = false,
    this.referencedFiles,
    this.avatar,
    this.messageStyle,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    final bubbleColor = backgroundColor ??
        (isUser
            ? colors.userMessageBg
            : colors.aiMessageBg);

    final bubbleBorderColor = borderColor ??
        (isUser
            ? colors.primary30
            : colors.gray30);

    final textColor = isUser ? colors.primary : colors.textPrimary;

    return Padding(
      padding: FlashcardSpacing.chatBubbleMargin,
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI Avatar (left side)
          if (!isUser) ...[
            avatar ?? _buildDefaultAvatar(context: context, isAi: true),
            FlashcardSpacing.horizontalSpaceSm,
          ],

          // Message Content
          Flexible(
            child: Container(
              padding: FlashcardSpacing.chatBubblePadding,
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: FlashcardTokens.chatBubbleRadius,
                border: Border.all(color: bubbleBorderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Message Text
                  Text(
                    message,
                    style: (messageStyle ?? FlashcardTypography.chatUser).copyWith(
                      color: textColor,
                      fontStyle: isTyping ? FontStyle.italic : FontStyle.normal,
                    ),
                  ),

                  // File References (AI messages only)
                  if (!isUser && referencedFiles != null && referencedFiles!.isNotEmpty) ...[
                    FlashcardSpacing.verticalSpaceSm,
                    Wrap(
                      spacing: FlashcardSpacing.xs,
                      runSpacing: FlashcardSpacing.xs,
                      children: referencedFiles!
                          .map((filename) => FcBadgeVariants.file(filename: filename, context: context))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // User Avatar (right side)
          if (isUser) ...[
            FlashcardSpacing.horizontalSpaceSm,
            avatar ?? _buildDefaultAvatar(context: context, isAi: false),
          ],
        ],
      ),
    );
  }

  /// Builds the default avatar widget
  Widget _buildDefaultAvatar({required BuildContext context, required bool isAi}) {
    return isAi
        ? FcAvatar.ai(size: FlashcardTokens.avatarSm, context: context)
        : FcAvatar.user(size: FlashcardTokens.avatarSm, context: context);
  }
}

/// Predefined chat bubble variants
class FcChatBubbleVariants {
  FcChatBubbleVariants._();

  /// User message variant
  static FcChatBubble user({
    required String message,
    bool isTyping = false,
    Widget? avatar,
  }) {
    return FcChatBubble(
      message: message,
      isUser: true,
      isTyping: isTyping,
      avatar: avatar,
    );
  }

  /// AI/Assistant message variant
  static FcChatBubble ai({
    required String message,
    List<String>? referencedFiles,
    bool isTyping = false,
    Widget? avatar,
  }) {
    return FcChatBubble(
      message: message,
      isUser: false,
      referencedFiles: referencedFiles,
      isTyping: isTyping,
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
