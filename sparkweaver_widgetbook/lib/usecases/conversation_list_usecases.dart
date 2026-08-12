import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final _sampleMessages = [
  const ChatMessageData(
    content: 'Hello! How can I help you today?',
    isUser: false,
  ),
  const ChatMessageData(
    content: 'I have a question about the product.',
    isUser: true,
  ),
  const ChatMessageData(
    content: 'I\'d be happy to help! What would you like to know?',
    isUser: false,
    referencedFiles: ['product-guide.pdf'],
  ),
];

@widgetbook.UseCase(name: 'Basic Conversation', type: FcConversationList)
Widget basicConversation(BuildContext context) {
  return FcConversationList(messages: _sampleMessages);
}

@widgetbook.UseCase(name: 'With Typing Indicator', type: FcConversationList)
Widget withTyping(BuildContext context) {
  return FcConversationList(
    messages: _sampleMessages,
    showTypingIndicator: true,
  );
}

@widgetbook.UseCase(name: 'Empty Conversation', type: FcConversationList)
Widget emptyConversation(BuildContext context) {
  return const FcConversationList(messages: []);
}

@widgetbook.UseCase(name: 'Loading', type: FcConversationList)
Widget loadingConversation(BuildContext context) {
  return const FcConversationList(messages: [], isLoading: true);
}

final _markdownMessages = [
  const ChatMessageData(
    content: 'Can you summarize the water cycle for me?',
    isUser: true,
  ),
  const ChatMessageData(
    content:
        '## The Water Cycle\n\n'
        'The water cycle has three main stages:\n\n'
        '- **Evaporation**: water turns into vapor\n'
        '- **Condensation**: vapor forms *clouds*\n'
        '- **Precipitation**: water falls as rain, measured in units '
        'like `mm/year`\n\n'
        'See the [water cycle overview](https://example.com/water-cycle) '
        'for diagrams.',
    isUser: false,
    referencedFiles: ['earth-science-notes.pdf'],
  ),
];

// FcConversationList sets interpretMarkdown: !message.isUser, so only the
// AI reply below renders as Markdown; the user question stays plain text.
@widgetbook.UseCase(name: 'AI Response With Markdown', type: FcConversationList)
Widget aiResponseWithMarkdown(BuildContext context) {
  return FcConversationList(messages: _markdownMessages);
}
