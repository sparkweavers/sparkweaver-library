/// Flashcard UI Components
///
/// All UI components organized by Atomic Design principles.
///
/// ## Atomic Design Hierarchy
///
/// **Atoms** - Smallest building blocks (single-purpose elements)
/// - Avatar, Badge, Button, Icon, etc.
///
/// **Molecules** - Simple combinations of atoms
/// - Chat bubble (avatar + text + badges), Input field with label, etc.
///
/// **Organisms** - Complex UI sections
/// - Chat conversation list, File upload panel, etc.
///
/// **Templates** - Page-level layouts
/// - Chat screen layout, Settings page layout, etc.
library;

// Atoms - Single-purpose UI elements
export 'atoms/fc_avatar.dart';
export 'atoms/fc_badge.dart';

// Molecules - Simple combinations of atoms
export 'molecules/fc_chat_bubble.dart';

// Organisms - Complex UI sections (future components)

// Templates - Page layouts (future components)
