import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Content', type: FcMainContentTemplate)
Widget basicContent(BuildContext context) {
  return FcMainContentTemplate(
    title: 'Home',
    body: Column(
      children: List.generate(
        10,
        (index) => ListTile(
          title: Text('Item $index'),
          leading: const Icon(Icons.inbox),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'With FAB', type: FcMainContentTemplate)
Widget withFAB(BuildContext context) {
  return FcMainContentTemplate(
    title: 'Tasks',
    body: const Center(child: Text('Your tasks will appear here')),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );
}

@widgetbook.UseCase(name: 'Scrollable Content', type: FcMainContentTemplate)
Widget scrollableContent(BuildContext context) {
  return FcMainContentTemplate(
    title: 'Articles',
    scrollable: true,
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: FcText('Latest Articles', style: FcTextStyle.heading2),
        ),
        ...List.generate(
          20,
          (index) => Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('Article ${index + 1}'),
              subtitle: const Text('Lorem ipsum dolor sit amet...'),
            ),
          ),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'With Padding', type: FcMainContentTemplate)
Widget withPadding(BuildContext context) {
  return FcMainContentTemplate(
    title: 'Settings',
    padding: const EdgeInsets.all(16),
    body: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FcText('Account Settings', style: FcTextStyle.heading3),
        SizedBox(height: 16),
        FcText('Configure your account preferences', style: FcTextStyle.bodyMedium),
      ],
    ),
  );
}
