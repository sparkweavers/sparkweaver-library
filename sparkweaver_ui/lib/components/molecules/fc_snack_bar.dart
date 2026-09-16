import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_text.dart';
import 'fc_status_variant.dart';

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
         backgroundColor: variant.fill(SparkweaverTheme.of(context)),
         action: action != null
             ? SnackBarAction(
                 label: action.label,
                 onPressed: action.onPressed,
                 textColor: variant.onFill(SparkweaverTheme.of(context)),
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
}

class _SnackBarContent extends StatelessWidget {
  final String message;
  final FcStatusVariant variant;

  const _SnackBarContent({required this.message, required this.variant});

  @override
  Widget build(BuildContext context) {
    final foreground = variant.onFill(SparkweaverTheme.of(context));
    return Row(
      children: [
        FcIcon(variant.icon, size: FcIconSize.medium, color: foreground),
        SparkweaverSpacing.horizontalSpaceMd,
        Expanded(
          child: FcText(
            message,
            style: FcTextStyle.bodyMedium,
            color: foreground,
          ),
        ),
      ],
    );
  }
}
