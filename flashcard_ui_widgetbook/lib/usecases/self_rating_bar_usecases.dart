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

/// Tap any button to see the rated state. Every button greys out, including
/// the one that was picked, because the bar locks itself with
/// `onPressed: null`. That is the same defect that made the multiple-choice
/// reveal disappear; it does not lose information here only because the bar
/// never highlighted the choice in the first place.
@widgetbook.UseCase(name: 'Rated (tap to see)', type: FcSelfRatingBar)
Widget ratedSelfRatingBar(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FcSelfRatingBar(onRated: (_) {}),
          const SizedBox(height: 16),
          const Text('Tap a rating above to see the locked state.'),
        ],
      ),
    ),
  );
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
