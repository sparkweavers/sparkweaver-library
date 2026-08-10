import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _conversation = [
  (message: 'What does mitochondria mean, literally?', isUser: true),
  (
    message:
        'It comes from the Greek "mitos" (thread) and "khondrion" '
        '(granule) — early microscopists were describing their shape, not '
        'their function.',
    isUser: false,
  ),
  (message: 'So the "powerhouse of the cell" name came later?', isUser: true),
  (
    message:
        'Exactly. That description refers to their role in producing '
        'ATP through cellular respiration, which was only understood much '
        'later.',
    isUser: false,
  ),
];

@widgetbook.UseCase(name: 'With Messages', type: FcChatOverlay)
Widget withMessages(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Open Side Chat',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => FcChatOverlay(
              itemCount: _conversation.length,
              itemBuilder: (context, i) {
                final entry = _conversation[i];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FcChatBubble(
                    message: entry.message,
                    isUser: entry.isUser,
                  ),
                );
              },
              onSend: (text) {},
            ),
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Empty State', type: FcChatOverlay)
Widget emptyState(BuildContext context) {
  return Scaffold(
    body: Center(
      child: FcButton(
        label: 'Open Side Chat',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => FcChatOverlay(
              itemCount: 0,
              itemBuilder: (context, i) => const SizedBox.shrink(),
              onSend: (text) {},
            ),
          );
        },
      ),
    ),
  );
}
