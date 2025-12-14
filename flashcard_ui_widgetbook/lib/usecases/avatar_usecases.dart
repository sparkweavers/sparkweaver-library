import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'User Avatar', type: FcAvatar)
Widget userAvatar(BuildContext context) {
  return Center(
    child: FcAvatar.user(context: context),
  );
}

@widgetbook.UseCase(name: 'AI Avatar', type: FcAvatar)
Widget aiAvatar(BuildContext context) {
  return Center(
    child: FcAvatar.ai(context: context),
  );
}

@widgetbook.UseCase(name: 'Avatar Sizes', type: FcAvatar)
Widget avatarSizes(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                FcAvatar.user(size: FcAvatarSizes.xs, context: context),
                const SizedBox(height: 4),
                const Text('XS (16)', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatar.user(size: FcAvatarSizes.sm, context: context),
                const SizedBox(height: 4),
                const Text('SM (24)', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatar.user(size: FcAvatarSizes.md, context: context),
                const SizedBox(height: 4),
                const Text('MD (32)', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatar.user(size: FcAvatarSizes.lg, context: context),
                const SizedBox(height: 4),
                const Text('LG (40)', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatar.user(size: FcAvatarSizes.xl, context: context),
                const SizedBox(height: 4),
                const Text('XL (48)', style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'User & AI Comparison', type: FcAvatar)
Widget userAiComparison(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            FcAvatar.user(context: context),
            const SizedBox(height: 8),
            const Text('User'),
          ],
        ),
        const SizedBox(width: 32),
        Column(
          children: [
            FcAvatar.ai(context: context),
            const SizedBox(height: 8),
            const Text('AI'),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Custom Avatar', type: FcAvatar)
Widget customAvatar(BuildContext context) {
  return Center(
    child: Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: [
        Column(
          children: [
            FcAvatar.custom(
              icon: Icons.star,
              backgroundColor: Colors.purple.withValues(alpha: 0.2),
              iconColor: Colors.purple,
            ),
            const SizedBox(height: 4),
            const Text('Custom 1', style: TextStyle(fontSize: 10)),
          ],
        ),
        Column(
          children: [
            FcAvatar.custom(
              icon: Icons.favorite,
              backgroundColor: Colors.red.withValues(alpha: 0.2),
              iconColor: Colors.red,
            ),
            const SizedBox(height: 4),
            const Text('Custom 2', style: TextStyle(fontSize: 10)),
          ],
        ),
        Column(
          children: [
            FcAvatar.custom(
              icon: Icons.code,
              backgroundColor: Colors.orange.withValues(alpha: 0.2),
              iconColor: Colors.orange,
            ),
            const SizedBox(height: 4),
            const Text('Custom 3', style: TextStyle(fontSize: 10)),
          ],
        ),
        Column(
          children: [
            FcAvatar.custom(
              icon: Icons.music_note,
              backgroundColor: Colors.teal.withValues(alpha: 0.2),
              iconColor: Colors.teal,
            ),
            const SizedBox(height: 4),
            const Text('Custom 4', style: TextStyle(fontSize: 10)),
          ],
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Variant Sizes', type: FcAvatar)
Widget variantSizes(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('User Variants', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FcAvatarVariants.userSmall(context: context),
                const SizedBox(height: 4),
                const Text('Small', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatarVariants.user(context: context),
                const SizedBox(height: 4),
                const Text('Default', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatarVariants.userLarge(context: context),
                const SizedBox(height: 4),
                const Text('Large', style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Text('AI Variants', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FcAvatarVariants.aiSmall(context: context),
                const SizedBox(height: 4),
                const Text('Small', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatarVariants.ai(context: context),
                const SizedBox(height: 4),
                const Text('Default', style: TextStyle(fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                FcAvatarVariants.aiLarge(context: context),
                const SizedBox(height: 4),
                const Text('Large', style: TextStyle(fontSize: 10)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
