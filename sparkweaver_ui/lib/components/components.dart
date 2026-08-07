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
export 'atoms/fc_button.dart';
export 'atoms/fc_icon.dart';
export 'atoms/fc_input_field.dart';
export 'atoms/fc_loading_indicator.dart';
export 'atoms/fc_text.dart';

// Molecules - Simple combinations of atoms
export 'molecules/fc_banner.dart';
export 'molecules/fc_chat_bubble.dart';
export 'molecules/fc_file_list_item.dart';
export 'molecules/fc_flip_card.dart';
export 'molecules/fc_input_field_with_label.dart';
export 'molecules/fc_password_input_field.dart';
export 'molecules/fc_self_rating_bar.dart';
export 'molecules/fc_status_message.dart';

// Organisms - Complex UI sections
export 'organisms/fc_app_drawer.dart';
export 'organisms/fc_audio_player.dart';
export 'organisms/fc_chat_overlay.dart';
export 'organisms/fc_conversation_list.dart';
export 'organisms/fc_dialog.dart';
export 'organisms/fc_empty_state.dart';
export 'organisms/fc_error_state.dart';
export 'organisms/fc_file_upload_panel.dart';
export 'organisms/fc_header.dart';
export 'organisms/fc_input_area.dart';
export 'organisms/fc_mc_question_card.dart';
export 'organisms/fc_open_answer_card.dart';
export 'organisms/fc_reconnect_prompt.dart';

// Templates - Page layouts
export 'templates/fc_auth_form_template.dart';
export 'templates/fc_list_detail_template.dart';
export 'templates/fc_main_content_template.dart';
export 'templates/fc_results_screen.dart';
