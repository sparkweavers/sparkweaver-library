import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FcBadge)
Widget defaultBadge(BuildContext context) {
  return const Center(
    child: FcBadge(text: 'document.pdf', icon: Icons.description),
  );
}

@widgetbook.UseCase(name: 'Primary Variant', type: FcBadge)
Widget primaryBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.primary(text: 'Primary', icon: Icons.star),
  );
}

@widgetbook.UseCase(name: 'Success Variant', type: FcBadge)
Widget successBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.success(text: 'Success', icon: Icons.check_circle),
  );
}

@widgetbook.UseCase(name: 'Warning Variant', type: FcBadge)
Widget warningBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.warning(text: 'Warning', icon: Icons.warning),
  );
}

@widgetbook.UseCase(name: 'Error Variant', type: FcBadge)
Widget errorBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.error(text: 'Error', icon: Icons.error),
  );
}

@widgetbook.UseCase(name: 'File Badge', type: FcBadge)
Widget fileBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.file(filename: 'notes.pdf'),
  );
}

@widgetbook.UseCase(name: 'Multiple Badges', type: FcBadge)
Widget multipleBadges(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        FcBadgeVariants.primary(text: 'Primary'),
        FcBadgeVariants.success(text: 'Success'),
        FcBadgeVariants.warning(text: 'Warning'),
        FcBadgeVariants.error(text: 'Error'),
        FcBadgeVariants.info(text: 'Info'),
        FcBadgeVariants.neutral(text: 'Neutral'),
        FcBadgeVariants.file(filename: 'document.pdf'),
        FcBadgeVariants.file(filename: 'presentation.pptx'),
      ],
    ),
  );
}
