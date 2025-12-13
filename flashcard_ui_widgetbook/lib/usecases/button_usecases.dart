import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Primary Button', type: FcButton)
Widget primaryButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Primary Button',
      onPressed: () {},
      variant: FcButtonVariant.primary,
    ),
  );
}

@widgetbook.UseCase(name: 'Secondary Button', type: FcButton)
Widget secondaryButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Secondary Button',
      onPressed: () {},
      variant: FcButtonVariant.secondary,
    ),
  );
}

@widgetbook.UseCase(name: 'Outlined Button', type: FcButton)
Widget outlinedButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Outlined Button',
      onPressed: () {},
      variant: FcButtonVariant.outlined,
    ),
  );
}

@widgetbook.UseCase(name: 'Text Button', type: FcButton)
Widget textButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Text Button',
      onPressed: () {},
      variant: FcButtonVariant.text,
    ),
  );
}

@widgetbook.UseCase(name: 'Destructive Button', type: FcButton)
Widget destructiveButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Delete',
      onPressed: () {},
      variant: FcButtonVariant.destructive,
    ),
  );
}

@widgetbook.UseCase(name: 'Button with Icon', type: FcButton)
Widget buttonWithIcon(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Upload',
      icon: Icons.upload,
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Only Button', type: FcButton)
Widget iconOnlyButton(BuildContext context) {
  return Center(
    child: FcButton.icon(
      icon: Icons.delete,
      onPressed: () {},
      variant: FcButtonVariant.destructive,
    ),
  );
}

@widgetbook.UseCase(name: 'Loading Button', type: FcButton)
Widget loadingButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Processing',
      onPressed: null,
      isLoading: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled Button', type: FcButton)
Widget disabledButton(BuildContext context) {
  return Center(
    child: FcButton(
      label: 'Disabled',
      onPressed: null,
    ),
  );
}

@widgetbook.UseCase(name: 'Full Width Button', type: FcButton)
Widget fullWidthButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: FcButton(
      label: 'Full Width',
      onPressed: () {},
      fullWidth: true,
    ),
  );
}

@widgetbook.UseCase(name: 'Button Sizes', type: FcButton)
Widget buttonSizes(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FcButton(
          label: 'Small',
          onPressed: () {},
          size: FcButtonSize.small,
        ),
        const SizedBox(height: 16),
        FcButton(
          label: 'Medium',
          onPressed: () {},
          size: FcButtonSize.medium,
        ),
        const SizedBox(height: 16),
        FcButton(
          label: 'Large',
          onPressed: () {},
          size: FcButtonSize.large,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'All Button Variants', type: FcButton)
Widget allButtonVariants(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        FcButton(label: 'Primary', onPressed: () {}, variant: FcButtonVariant.primary),
        FcButton(label: 'Secondary', onPressed: () {}, variant: FcButtonVariant.secondary),
        FcButton(label: 'Outlined', onPressed: () {}, variant: FcButtonVariant.outlined),
        FcButton(label: 'Text', onPressed: () {}, variant: FcButtonVariant.text),
        FcButton(label: 'Destructive', onPressed: () {}, variant: FcButtonVariant.destructive),
      ],
    ),
  );
}
