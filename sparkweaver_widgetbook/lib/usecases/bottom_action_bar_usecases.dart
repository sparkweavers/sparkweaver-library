import 'package:sparkweaver_ui/sparkweaver_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Enabled', type: FcBottomActionBar)
Widget enabledBottomActionBar(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Content goes here')),
    bottomNavigationBar: FcBottomActionBar(
      label: 'New Course',
      icon: Icons.add,
      onPressed: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: FcBottomActionBar)
Widget disabledBottomActionBar(BuildContext context) {
  return Scaffold(
    body: const Center(child: Text('Content goes here')),
    bottomNavigationBar: FcBottomActionBar(
      label: 'Ask a question',
      icon: Icons.chat_bubble_outline,
      onPressed: () {},
      enabled: false,
    ),
  );
}

@widgetbook.UseCase(name: 'Pulsing', type: FcBottomActionBar)
Widget pulsingBottomActionBar(BuildContext context) {
  return const _PulsingBottomActionBarDemo();
}

/// Drives the pulse animation so the Widgetbook canvas can show the bar's
/// height staying fixed while only the inner button scales.
class _PulsingBottomActionBarDemo extends StatefulWidget {
  const _PulsingBottomActionBarDemo();

  @override
  State<_PulsingBottomActionBarDemo> createState() =>
      _PulsingBottomActionBarDemoState();
}

class _PulsingBottomActionBarDemoState
    extends State<_PulsingBottomActionBarDemo>
    with SingleTickerProviderStateMixin {
  // Mirrors the caller's pulse in sparkweaver-app so the preview matches the
  // device; repeats only because a use case has nothing to trigger it.
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  )..repeat();
  late final Animation<double> _pulse = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 1),
    TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 1),
  ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Content goes here')),
      bottomNavigationBar: FcBottomActionBar(
        label: 'Ask a question',
        icon: Icons.chat_bubble_outline,
        onPressed: () {},
        scale: _pulse,
      ),
    );
  }
}
