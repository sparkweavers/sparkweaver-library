import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FcReconnectPrompt)
Widget defaultReconnectPrompt(BuildContext context) {
  return FcReconnectPrompt(
    subtitle: 'The connection to the AI service was lost.',
    onReconnect: () {},
  );
}

@widgetbook.UseCase(name: 'Reconnecting', type: FcReconnectPrompt)
Widget reconnectingPrompt(BuildContext context) {
  return FcReconnectPrompt(
    subtitle: 'The connection to the AI service was lost.',
    isReconnecting: true,
    onReconnect: () {},
  );
}
