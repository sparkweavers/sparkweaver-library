import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';
import 'fc_status_message.dart';

part 'fc_snack_bar_content.dart';

/// A label and its callback travel together, so a button that does
/// nothing cannot be constructed.
typedef FcSnackBarAction = ({String label, VoidCallback onPressed});

/// Themed message snackbar, shown through
/// `ScaffoldMessenger.of(context).showSnackBar`.
class FcSnackBar extends SnackBar {
  final String message;
  final FcStatusVariant variant;

  /// [SnackBar.backgroundColor] is fixed at construction, so every
  /// factory takes the caller's context to resolve the themed colours.
  FcSnackBar._({
    required this.message,
    required this.variant,
    required BuildContext context,
    FcSnackBarAction? action,
    super.key,
  }) : super(
         content: _SnackBarContent(message: message, variant: variant),
         backgroundColor: _getBackgroundColor(
           SparkweaverTheme.of(context),
           variant,
         ),
         action: action != null
             ? SnackBarAction(
                 label: action.label,
                 onPressed: action.onPressed,
                 textColor: _getForegroundColor(
                   SparkweaverTheme.of(context),
                   variant,
                 ),
               )
             : null,
       );

  /// Create an error snackbar (red)
  factory FcSnackBar.error({
    required BuildContext context,
    required String message,
    FcSnackBarAction? action,
    Key? key,
  }) {
    return FcSnackBar._(
      message: message,
      variant: FcStatusVariant.error,
      context: context,
      action: action,
      key: key,
    );
  }

  /// Create a success snackbar (green)
  factory FcSnackBar.success({
    required BuildContext context,
    required String message,
    FcSnackBarAction? action,
    Key? key,
  }) {
    return FcSnackBar._(
      message: message,
      variant: FcStatusVariant.success,
      context: context,
      action: action,
      key: key,
    );
  }

  /// Create a warning snackbar (orange)
  factory FcSnackBar.warning({
    required BuildContext context,
    required String message,
    FcSnackBarAction? action,
    Key? key,
  }) {
    return FcSnackBar._(
      message: message,
      variant: FcStatusVariant.warning,
      context: context,
      action: action,
      key: key,
    );
  }

  /// Create an info snackbar (blue)
  factory FcSnackBar.info({
    required BuildContext context,
    required String message,
    FcSnackBarAction? action,
    Key? key,
  }) {
    return FcSnackBar._(
      message: message,
      variant: FcStatusVariant.info,
      context: context,
      action: action,
      key: key,
    );
  }

  static Color _getBackgroundColor(
    SparkweaverTheme colors,
    FcStatusVariant variant,
  ) {
    switch (variant) {
      case FcStatusVariant.success:
        return colors.successFill;
      case FcStatusVariant.error:
        return colors.errorFill;
      case FcStatusVariant.warning:
        return colors.warningFill;
      case FcStatusVariant.info:
        return colors.infoFill;
    }
  }

  /// Icon and text colour that stays legible on [_getBackgroundColor].
  static Color _getForegroundColor(
    SparkweaverTheme colors,
    FcStatusVariant variant,
  ) {
    switch (variant) {
      case FcStatusVariant.success:
        return colors.onSuccess;
      case FcStatusVariant.error:
        return colors.onError;
      case FcStatusVariant.warning:
        return colors.onWarning;
      case FcStatusVariant.info:
        return colors.onInfo;
    }
  }
}
