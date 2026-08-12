import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Loading State', type: FcListDetailTemplate)
Widget listLoading(BuildContext context) {
  return FcListDetailTemplate(
    title: 'Topics',
    state: FcListState.loading,
    itemCount: 0,
    itemBuilder: (_, _) => const SizedBox(),
  );
}

@widgetbook.UseCase(name: 'Empty State', type: FcListDetailTemplate)
Widget listEmpty(BuildContext context) {
  return FcListDetailTemplate(
    title: 'Topics',
    state: FcListState.empty,
    emptyStateMessage: 'No topics created yet',
    emptyStateIcon: Icons.topic_outlined,
    emptyStateActionLabel: 'Create Topic',
    onEmptyStateAction: () {},
    itemCount: 0,
    itemBuilder: (_, _) => const SizedBox(),
  );
}

@widgetbook.UseCase(name: 'Error State', type: FcListDetailTemplate)
Widget listError(BuildContext context) {
  return FcListDetailTemplate(
    title: 'Topics',
    state: FcListState.error,
    errorMessage: 'Failed to load topics',
    onRetry: () {},
    itemCount: 0,
    itemBuilder: (_, _) => const SizedBox(),
  );
}

@widgetbook.UseCase(name: 'Loaded State', type: FcListDetailTemplate)
Widget listLoaded(BuildContext context) {
  return FcListDetailTemplate(
    title: 'Topics',
    state: FcListState.loaded,
    itemCount: 5,
    itemBuilder: (context, index) => Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.topic, color: SparkweaverColors.primary),
        title: Text('Topic ${index + 1}'),
        subtitle: const Text('Description of this topic'),
        trailing: const Icon(Icons.chevron_right),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    ),
  );
}
