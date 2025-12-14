import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_text.dart';

/// Flashcard Header Component (Organism)
///
/// A reusable app bar/header with title and customizable actions.
/// Generic component that can be used across different screens.
///
/// ## Usage
///
/// ```dart
/// // Basic header with title
/// FcHeader(
///   title: 'My App',
/// )
///
/// // Header with actions
/// FcHeader(
///   title: 'Settings',
///   actions: [
///     IconButton(
///       icon: Icon(Icons.search),
///       onPressed: () => print('Search'),
///     ),
///     IconButton(
///       icon: Icon(Icons.more_vert),
///       onPressed: () => print('More'),
///     ),
///   ],
/// )
///
/// // Header with leading button
/// FcHeader(
///   title: 'Details',
///   leading: IconButton(
///     icon: Icon(Icons.arrow_back),
///     onPressed: () => Navigator.pop(context),
///   ),
/// )
/// ```
class FcHeader extends StatelessWidget implements PreferredSizeWidget {
  /// Header title
  final String title;

  /// Leading widget (e.g., back button, menu icon)
  final Widget? leading;

  /// Action widgets (e.g., search, settings icons)
  final List<Widget>? actions;

  /// Background color
  final Color? backgroundColor;

  /// Elevation
  final double elevation;

  /// Whether to center the title
  final bool centerTitle;

  /// Custom title widget (overrides title string)
  final Widget? titleWidget;

  const FcHeader({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.elevation = 4.0,
    this.centerTitle = false,
    this.titleWidget,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = FlashcardColorScheme.of(context);
    return AppBar(
      leading: leading,
      title: titleWidget ??
          FcText(
            title,
            style: FcTextStyle.heading3,
            color: colors.textPrimary,
          ),
      actions: actions,
      backgroundColor: backgroundColor ?? colors.surface,
      elevation: elevation,
      centerTitle: centerTitle,
    );
  }
}
