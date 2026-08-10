import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Basic Error State', type: FcErrorState)
Widget basicErrorState(BuildContext context) {
  return FcErrorState(message: 'Failed to load data', onRetry: () {});
}

@widgetbook.UseCase(name: 'Network Error', type: FcErrorState)
Widget networkError(BuildContext context) {
  return FcErrorState(
    message: 'Network connection failed',
    subtitle: 'Please check your internet connection and try again',
    onRetry: () {},
  );
}

@widgetbook.UseCase(name: 'Without Retry', type: FcErrorState)
Widget errorWithoutRetry(BuildContext context) {
  return const FcErrorState(
    message: 'An unexpected error occurred',
    subtitle: 'Please contact support if this persists',
  );
}
