import 'package:sparkweaver_ui/sparkweaver_ui.dart';
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
    child: FcBadgeVariants.primary(
      text: 'Primary',
      icon: Icons.star,
      context: context,
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary Variant', type: FcBadge)
Widget secondaryBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.secondary(
      text: 'Current plan',
      icon: Icons.check_circle,
      context: context,
    ),
  );
}

@widgetbook.UseCase(name: 'Success Variant', type: FcBadge)
Widget successBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.success(
      text: 'Success',
      icon: Icons.check_circle,
      context: context,
    ),
  );
}

@widgetbook.UseCase(name: 'Warning Variant', type: FcBadge)
Widget warningBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.warning(
      text: 'Warning',
      icon: Icons.warning,
      context: context,
    ),
  );
}

@widgetbook.UseCase(name: 'Error Variant', type: FcBadge)
Widget errorBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.error(
      text: 'Error',
      icon: Icons.error,
      context: context,
    ),
  );
}

@widgetbook.UseCase(name: 'File Badge', type: FcBadge)
Widget fileBadge(BuildContext context) {
  return Center(
    child: FcBadgeVariants.file(filename: 'notes.pdf', context: context),
  );
}

@widgetbook.UseCase(name: 'Multiple Badges', type: FcBadge)
Widget multipleBadges(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        FcBadgeVariants.primary(text: 'Primary', context: context),
        FcBadgeVariants.secondary(text: 'Secondary', context: context),
        FcBadgeVariants.success(text: 'Success', context: context),
        FcBadgeVariants.warning(text: 'Warning', context: context),
        FcBadgeVariants.error(text: 'Error', context: context),
        FcBadgeVariants.info(text: 'Info', context: context),
        FcBadgeVariants.neutral(text: 'Neutral', context: context),
        FcBadgeVariants.file(filename: 'document.pdf', context: context),
        FcBadgeVariants.file(filename: 'presentation.pptx', context: context),
      ],
    ),
  );
}
