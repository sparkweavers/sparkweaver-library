import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_card.dart';
import '../atoms/fc_input_field.dart';
import '../atoms/fc_markdown_text.dart';

/// Open-Answer Question Card (Organism)
///
/// Displays a question, a multi-line text input for the student's answer,
/// and a submit button. Optional feedback is rendered under the input
/// once the server has evaluated the submission.
///
/// The widget owns the [TextEditingController] when [controller] is not
/// provided, so callers that don't need to preload text can drop it in
/// without wiring one up.
///
/// ## Usage
///
/// ```dart
/// FcOpenAnswerCard(
///   question: 'Explain photosynthesis in one sentence.',
///   onSubmit: (text) => coordinator.submitText(text),
///   feedback: null,        // set after server evaluates
///   progressLabel: '3 / 10',
/// )
/// ```
class FcOpenAnswerCard extends StatefulWidget {
  /// Question text rendered above the input.
  final String question;

  /// Called with the trimmed answer text when the user taps Submit.
  final ValueChanged<String> onSubmit;

  /// Optional feedback text rendered under the input (typically the
  /// LLM's evaluation of the submitted answer).
  final String? feedback;

  /// Optional short label rendered above the question (for example a
  /// "3 / 10" progress indicator).
  final String? progressLabel;

  /// Optional external text controller. When null, the card creates and
  /// owns one internally.
  final TextEditingController? controller;

  /// Locks the input and disables Submit — useful while a submission is
  /// in flight or after feedback has been shown.
  final bool locked;

  /// Label for the submit button. Defaults to `Submit`.
  final String submitLabel;

  const FcOpenAnswerCard({
    super.key,
    required this.question,
    required this.onSubmit,
    this.feedback,
    this.progressLabel,
    this.controller,
    this.locked = false,
    this.submitLabel = 'Submit',
  });

  @override
  State<FcOpenAnswerCard> createState() => _FcOpenAnswerCardState();
}

class _FcOpenAnswerCardState extends State<FcOpenAnswerCard> {
  TextEditingController? _internalController;
  TextEditingController get _controller =>
      widget.controller ?? (_internalController ??= TextEditingController());

  @override
  void dispose() {
    _internalController?.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit(text);
  }

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return Padding(
      padding: SparkweaverSpacing.edgeInsetsLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.progressLabel != null) ...[
            Text(
              widget.progressLabel!,
              style: SparkweaverTypography.labelSmall.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SparkweaverSpacing.verticalSpaceSm,
          ],
          FcCard(
            child: FcMarkdownText(
              data: widget.question,
              baseStyle: SparkweaverTypography.heading4.copyWith(
                color: colors.textPrimary,
              ),
            ),
          ),
          SparkweaverSpacing.verticalSpaceMd,
          FcInputField(
            controller: _controller,
            type: FcInputType.multiline,
            enabled: !widget.locked,
            minLines: 3,
            maxLines: 8,
            hintText: 'Type your answer…',
          ),
          SparkweaverSpacing.verticalSpaceMd,
          FcButton(
            label: widget.submitLabel,
            fullWidth: true,
            onPressed: widget.locked ? null : _handleSubmit,
          ),
          if (widget.feedback != null && widget.feedback!.isNotEmpty) ...[
            SparkweaverSpacing.verticalSpaceMd,
            FcCard(
              variant: FcCardVariant.muted,
              width: double.infinity,
              padding: SparkweaverSpacing.edgeInsetsMd,
              child: FcMarkdownText(
                data: widget.feedback!,
                baseStyle: SparkweaverTypography.bodyMedium.copyWith(
                  color: colors.textPrimary,
                ),
                textColor: colors.textPrimary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
