import 'package:flashcard_ui/flashcard_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Loading State', type: FcAudioPlayer)
Widget loadingAudio(BuildContext context) {
  return const Center(
    child: FcAudioPlayer(state: FcAudioPlayerState.loading),
  );
}

@widgetbook.UseCase(name: 'Playing State', type: FcAudioPlayer)
Widget playingAudio(BuildContext context) {
  return Center(
    child: FcAudioPlayer(
      state: FcAudioPlayerState.playing,
      onPause: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Paused State', type: FcAudioPlayer)
Widget pausedAudio(BuildContext context) {
  return Center(
    child: FcAudioPlayer(
      state: FcAudioPlayerState.paused,
      onPlay: () {},
    ),
  );
}

@widgetbook.UseCase(name: 'Error State', type: FcAudioPlayer)
Widget errorAudio(BuildContext context) {
  return const Center(
    child: FcAudioPlayer(
      state: FcAudioPlayerState.error,
      errorMessage: 'Failed to load audio',
    ),
  );
}

@widgetbook.UseCase(name: 'Compact Mode', type: FcAudioPlayer)
Widget compactAudio(BuildContext context) {
  return Center(
    child: FcAudioPlayer(
      state: FcAudioPlayerState.paused,
      compact: true,
      onPlay: () {},
    ),
  );
}
