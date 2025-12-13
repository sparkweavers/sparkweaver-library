import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Simple Header', type: FcHeader)
Widget simpleHeader(BuildContext context) {
  return const Scaffold(
    appBar: FcHeader(title: 'My App'),
    body: Center(child: Text('Content goes here')),
  );
}

@widgetbook.UseCase(name: 'With Actions', type: FcHeader)
Widget headerWithActions(BuildContext context) {
  return Scaffold(
    appBar: FcHeader(
      title: 'Settings',
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    ),
    body: const Center(child: Text('Content goes here')),
  );
}

@widgetbook.UseCase(name: 'With Back Button', type: FcHeader)
Widget headerWithBack(BuildContext context) {
  return Scaffold(
    appBar: FcHeader(
      title: 'Details',
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    ),
    body: const Center(child: Text('Content goes here')),
  );
}

@widgetbook.UseCase(name: 'Centered Title', type: FcHeader)
Widget centeredHeader(BuildContext context) {
  return const Scaffold(
    appBar: FcHeader(
      title: 'Centered Title',
      centerTitle: true,
    ),
    body: Center(child: Text('Content goes here')),
  );
}
