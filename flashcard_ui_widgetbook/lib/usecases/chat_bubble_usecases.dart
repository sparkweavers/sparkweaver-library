import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User Message', type: FcChatBubble)
Widget userMessage(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcChatBubble(
      message: 'Hello, can you help me with my flashcards?',
      isUser: true,
    ),
  );
}

@widgetbook.UseCase(name: 'AI Message', type: FcChatBubble)
Widget aiMessage(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcChatBubble(
      message: 'Of course! I\'d be happy to help you create flashcards.',
      isUser: false,
    ),
  );
}

@widgetbook.UseCase(name: 'AI Message with Files', type: FcChatBubble)
Widget aiMessageWithFiles(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcChatBubble(
      message: 'I found information in the following documents that might help:',
      isUser: false,
      referencedFiles: ['biology_notes.pdf', 'chemistry_chapter_3.pdf', 'history.txt'],
    ),
  );
}

@widgetbook.UseCase(name: 'Typing Indicator', type: FcChatBubble)
Widget typingIndicator(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcChatBubbleVariants.typing(isUser: false),
  );
}

@widgetbook.UseCase(name: 'Conversation Flow', type: FcChatBubble)
Widget conversationFlow(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.all(16.0),
    children: [
      FcChatBubbleVariants.user(
        message: 'Can you create flashcards from my biology notes?',
      ),
      const SizedBox(height: 8),
      FcChatBubbleVariants.ai(
        message: 'I\'ll help you create flashcards from your biology notes. I found these documents:',
        referencedFiles: ['biology_chapter_5.pdf', 'cell_biology.txt'],
      ),
      const SizedBox(height: 8),
      FcChatBubbleVariants.user(
        message: 'Great! Focus on the cell biology notes.',
      ),
      const SizedBox(height: 8),
      FcChatBubbleVariants.ai(
        message: 'Creating flashcards from cell_biology.txt. I\'ll generate questions about cell structure, organelles, and functions.',
        referencedFiles: ['cell_biology.txt'],
      ),
    ],
  );
}

@widgetbook.UseCase(name: 'Long Message', type: FcChatBubble)
Widget longMessage(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16.0),
    child: FcChatBubble(
      message: 'This is a much longer message that demonstrates how the chat bubble handles wrapping text. '
          'The bubble should expand to accommodate the full text while maintaining a maximum width. '
          'This ensures readability and proper layout even with extensive content. '
          'Multiple paragraphs and longer explanations should all be displayed correctly within the bubble.',
      isUser: false,
    ),
  );
}
