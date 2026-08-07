import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_input_field.dart';

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
    return Padding(
      padding: FlashcardSpacing.edgeInsetsLg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.progressLabel != null) ...[
            Text(
              widget.progressLabel!,
              style: FlashcardTypography.labelSmall.copyWith(
                color: SparkweaverColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            FlashcardSpacing.verticalSpaceSm,
          ],
          Container(
            padding: FlashcardSpacing.edgeInsetsLg,
            decoration: BoxDecoration(
              color: SparkweaverColors.backgroundPrimary,
              borderRadius: FlashcardTokens.cardRadius,
              border: Border.all(color: SparkweaverColors.accent1),
            ),
            child: Text(
              widget.question,
              style: FlashcardTypography.heading4.copyWith(
                color: SparkweaverColors.textPrimary,
              ),
            ),
          ),
          FlashcardSpacing.verticalSpaceMd,
          FcInputField(
            controller: _controller,
            type: FcInputType.multiline,
            enabled: !widget.locked,
            minLines: 3,
            maxLines: 8,
            hintText: 'Type your answer…',
          ),
          FlashcardSpacing.verticalSpaceMd,
          FcButton(
            label: widget.submitLabel,
            fullWidth: true,
            onPressed: widget.locked ? null : _handleSubmit,
          ),
          if (widget.feedback != null && widget.feedback!.isNotEmpty) ...[
            FlashcardSpacing.verticalSpaceMd,
            Container(
              width: double.infinity,
              padding: FlashcardSpacing.edgeInsetsMd,
              decoration: BoxDecoration(
                color: SparkweaverColors.accent2,
                borderRadius: FlashcardTokens.cardRadius,
              ),
              child: MarkdownBody(
                data: widget.feedback!,
                styleSheet: FlashcardMarkdownStyle.forBody(
                  baseStyle: FlashcardTypography.bodyMedium.copyWith(
                    color: SparkweaverColors.textPrimary,
                  ),
                  textColor: SparkweaverColors.textPrimary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
