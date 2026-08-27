import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FcChatErrorRow)
Widget defaultChatErrorRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcChatErrorRow(
      message: 'Could not send message. Check your connection.',
      onReconnect: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Long Message', type: FcChatErrorRow)
Widget longMessageChatErrorRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcChatErrorRow(
      message:
          'The connection to the AI service was lost while your last '
          'message was sending. This can happen when the app is moved to '
          'the background or the network drops out. Tap Reconnect to '
          'resend the message without retyping it.',
      onReconnect: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Reconnecting', type: FcChatErrorRow)
Widget reconnectingChatErrorRow(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: FcChatErrorRow(
      message: 'Could not send message. Check your connection.',
      isReconnecting: true,
      onReconnect: () {},
    ),
  );
}
