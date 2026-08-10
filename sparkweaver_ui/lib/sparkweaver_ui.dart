/// Sparkweaver UI Component Library
///
/// A comprehensive Flutter UI component library with a complete design system
/// for building Sparkweaver applications.
///
/// ## Features
///
/// - **Design System**: Colors, Typography, Spacing, and Design Tokens
/// - **Components**: Pre-built UI components (Badge, Chat Bubble, etc.)
/// - **SOLID Principles**: Built with clean architecture and best practices
/// - **DRY**: Reusable components that eliminate code duplication
///
/// ## Usage
///
/// ```dart
/// import 'package:sparkweaver_ui/sparkweaver_ui.dart';
///
/// // Use design system
/// Container(
///   color: SparkweaverColors.primary,
///   padding: SparkweaverSpacing.edgeInsetsLg,
///   child: Text('Hello', style: SparkweaverTypography.heading1),
/// )
///
/// // Use components
/// FcChatBubble(
///   message: 'Hello!',
///   isUser: true,
/// )
/// ```
library;

// Design System exports
export 'design_system/design_system.dart';

// Component exports (Atomic Design structure)
export 'components/components.dart';
