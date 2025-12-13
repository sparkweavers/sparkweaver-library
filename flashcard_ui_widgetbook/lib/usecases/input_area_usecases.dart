import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Text Input Area', type: FcInputArea)
Widget textInputArea(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Chat messages would go here')),
    bottomNavigationBar: FcInputArea(
      hintText: 'Type a message...',
      onSend: (text) {},
    ),
  );
}

@widgetbook.UseCase(name: 'Voice Input Area', type: FcInputArea)
Widget voiceInputArea(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Voice messages would go here')),
    bottomNavigationBar: FcInputArea(
      type: FcInputAreaType.voice,
      onRecord: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'With Attachment', type: FcInputArea)
Widget withAttachment(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Messages with attachments')),
    bottomNavigationBar: FcInputArea(
      type: FcInputAreaType.textWithAttachment,
      hintText: 'Type a message...',
      onSend: (text) {},
      onAttachment: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Recording State', type: FcInputArea)
Widget recordingState(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Recording...')),
    bottomNavigationBar: FcInputArea(
      type: FcInputAreaType.voice,
      isRecording: true,
      onRecord: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Sending State', type: FcInputArea)
Widget sendingState(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Sending...')),
    bottomNavigationBar: FcInputArea(
      hintText: 'Type a message...',
      isSending: true,
      onSend: (text) {},
    ),
  );
}
