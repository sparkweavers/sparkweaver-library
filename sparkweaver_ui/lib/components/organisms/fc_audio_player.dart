import 'package:flutter/material.dart';
import '../../design_system/design_system.dart';
import '../atoms/fc_button.dart';
import '../atoms/fc_icon.dart';
import '../atoms/fc_loading_indicator.dart';
import '../atoms/fc_text.dart';

/// Audio Player State
enum FcAudioPlayerState { loading, playing, paused, error }

/// Sparkweaver Audio Player Component (Organism)
///
/// An audio player with play/pause controls and loading/error states.
/// Accepts audio source and state management from parent.
///
/// ## Usage
///
/// ```dart
/// FcAudioPlayer(
///   state: _playerState,
///   onPlay: () {
///     // Play audio
///   },
///   onPause: () {
///     // Pause audio
///   },
/// )
///
/// // With error state
/// FcAudioPlayer(
///   state: FcAudioPlayerState.error,
///   errorMessage: 'Failed to load audio',
/// )
/// ```
class FcAudioPlayer extends StatelessWidget {
  /// Current player state
  final FcAudioPlayerState state;

  /// Callback when play button is pressed
  final VoidCallback? onPlay;

  /// Callback when pause button is pressed
  final VoidCallback? onPause;

  /// Error message (shown when state is error)
  final String? errorMessage;

  /// Whether to show controls in compact mode
  final bool compact;

  const FcAudioPlayer({
    super.key,
    required this.state,
    this.onPlay,
    this.onPause,
    this.errorMessage,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SparkweaverTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Loading state
        if (state == FcAudioPlayerState.loading)
          FcLoadingIndicator(
            size: compact ? FcLoadingSize.small : FcLoadingSize.medium,
          ),

        // Error state
        if (state == FcAudioPlayerState.error)
          Row(
            children: [
              FcIcon(
                Icons.error_outline,
                size: FcIconSize.medium,
                color: colors.error,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FcText(
                  errorMessage ?? 'Audio failed to load',
                  style: FcTextStyle.bodySmall,
                  color: colors.error,
                ),
              ),
            ],
          ),

        // Play/Pause controls
        if (state == FcAudioPlayerState.playing ||
            state == FcAudioPlayerState.paused)
          FcButton.icon(
            icon: state == FcAudioPlayerState.playing
                ? Icons.pause
                : Icons.play_arrow,
            onPressed: state == FcAudioPlayerState.playing ? onPause : onPlay,
            size: compact ? FcButtonSize.small : FcButtonSize.medium,
            variant: FcButtonVariant.primary,
          ),
      ],
    );
  }
}
