part of 'audio_player_cubit.dart';

class AudioPlayerState {
  final String? message;
  final bool isPlaying;
  final int? currentAyatId;

  AudioPlayerState({this.message, this.isPlaying = false, this.currentAyatId});

  AudioPlayerState copyWith({
    String? message,
    bool? isPlaying,
    int? currentAyatId,
  }) {
    return AudioPlayerState(
      message: message ?? this.message,
      isPlaying: isPlaying ?? this.isPlaying,
      currentAyatId: currentAyatId ?? this.currentAyatId,
    );
  }
}
