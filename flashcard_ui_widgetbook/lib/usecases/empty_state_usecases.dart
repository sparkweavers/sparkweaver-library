import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Empty State', type: FcEmptyState)
Widget basicEmptyState(BuildContext context) {
  return FcEmptyState(
    icon: Icons.inbox_outlined,
    title: 'No messages yet',
    subtitle: 'Start a conversation to see messages here',
  );
}

@widgetbook.UseCase(name: 'With Action Button', type: FcEmptyState)
Widget emptyStateWithAction(BuildContext context) {
  return FcEmptyState(
    icon: Icons.topic_outlined,
    title: 'No topics created yet',
    subtitle: 'Create a topic to organize your documents',
    actionLabel: 'Create Topic',
    onAction: () {},
  );
}

@widgetbook.UseCase(name: 'Search Results', type: FcEmptyState)
Widget searchEmptyState(BuildContext context) {
  return FcEmptyState(
    icon: Icons.search_off,
    iconColor: SparkweaverColors.warning,
    title: 'No results found',
    subtitle: 'Try adjusting your search criteria',
  );
}
