import 'package:flutter/material.dart';
import '../organisms/fc_header.dart';

/// Flashcard Main Content Template
///
/// A standard app screen layout with header, scrollable content, and optional FAB.
/// Used for most app screens.
///
/// ## Usage
///
/// ```dart
/// FcMainContentTemplate(
///   title: 'Home',
///   body: Column(
///     children: [
///       // Your content
///     ],
///   ),
///   floatingActionButton: FloatingActionButton(
///     onPressed: () => print('Add'),
///     child: Icon(Icons.add),
///   ),
/// )
/// ```
class FcMainContentTemplate extends StatelessWidget {
  /// Screen title
  final String title;

  /// Main content widget
  final Widget body;

  /// App bar widget (overrides default header)
  final PreferredSizeWidget? appBar;

  /// Floating action button
  final Widget? floatingActionButton;

  /// FAB location
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Bottom navigation bar
  final Widget? bottomNavigationBar;

  /// Background color
  final Color? backgroundColor;

  /// Custom padding for body
  final EdgeInsetsGeometry? padding;

  /// Whether the body should be wrapped in SingleChildScrollView
  final bool scrollable;

  const FcMainContentTemplate({
    super.key,
    required this.title,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.padding,
    this.scrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = body;

    // Add padding if specified
    if (padding != null) {
      content = Padding(
        padding: padding!,
        child: content,
      );
    }

    // Wrap in scroll view if needed
    if (scrollable) {
      content = SingleChildScrollView(
        child: content,
      );
    }

    return Scaffold(
      appBar: appBar ?? FcHeader(title: title),
      body: content,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: backgroundColor,
    );
  }
}
