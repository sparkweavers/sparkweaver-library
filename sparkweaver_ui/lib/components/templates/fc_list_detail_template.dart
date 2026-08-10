import 'package:flutter/material.dart';
import '../atoms/fc_loading_indicator.dart';
import '../organisms/fc_empty_state.dart';
import '../organisms/fc_error_state.dart';
import '../organisms/fc_header.dart';

/// List Detail Template State
enum FcListState { loading, loaded, empty, error }

/// Sparkweaver List Detail Template
///
/// A master-detail list view template with loading, empty, and error states.
/// Used for list-based screens with expandable items.
///
/// ## Usage
///
/// ```dart
/// FcListDetailTemplate(
///   title: 'Topics',
///   state: _state,
///   itemCount: _items.length,
///   itemBuilder: (context, index) {
///     return ListTile(
///       title: Text(_items[index].name),
///     );
///   },
///   emptyStateMessage: 'No topics yet',
///   emptyStateIcon: Icons.topic_outlined,
///   floatingActionButton: FloatingActionButton(
///     onPressed: () => _createTopic(),
///     child: Icon(Icons.add),
///   ),
/// )
/// ```
class FcListDetailTemplate extends StatelessWidget {
  /// Screen title
  final String title;

  /// Current list state
  final FcListState state;

  /// Number of items in the list (when loaded)
  final int itemCount;

  /// Builder for list items
  final IndexedWidgetBuilder itemBuilder;

  /// App bar widget (overrides default header)
  final PreferredSizeWidget? appBar;

  /// Floating action button
  final Widget? floatingActionButton;

  /// FAB location
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Custom padding for the list
  final EdgeInsetsGeometry? padding;

  // Empty state properties
  final String? emptyStateMessage;
  final IconData? emptyStateIcon;
  final String? emptyStateActionLabel;
  final VoidCallback? onEmptyStateAction;

  // Error state properties
  final String? errorMessage;
  final VoidCallback? onRetry;

  const FcListDetailTemplate({
    super.key,
    required this.title,
    required this.state,
    required this.itemCount,
    required this.itemBuilder,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.padding,
    this.emptyStateMessage,
    this.emptyStateIcon,
    this.emptyStateActionLabel,
    this.onEmptyStateAction,
    this.errorMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ?? FcHeader(title: title),
      body: _buildBody(),
      floatingActionButton:
          (state == FcListState.loading || state == FcListState.error)
          ? null
          : floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }

  Widget _buildBody() {
    switch (state) {
      case FcListState.loading:
        return Center(child: FcLoadingIndicator(size: FcLoadingSize.large));

      case FcListState.error:
        return FcErrorState(
          message: errorMessage ?? 'Failed to load data',
          onRetry: onRetry,
        );

      case FcListState.empty:
        return FcEmptyState(
          icon: emptyStateIcon ?? Icons.inbox_outlined,
          title: emptyStateMessage ?? 'No items yet',
          actionLabel: emptyStateActionLabel,
          onAction: onEmptyStateAction,
        );

      case FcListState.loaded:
        return ListView.builder(
          padding: padding ?? const EdgeInsets.all(16),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
    }
  }
}
