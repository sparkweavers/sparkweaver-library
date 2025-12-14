import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import 'fc_icon.dart';
import 'fc_loading_indicator.dart';

/// Button variant types
enum FcButtonVariant {
  /// Filled primary button
  primary,

  /// Filled secondary button
  secondary,

  /// Outlined button
  outlined,

  /// Text-only button
  text,

  /// Destructive action button (red)
  destructive,
}

/// Button size variants
enum FcButtonSize {
  /// Small button
  small,

  /// Medium button (default)
  medium,

  /// Large button
  large,
}

/// Flashcard Button Component (Atom)
///
/// A reusable button with multiple variants, sizes, and states.
///
/// ## Usage
///
/// ```dart
/// // Primary button
/// FcButton(
///   label: 'Submit',
///   onPressed: () => print('Submitted'),
/// )
///
/// // Outlined button
/// FcButton(
///   label: 'Cancel',
///   variant: FcButtonVariant.outlined,
///   onPressed: () => print('Cancelled'),
/// )
///
/// // Button with icon
/// FcButton(
///   label: 'Upload',
///   icon: Icons.upload,
///   onPressed: () => print('Upload'),
/// )
///
/// // Loading button
/// FcButton(
///   label: 'Processing',
///   isLoading: true,
///   onPressed: null,
/// )
///
/// // Disabled button
/// FcButton(
///   label: 'Submit',
///   onPressed: null, // null disables the button
/// )
///
/// // Icon-only button
/// FcButton.icon(
///   icon: Icons.delete,
///   variant: FcButtonVariant.destructive,
///   onPressed: () => print('Delete'),
/// )
/// ```
class FcButton extends StatelessWidget {
  /// Button label text
  final String? label;

  /// Icon to display (shown before label)
  final IconData? icon;

  /// Callback when button is pressed
  final VoidCallback? onPressed;

  /// Button variant
  final FcButtonVariant variant;

  /// Button size
  final FcButtonSize size;

  /// Whether button is in loading state
  final bool isLoading;

  /// Whether button should expand to fill available width
  final bool fullWidth;

  /// Icon-only mode
  final bool iconOnly;

  const FcButton({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
    this.variant = FcButtonVariant.primary,
    this.size = FcButtonSize.medium,
    this.isLoading = false,
    this.fullWidth = false,
  }) : iconOnly = false;

  /// Creates an icon-only button
  const FcButton.icon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.variant = FcButtonVariant.primary,
    this.size = FcButtonSize.medium,
    this.isLoading = false,
  })  : label = null,
        fullWidth = false,
        iconOnly = true;

  EdgeInsets _getPadding() {
    if (iconOnly) {
      switch (size) {
        case FcButtonSize.small:
          return const EdgeInsets.all(8);
        case FcButtonSize.medium:
          return const EdgeInsets.all(12);
        case FcButtonSize.large:
          return const EdgeInsets.all(16);
      }
    }

    switch (size) {
      case FcButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 6);
      case FcButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case FcButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  TextStyle _getTextStyle() {
    switch (size) {
      case FcButtonSize.small:
        return FlashcardTypography.labelSmall;
      case FcButtonSize.medium:
        return FlashcardTypography.labelMedium;
      case FcButtonSize.large:
        return FlashcardTypography.labelLarge;
    }
  }

  FcIconSize _getIconSize() {
    switch (size) {
      case FcButtonSize.small:
        return FcIconSize.small;
      case FcButtonSize.medium:
        return FcIconSize.medium;
      case FcButtonSize.large:
        return FcIconSize.large;
    }
  }

  Color _getBackgroundColor(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    switch (variant) {
      case FcButtonVariant.primary:
        return colors.primary;
      case FcButtonVariant.secondary:
        return colors.secondary;
      case FcButtonVariant.destructive:
        return colors.error;
      case FcButtonVariant.outlined:
      case FcButtonVariant.text:
        return Colors.transparent;
    }
  }

  Color _getForegroundColor(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    switch (variant) {
      case FcButtonVariant.primary:
      case FcButtonVariant.secondary:
      case FcButtonVariant.destructive:
        return colors.white;
      case FcButtonVariant.outlined:
        return colors.primary;
      case FcButtonVariant.text:
        return colors.primary;
    }
  }

  BorderSide? _getBorderSide(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    switch (variant) {
      case FcButtonVariant.outlined:
        return BorderSide(color: colors.primary, width: 1);
      case FcButtonVariant.primary:
      case FcButtonVariant.secondary:
      case FcButtonVariant.destructive:
      case FcButtonVariant.text:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    Widget buttonChild;

    if (isLoading) {
      buttonChild = FcLoadingIndicator(
        size: size == FcButtonSize.small
            ? FcLoadingSize.small
            : FcLoadingSize.medium,
        color: _getForegroundColor(context),
      );
    } else if (iconOnly && icon != null) {
      buttonChild = FcIcon(
        icon!,
        size: _getIconSize(),
        color: _getForegroundColor(context),
      );
    } else if (icon != null && label != null) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FcIcon(
            icon!,
            size: _getIconSize(),
            color: _getForegroundColor(context),
          ),
          const SizedBox(width: 8),
          Text(
            label!,
            style: _getTextStyle().copyWith(color: _getForegroundColor(context)),
          ),
        ],
      );
    } else if (label != null) {
      buttonChild = Text(
        label!,
        style: _getTextStyle().copyWith(color: _getForegroundColor(context)),
      );
    } else {
      buttonChild = const SizedBox.shrink();
    }

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _getBackgroundColor(context),
        foregroundColor: _getForegroundColor(context),
        disabledBackgroundColor: colors.gray300,
        disabledForegroundColor: colors.textDisabled,
        padding: _getPadding(),
        elevation: variant == FcButtonVariant.text ? 0 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: _getBorderSide(context) ?? BorderSide.none,
        ),
      ),
      child: buttonChild,
    );

    if (fullWidth) {
      return SizedBox(
        width: double.infinity,
        child: button,
      );
    }

    return button;
  }
}
