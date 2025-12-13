import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';

/// Loading Indicator Size variants
enum FcLoadingSize {
  /// Small loading indicator - 16px
  small,

  /// Medium loading indicator - 24px
  medium,

  /// Large loading indicator - 48px
  large,
}

/// Flashcard Loading Indicator Component (Atom)
///
/// A reusable loading/progress indicator with consistent sizing.
///
/// ## Usage
///
/// ```dart
/// // Default medium size
/// FcLoadingIndicator()
///
/// // Small size for buttons
/// FcLoadingIndicator(size: FcLoadingSize.small)
///
/// // Large size for full-screen loading
/// FcLoadingIndicator(size: FcLoadingSize.large)
///
/// // Custom color
/// FcLoadingIndicator(color: Colors.white)
/// ```
class FcLoadingIndicator extends StatelessWidget {
  /// Size variant of the loading indicator
  final FcLoadingSize size;

  /// Custom color (defaults to primary color)
  final Color? color;

  /// Stroke width (defaults to 2.0 for small, 3.0 for medium, 4.0 for large)
  final double? strokeWidth;

  /// Semantic label for accessibility
  final String? semanticLabel;

  const FcLoadingIndicator({
    super.key,
    this.size = FcLoadingSize.medium,
    this.color,
    this.strokeWidth,
    this.semanticLabel,
  });

  double _getSizeValue() {
    switch (size) {
      case FcLoadingSize.small:
        return 16.0;
      case FcLoadingSize.medium:
        return 24.0;
      case FcLoadingSize.large:
        return 48.0;
    }
  }

  double _getStrokeWidth() {
    if (strokeWidth != null) return strokeWidth!;

    switch (size) {
      case FcLoadingSize.small:
        return 2.0;
      case FcLoadingSize.medium:
        return 3.0;
      case FcLoadingSize.large:
        return 4.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getSizeValue(),
      height: _getSizeValue(),
      child: CircularProgressIndicator(
        strokeWidth: _getStrokeWidth(),
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? FlashcardColors.primary,
        ),
        semanticsLabel: semanticLabel,
      ),
    );
  }
}
