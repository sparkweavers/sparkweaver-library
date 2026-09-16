part of 'fc_snack_bar.dart';

/// Internal snackbar content widget
class _SnackBarContent extends StatelessWidget {
  final String message;
  final FcStatusVariant variant;

  const _SnackBarContent({required this.message, required this.variant});

  IconData _getIcon() {
    switch (variant) {
      case FcStatusVariant.success:
        return Icons.check_circle_outline;
      case FcStatusVariant.error:
        return Icons.error_outline;
      case FcStatusVariant.warning:
        return Icons.warning_amber_outlined;
      case FcStatusVariant.info:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final foreground = FcSnackBar._getForegroundColor(
      SparkweaverTheme.of(context),
      variant,
    );
    return Row(
      children: [
        FcIcon(_getIcon(), size: FcIconSize.medium, color: foreground),
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
