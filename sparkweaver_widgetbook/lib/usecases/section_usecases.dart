import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget _body(BuildContext context, String text) => Text(
  text,
  style: SparkweaverTypography.bodyMedium.copyWith(
    color: SparkweaverTheme.of(context).textPrimary,
  ),
);

@widgetbook.UseCase(name: 'Primary Variant', type: FcSection)
Widget primarySection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcSection(
      variant: FcSectionVariant.primary,
      title: 'Your plan',
      child: _body(context, 'The main block of content on this screen.'),
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary Variant', type: FcSection)
Widget secondarySection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcSection(
      variant: FcSectionVariant.secondary,
      title: 'Related topics',
      child: _body(context, 'A supporting block beside the primary one.'),
    ),
  );
}

@widgetbook.UseCase(name: 'Neutral Variant', type: FcSection)
Widget neutralSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcSection(
      title: 'Legal',
      child: _body(context, 'Grouping without emphasis, the default.'),
    ),
  );
}

@widgetbook.UseCase(name: 'Danger Variant', type: FcSection)
Widget dangerSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcSection(
      variant: FcSectionVariant.danger,
      title: 'Danger Zone',
      icon: Icons.warning_amber_rounded,
      child: _body(context, 'Permanently deletes your account and your data.'),
    ),
  );
}

@widgetbook.UseCase(name: 'All Variants', type: FcSection)
Widget allSectionVariants(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FcSection(
          variant: FcSectionVariant.primary,
          title: 'Primary',
          child: _body(context, 'The main block of a screen.'),
        ),
        SparkweaverSpacing.verticalSpaceMd,
        FcSection(
          variant: FcSectionVariant.secondary,
          title: 'Secondary',
          child: _body(context, 'A supporting block.'),
        ),
        SparkweaverSpacing.verticalSpaceMd,
        FcSection(
          title: 'Neutral',
          child: _body(context, 'Grouping without emphasis.'),
        ),
        SparkweaverSpacing.verticalSpaceMd,
        FcSection(
          variant: FcSectionVariant.danger,
          title: 'Danger',
          icon: Icons.warning_amber_rounded,
          child: _body(context, 'Destructive actions live here.'),
        ),
      ],
    ),
  );
}
