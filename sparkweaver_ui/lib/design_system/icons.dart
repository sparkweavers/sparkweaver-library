import 'package:flutter/material.dart';

/// Sparkweaver Icons
///
/// Centralized icon constants for consistent icon usage across the component library.
/// These constants reference Material Icons and provide semantic naming for common use cases.
///
/// ## Usage
///
/// ```dart
/// FcIcon(SparkweaverIcons.actionSend)
/// FcIcon(SparkweaverIcons.statusSuccess, variant: FcIconVariant.success)
/// ```
class SparkweaverIcons {
  SparkweaverIcons._();

  // ==================== UI Actions ====================

  /// Send message or submit action
  static const IconData actionSend = Icons.send;

  /// Close or dismiss action
  static const IconData actionClose = Icons.close;

  /// Delete action
  static const IconData actionDelete = Icons.delete_outline;

  /// Attach file action
  static const IconData actionAttach = Icons.attach_file;

  /// Add action
  static const IconData actionAdd = Icons.add;

  /// Add circle outlined action
  static const IconData actionAddCircle = Icons.add_circle_outline;

  /// Upload action
  static const IconData actionUpload = Icons.upload;

  // ==================== Status & Feedback ====================

  /// Success status indicator
  static const IconData statusSuccess = Icons.check_circle_outline;

  /// Success status filled
  static const IconData statusSuccessFilled = Icons.check_circle;

  /// Error status indicator
  static const IconData statusError = Icons.error_outline;

  /// Warning status indicator
  static const IconData statusWarning = Icons.warning_amber_outlined;

  /// Info status indicator
  static const IconData statusInfo = Icons.info_outline;

  /// Check/complete indicator
  static const IconData statusCheck = Icons.check;

  // ==================== User & Identity ====================

  /// User/person icon
  static const IconData userPerson = Icons.person;

  /// AI/bot/assistant icon
  static const IconData userAI = Icons.smart_toy;

  /// Star icon (for favorites, ratings)
  static const IconData userStar = Icons.star;

  // ==================== Media Controls ====================

  /// Play media
  static const IconData mediaPlay = Icons.play_arrow;

  /// Pause media
  static const IconData mediaPause = Icons.pause;

  /// Microphone/record
  static const IconData mediaMic = Icons.mic;

  // ==================== File & Document Operations ====================

  /// Document/file icon
  static const IconData fileDocument = Icons.description;

  /// Upload file icon
  static const IconData fileUpload = Icons.upload_file;

  /// Spreadsheet/table icon
  static const IconData fileTable = Icons.table_chart;

  // ==================== Navigation & Empty States ====================

  /// Empty inbox state
  static const IconData emptyInbox = Icons.inbox_outlined;

  /// Empty chat/conversation state
  static const IconData emptyChat = Icons.chat_bubble_outline;

  /// Empty topics state
  static const IconData emptyTopics = Icons.topic_outlined;

  /// No search results
  static const IconData emptySearch = Icons.search_off;

  /// Back navigation
  static const IconData navigationBack = Icons.arrow_back;

  /// Search
  static const IconData navigationSearch = Icons.search;

  /// More options menu
  static const IconData navigationMore = Icons.more_vert;

  // ==================== Common UI Elements ====================

  /// Home
  static const IconData home = Icons.home;

  // ==================== Security & Input ====================

  /// Reveal password / show obscured text
  static const IconData actionVisibility = Icons.visibility;

  /// Hide password / obscure text
  static const IconData actionVisibilityOff = Icons.visibility_off;
}
