import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_loading_indicator.dart';
import '../molecules/fc_chat_bubble.dart';
import 'fc_empty_state.dart';

/// Message model for conversation list
class ChatMessageData {
  final String content;
  final bool isUser;
  final List<String>? referencedFiles;

  const ChatMessageData({
    required this.content,
    required this.isUser,
    this.referencedFiles,
  });
}

/// Flashcard Conversation List Component (Organism)
///
/// A scrollable conversation list with chat bubbles, infinite scroll, and loading states.
/// Composed from molecules (ChatBubble) and atoms.
///
/// ## Usage
///
/// ```dart
/// FcConversationList(
///   messages: _messages,
///   isLoading: _isLoading,
///   isLoadingMore: _isLoadingMore,
///   hasMoreMessages: _hasMore,
///   onLoadMore: () {
///     // Load more messages
///   },
/// )
///
/// // With typing indicator
/// FcConversationList(
///   messages: _messages,
///   showTypingIndicator: true,
///   typingMessage: 'AI is thinking...',
/// )
/// ```
class FcConversationList extends StatefulWidget {
  /// List of messages to display
  final List<ChatMessageData> messages;

  /// Whether initial loading is in progress
  final bool isLoading;

  /// Whether loading more messages (pagination)
  final bool isLoadingMore;

  /// Whether there are more messages to load
  final bool hasMoreMessages;

  /// Callback to load more messages (infinite scroll)
  final VoidCallback? onLoadMore;

  /// Whether to show typing indicator
  final bool showTypingIndicator;

  /// Typing indicator message
  final String typingMessage;

  /// Scroll controller (optional, will create one if not provided)
  final ScrollController? scrollController;

  /// Whether to reverse the list (new messages at bottom)
  final bool reverse;

  /// Empty state message
  final String emptyStateMessage;

  /// Custom padding
  final EdgeInsetsGeometry? padding;

  const FcConversationList({
    super.key,
    required this.messages,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.hasMoreMessages = true,
    this.onLoadMore,
    this.showTypingIndicator = false,
    this.typingMessage = 'Typing...',
    this.scrollController,
    this.reverse = true,
    this.emptyStateMessage = 'Start a conversation...',
    this.padding,
  });

  @override
  State<FcConversationList> createState() => _FcConversationListState();
}

class _FcConversationListState extends State<FcConversationList> {
  late ScrollController _scrollController;
  bool _isUserScrollController = false;

  @override
  void initState() {
    super.initState();
    if (widget.scrollController != null) {
      _scrollController = widget.scrollController!;
      _isUserScrollController = true;
    } else {
      _scrollController = ScrollController();
    }
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    if (!_isUserScrollController) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  void _onScroll() {
    if (widget.onLoadMore == null) return;
    if (widget.isLoadingMore || !widget.hasMoreMessages) return;

    // Check if scrolled to top (with reverse: true, maxScrollExtent is top)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      widget.onLoadMore?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Loading state
    if (widget.isLoading) {
      return Center(
        child: FcLoadingIndicator(size: FcLoadingSize.large),
      );
    }

    // Empty state
    if (widget.messages.isEmpty && !widget.showTypingIndicator) {
      return FcEmptyState(
        icon: Icons.chat_bubble_outline,
        title: widget.emptyStateMessage,
        iconColor: FlashcardColors.gray400,
      );
    }

    // Messages list
    return ListView.builder(
      controller: _scrollController,
      reverse: widget.reverse,
      padding: widget.padding ?? const EdgeInsets.all(8),
      itemCount: widget.messages.length +
          (widget.showTypingIndicator ? 1 : 0) +
          (widget.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        // Loading more indicator at the end (top with reverse: true)
        if (index == widget.messages.length + (widget.showTypingIndicator ? 1 : 0)) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: FcLoadingIndicator(),
            ),
          );
        }

        // Typing indicator
        if (widget.showTypingIndicator && index == widget.messages.length) {
          return FcChatBubble(
            message: widget.typingMessage,
            isUser: false,
            isTyping: true,
          );
        }

        // Regular message
        final messageIndex = widget.reverse
            ? widget.messages.length - 1 - index
            : index;
        final message = widget.messages[messageIndex];

        return FcChatBubble(
          message: message.content,
          isUser: message.isUser,
          referencedFiles: message.referencedFiles,
        );
      },
    );
  }
}
