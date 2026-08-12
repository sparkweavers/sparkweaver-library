import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Helper widget to display an icon with its label
class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final FcIconVariant variant;

  const _IconWithLabel({
    required this.icon,
    required this.label,
    this.variant = FcIconVariant.defaultIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FcIcon(icon, size: FcIconSize.large, variant: variant),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

@widgetbook.UseCase(name: 'All SparkweaverIcons', type: FcIcon)
Widget allSparkweaverIcons(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      spacing: 24,
      runSpacing: 32,
      children: const [
        // UI Actions
        _IconWithLabel(icon: SparkweaverIcons.actionSend, label: 'actionSend'),
        _IconWithLabel(
          icon: SparkweaverIcons.actionClose,
          label: 'actionClose',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.actionDelete,
          label: 'actionDelete',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.actionAttach,
          label: 'actionAttach',
        ),
        _IconWithLabel(icon: SparkweaverIcons.actionAdd, label: 'actionAdd'),
        _IconWithLabel(
          icon: SparkweaverIcons.actionAddCircle,
          label: 'actionAddCircle',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.actionUpload,
          label: 'actionUpload',
        ),

        // Status & Feedback
        _IconWithLabel(
          icon: SparkweaverIcons.statusSuccess,
          label: 'statusSuccess',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusSuccessFilled,
          label: 'statusSuccessFilled',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusError,
          label: 'statusError',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusWarning,
          label: 'statusWarning',
        ),
        _IconWithLabel(icon: SparkweaverIcons.statusInfo, label: 'statusInfo'),
        _IconWithLabel(
          icon: SparkweaverIcons.statusCheck,
          label: 'statusCheck',
        ),

        // User & Identity
        _IconWithLabel(icon: SparkweaverIcons.userPerson, label: 'userPerson'),
        _IconWithLabel(icon: SparkweaverIcons.userAI, label: 'userAI'),
        _IconWithLabel(icon: SparkweaverIcons.userStar, label: 'userStar'),

        // Media Controls
        _IconWithLabel(icon: SparkweaverIcons.mediaPlay, label: 'mediaPlay'),
        _IconWithLabel(icon: SparkweaverIcons.mediaPause, label: 'mediaPause'),
        _IconWithLabel(icon: SparkweaverIcons.mediaMic, label: 'mediaMic'),

        // File Operations
        _IconWithLabel(
          icon: SparkweaverIcons.fileDocument,
          label: 'fileDocument',
        ),
        _IconWithLabel(icon: SparkweaverIcons.fileUpload, label: 'fileUpload'),
        _IconWithLabel(icon: SparkweaverIcons.fileTable, label: 'fileTable'),

        // Navigation & Empty States
        _IconWithLabel(icon: SparkweaverIcons.emptyInbox, label: 'emptyInbox'),
        _IconWithLabel(icon: SparkweaverIcons.emptyChat, label: 'emptyChat'),
        _IconWithLabel(
          icon: SparkweaverIcons.emptyTopics,
          label: 'emptyTopics',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.emptySearch,
          label: 'emptySearch',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.navigationBack,
          label: 'navigationBack',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.navigationSearch,
          label: 'navigationSearch',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.navigationMore,
          label: 'navigationMore',
        ),

        // Common
        _IconWithLabel(icon: SparkweaverIcons.home, label: 'home'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'UI Actions Icons', type: FcIcon)
Widget uiActionsIcons(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 32,
      runSpacing: 32,
      children: const [
        _IconWithLabel(icon: SparkweaverIcons.actionSend, label: 'Send'),
        _IconWithLabel(icon: SparkweaverIcons.actionClose, label: 'Close'),
        _IconWithLabel(icon: SparkweaverIcons.actionDelete, label: 'Delete'),
        _IconWithLabel(icon: SparkweaverIcons.actionAttach, label: 'Attach'),
        _IconWithLabel(icon: SparkweaverIcons.actionAdd, label: 'Add'),
        _IconWithLabel(
          icon: SparkweaverIcons.actionAddCircle,
          label: 'Add Circle',
        ),
        _IconWithLabel(icon: SparkweaverIcons.actionUpload, label: 'Upload'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Status Icons', type: FcIcon)
Widget statusIcons(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 32,
      runSpacing: 32,
      children: const [
        _IconWithLabel(
          icon: SparkweaverIcons.statusSuccess,
          label: 'Success',
          variant: FcIconVariant.success,
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusSuccessFilled,
          label: 'Success Filled',
          variant: FcIconVariant.success,
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusError,
          label: 'Error',
          variant: FcIconVariant.error,
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusWarning,
          label: 'Warning',
          variant: FcIconVariant.warning,
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusInfo,
          label: 'Info',
          variant: FcIconVariant.info,
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.statusCheck,
          label: 'Check',
          variant: FcIconVariant.success,
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'User & Identity Icons', type: FcIcon)
Widget userIdentityIcons(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 32,
      runSpacing: 32,
      children: const [
        _IconWithLabel(icon: SparkweaverIcons.userPerson, label: 'Person'),
        _IconWithLabel(icon: SparkweaverIcons.userAI, label: 'AI/Bot'),
        _IconWithLabel(icon: SparkweaverIcons.userStar, label: 'Star/Favorite'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Media Control Icons', type: FcIcon)
Widget mediaControlIcons(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 32,
      runSpacing: 32,
      children: const [
        _IconWithLabel(icon: SparkweaverIcons.mediaPlay, label: 'Play'),
        _IconWithLabel(icon: SparkweaverIcons.mediaPause, label: 'Pause'),
        _IconWithLabel(icon: SparkweaverIcons.mediaMic, label: 'Microphone'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'File Operation Icons', type: FcIcon)
Widget fileOperationIcons(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 32,
      runSpacing: 32,
      children: const [
        _IconWithLabel(icon: SparkweaverIcons.fileDocument, label: 'Document'),
        _IconWithLabel(icon: SparkweaverIcons.fileUpload, label: 'Upload File'),
        _IconWithLabel(icon: SparkweaverIcons.fileTable, label: 'Spreadsheet'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Navigation Icons', type: FcIcon)
Widget navigationIcons(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 32,
      runSpacing: 32,
      children: const [
        _IconWithLabel(icon: SparkweaverIcons.emptyInbox, label: 'Empty Inbox'),
        _IconWithLabel(icon: SparkweaverIcons.emptyChat, label: 'Empty Chat'),
        _IconWithLabel(
          icon: SparkweaverIcons.emptyTopics,
          label: 'Empty Topics',
        ),
        _IconWithLabel(icon: SparkweaverIcons.emptySearch, label: 'No Results'),
        _IconWithLabel(icon: SparkweaverIcons.navigationBack, label: 'Back'),
        _IconWithLabel(
          icon: SparkweaverIcons.navigationSearch,
          label: 'Search',
        ),
        _IconWithLabel(
          icon: SparkweaverIcons.navigationMore,
          label: 'More Options',
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Icon Sizes', type: FcIcon)
Widget iconSizes(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Small (14px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(SparkweaverIcons.actionSend, size: FcIconSize.small),
        const SizedBox(height: 24),
        const Text('Medium (20px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(SparkweaverIcons.actionSend, size: FcIconSize.medium),
        const SizedBox(height: 24),
        const Text('Large (24px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(SparkweaverIcons.actionSend, size: FcIconSize.large),
        const SizedBox(height: 24),
        const Text('Extra Large (32px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(SparkweaverIcons.actionSend, size: FcIconSize.xLarge),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Semantic Variants', type: FcIcon)
Widget semanticVariants(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FcIcon(
              SparkweaverIcons.statusSuccess,
              variant: FcIconVariant.success,
              size: FcIconSize.xLarge,
            ),
            SizedBox(width: 16),
            Text('Success', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FcIcon(
              SparkweaverIcons.statusError,
              variant: FcIconVariant.error,
              size: FcIconSize.xLarge,
            ),
            SizedBox(width: 16),
            Text('Error', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FcIcon(
              SparkweaverIcons.statusWarning,
              variant: FcIconVariant.warning,
              size: FcIconSize.xLarge,
            ),
            SizedBox(width: 16),
            Text('Warning', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FcIcon(
              SparkweaverIcons.statusInfo,
              variant: FcIconVariant.info,
              size: FcIconSize.xLarge,
            ),
            SizedBox(width: 16),
            Text('Info', style: TextStyle(fontSize: 16)),
          ],
        ),
      ],
    ),
  );
}
