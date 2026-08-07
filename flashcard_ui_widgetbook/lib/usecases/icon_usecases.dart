import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Helper widget to display an icon with its label
class _IconWithLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final FcIconSize size;
  final FcIconVariant variant;

  const _IconWithLabel({
    required this.icon,
    required this.label,
    this.size = FcIconSize.large,
    this.variant = FcIconVariant.defaultIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FcIcon(
          icon,
          size: size,
          variant: variant,
        ),
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

@widgetbook.UseCase(name: 'All FlashcardIcons', type: FcIcon)
Widget allFlashcardIcons(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      spacing: 24,
      runSpacing: 32,
      children: const [
        // UI Actions
        _IconWithLabel(icon: FlashcardIcons.actionSend, label: 'actionSend'),
        _IconWithLabel(icon: FlashcardIcons.actionClose, label: 'actionClose'),
        _IconWithLabel(icon: FlashcardIcons.actionDelete, label: 'actionDelete'),
        _IconWithLabel(icon: FlashcardIcons.actionAttach, label: 'actionAttach'),
        _IconWithLabel(icon: FlashcardIcons.actionAdd, label: 'actionAdd'),
        _IconWithLabel(icon: FlashcardIcons.actionAddCircle, label: 'actionAddCircle'),
        _IconWithLabel(icon: FlashcardIcons.actionUpload, label: 'actionUpload'),

        // Status & Feedback
        _IconWithLabel(icon: FlashcardIcons.statusSuccess, label: 'statusSuccess'),
        _IconWithLabel(icon: FlashcardIcons.statusSuccessFilled, label: 'statusSuccessFilled'),
        _IconWithLabel(icon: FlashcardIcons.statusError, label: 'statusError'),
        _IconWithLabel(icon: FlashcardIcons.statusWarning, label: 'statusWarning'),
        _IconWithLabel(icon: FlashcardIcons.statusInfo, label: 'statusInfo'),
        _IconWithLabel(icon: FlashcardIcons.statusCheck, label: 'statusCheck'),

        // User & Identity
        _IconWithLabel(icon: FlashcardIcons.userPerson, label: 'userPerson'),
        _IconWithLabel(icon: FlashcardIcons.userAI, label: 'userAI'),
        _IconWithLabel(icon: FlashcardIcons.userStar, label: 'userStar'),

        // Media Controls
        _IconWithLabel(icon: FlashcardIcons.mediaPlay, label: 'mediaPlay'),
        _IconWithLabel(icon: FlashcardIcons.mediaPause, label: 'mediaPause'),
        _IconWithLabel(icon: FlashcardIcons.mediaMic, label: 'mediaMic'),

        // File Operations
        _IconWithLabel(icon: FlashcardIcons.fileDocument, label: 'fileDocument'),
        _IconWithLabel(icon: FlashcardIcons.fileUpload, label: 'fileUpload'),
        _IconWithLabel(icon: FlashcardIcons.fileTable, label: 'fileTable'),

        // Navigation & Empty States
        _IconWithLabel(icon: FlashcardIcons.emptyInbox, label: 'emptyInbox'),
        _IconWithLabel(icon: FlashcardIcons.emptyChat, label: 'emptyChat'),
        _IconWithLabel(icon: FlashcardIcons.emptyTopics, label: 'emptyTopics'),
        _IconWithLabel(icon: FlashcardIcons.emptySearch, label: 'emptySearch'),
        _IconWithLabel(icon: FlashcardIcons.navigationBack, label: 'navigationBack'),
        _IconWithLabel(icon: FlashcardIcons.navigationSearch, label: 'navigationSearch'),
        _IconWithLabel(icon: FlashcardIcons.navigationMore, label: 'navigationMore'),

        // Common
        _IconWithLabel(icon: FlashcardIcons.home, label: 'home'),
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
        _IconWithLabel(icon: FlashcardIcons.actionSend, label: 'Send'),
        _IconWithLabel(icon: FlashcardIcons.actionClose, label: 'Close'),
        _IconWithLabel(icon: FlashcardIcons.actionDelete, label: 'Delete'),
        _IconWithLabel(icon: FlashcardIcons.actionAttach, label: 'Attach'),
        _IconWithLabel(icon: FlashcardIcons.actionAdd, label: 'Add'),
        _IconWithLabel(icon: FlashcardIcons.actionAddCircle, label: 'Add Circle'),
        _IconWithLabel(icon: FlashcardIcons.actionUpload, label: 'Upload'),
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
          icon: FlashcardIcons.statusSuccess,
          label: 'Success',
          variant: FcIconVariant.success,
        ),
        _IconWithLabel(
          icon: FlashcardIcons.statusSuccessFilled,
          label: 'Success Filled',
          variant: FcIconVariant.success,
        ),
        _IconWithLabel(
          icon: FlashcardIcons.statusError,
          label: 'Error',
          variant: FcIconVariant.error,
        ),
        _IconWithLabel(
          icon: FlashcardIcons.statusWarning,
          label: 'Warning',
          variant: FcIconVariant.warning,
        ),
        _IconWithLabel(
          icon: FlashcardIcons.statusInfo,
          label: 'Info',
          variant: FcIconVariant.info,
        ),
        _IconWithLabel(
          icon: FlashcardIcons.statusCheck,
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
        _IconWithLabel(icon: FlashcardIcons.userPerson, label: 'Person'),
        _IconWithLabel(icon: FlashcardIcons.userAI, label: 'AI/Bot'),
        _IconWithLabel(icon: FlashcardIcons.userStar, label: 'Star/Favorite'),
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
        _IconWithLabel(icon: FlashcardIcons.mediaPlay, label: 'Play'),
        _IconWithLabel(icon: FlashcardIcons.mediaPause, label: 'Pause'),
        _IconWithLabel(icon: FlashcardIcons.mediaMic, label: 'Microphone'),
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
        _IconWithLabel(icon: FlashcardIcons.fileDocument, label: 'Document'),
        _IconWithLabel(icon: FlashcardIcons.fileUpload, label: 'Upload File'),
        _IconWithLabel(icon: FlashcardIcons.fileTable, label: 'Spreadsheet'),
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
        _IconWithLabel(icon: FlashcardIcons.emptyInbox, label: 'Empty Inbox'),
        _IconWithLabel(icon: FlashcardIcons.emptyChat, label: 'Empty Chat'),
        _IconWithLabel(icon: FlashcardIcons.emptyTopics, label: 'Empty Topics'),
        _IconWithLabel(icon: FlashcardIcons.emptySearch, label: 'No Results'),
        _IconWithLabel(icon: FlashcardIcons.navigationBack, label: 'Back'),
        _IconWithLabel(icon: FlashcardIcons.navigationSearch, label: 'Search'),
        _IconWithLabel(icon: FlashcardIcons.navigationMore, label: 'More Options'),
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
        const FcIcon(FlashcardIcons.actionSend, size: FcIconSize.small),
        const SizedBox(height: 24),
        const Text('Medium (20px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(FlashcardIcons.actionSend, size: FcIconSize.medium),
        const SizedBox(height: 24),
        const Text('Large (24px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(FlashcardIcons.actionSend, size: FcIconSize.large),
        const SizedBox(height: 24),
        const Text('Extra Large (32px)', style: TextStyle(fontSize: 12)),
        const SizedBox(height: 8),
        const FcIcon(FlashcardIcons.actionSend, size: FcIconSize.xLarge),
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
              FlashcardIcons.statusSuccess,
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
              FlashcardIcons.statusError,
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
              FlashcardIcons.statusWarning,
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
              FlashcardIcons.statusInfo,
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
