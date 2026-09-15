import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: FcSelfRatingBar)
Widget defaultSelfRatingBar(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcSelfRatingBar(onRated: (_) {}),
    ),
  );
}

/// Demonstrates [enabled] re-arming the bar after a simulated submit failure.
@widgetbook.UseCase(name: 'Retry after failure', type: FcSelfRatingBar)
Widget retrySelfRatingBar(BuildContext context) {
  return _RetryDemo();
}

class _RetryDemo extends StatefulWidget {
  @override
  State<_RetryDemo> createState() => _RetryDemoState();
}

class _RetryDemoState extends State<_RetryDemo> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FcSelfRatingBar(onRated: (_) {}, enabled: _enabled),
            const SizedBox(height: 16),
            Switch(
              value: _enabled,
              onChanged: (v) => setState(() => _enabled = v),
            ),
            const Text('Simulated submit outcome: enabled re-arms the bar.'),
          ],
        ),
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Custom labels', type: FcSelfRatingBar)
Widget customLabelsSelfRatingBar(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FcSelfRatingBar(
        onRated: (_) {},
        againLabel: 'No idea',
        almostLabel: 'Nearly',
        knewItLabel: 'Confident',
      ),
    ),
  );
}
