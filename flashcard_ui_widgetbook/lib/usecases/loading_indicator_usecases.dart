import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Sizes', type: FcLoadingIndicator)
Widget loadingSizes(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FcLoadingIndicator(size: FcLoadingSize.small),
        SizedBox(width: 32),
        FcLoadingIndicator(size: FcLoadingSize.medium),
        SizedBox(width: 32),
        FcLoadingIndicator(size: FcLoadingSize.large),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Colors', type: FcLoadingIndicator)
Widget customColorLoading(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        FcLoadingIndicator(color: SparkweaverColors.primary),
        SizedBox(width: 32),
        FcLoadingIndicator(color: SparkweaverColors.secondary),
        SizedBox(width: 32),
        FcLoadingIndicator(color: SparkweaverColors.error),
      ],
    ),
  );
}
