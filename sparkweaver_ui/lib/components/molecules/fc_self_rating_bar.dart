import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';

/// Flashcard self-rating: again 0, almost 1, knewIt 2.
/// Maps 1:1 to `public.answers.grade`.
enum FcSelfRatingGrade { again, almost, knewIt }

/// Numeric wire value for a grade, kept explicit and separate from the enum.
extension FcSelfRatingGradeValue on FcSelfRatingGrade {
  int get value {
    switch (this) {
      case FcSelfRatingGrade.again:
        return 0;
      case FcSelfRatingGrade.almost:
        return 1;
      case FcSelfRatingGrade.knewIt:
        return 2;
    }
  }
}

/// Display metadata for a grade: the label and colour used on the results
/// screen's outcome badge and grade distribution card.
extension FcSelfRatingGradeDisplay on FcSelfRatingGrade {
  String get label {
    switch (this) {
      case FcSelfRatingGrade.again:
        return 'Again';
      case FcSelfRatingGrade.almost:
        return 'Almost';
      case FcSelfRatingGrade.knewIt:
        return 'Knew it';
    }
  }

  Color color(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    switch (this) {
      case FcSelfRatingGrade.again:
        return colors.errorFill;
      case FcSelfRatingGrade.almost:
        return colors.warningFill;
      case FcSelfRatingGrade.knewIt:
        return colors.successFill;
    }
  }

  /// Foreground for text drawn on [color].
  Color onColor(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    switch (this) {
      case FcSelfRatingGrade.again:
        return colors.onError;
      case FcSelfRatingGrade.almost:
        return colors.onWarning;
      case FcSelfRatingGrade.knewIt:
        return colors.onSuccess;
    }
  }
}

/// Three rating buttons, with an internal guard against a double-tap and
/// [enabled] left to the parent to decide.
class FcSelfRatingBar extends StatefulWidget {
  /// Called when the user picks one of the three grades.
  final ValueChanged<FcSelfRatingGrade> onRated;

  /// Whether the parent currently allows a rating, independent of the
  /// internal double-tap guard.
  final bool enabled;

  /// Label for the "again" button. Defaults to `Again`.
  final String againLabel;

  /// Label for the "almost" button. Defaults to `Almost`.
  final String almostLabel;

  /// Label for the "knew it" button. Defaults to `Knew it`.
  final String knewItLabel;

  const FcSelfRatingBar({
    super.key,
    required this.onRated,
    this.enabled = true,
    this.againLabel = 'Again',
    this.almostLabel = 'Almost',
    this.knewItLabel = 'Knew it',
  });

  @override
  State<FcSelfRatingBar> createState() => _FcSelfRatingBarState();
}

class _FcSelfRatingBarState extends State<FcSelfRatingBar> {
  bool _submitting = false;

  @override
  void didUpdateWidget(FcSelfRatingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !oldWidget.enabled) {
      setState(() => _submitting = false);
    }
  }

  bool get _canTap => widget.enabled && !_submitting;

  void _handleTap(FcSelfRatingGrade grade) {
    if (!_canTap) return;
    setState(() => _submitting = true);
    widget.onRated(grade);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: SparkweaverSpacing.edgeInsetsMd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(
            label: widget.againLabel,
            variant: FcButtonVariant.destructive,
            grade: FcSelfRatingGrade.again,
          ),
          SparkweaverSpacing.horizontalSpaceSm,
          _buildButton(
            label: widget.almostLabel,
            variant: FcButtonVariant.outlined,
            grade: FcSelfRatingGrade.almost,
          ),
          SparkweaverSpacing.horizontalSpaceSm,
          _buildButton(
            label: widget.knewItLabel,
            variant: FcButtonVariant.primary,
            grade: FcSelfRatingGrade.knewIt,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required FcButtonVariant variant,
    required FcSelfRatingGrade grade,
  }) {
    return Expanded(
      child: FcButton(
        label: label,
        variant: variant,
        onPressed: _canTap ? () => _handleTap(grade) : null,
      ),
    );
  }
}
