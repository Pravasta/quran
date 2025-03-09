import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/repositories/get_detail_surah_response_model.dart';
import 'package:quran/core/services/audio_service.dart';

part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  AudioPlayerCubit(this._audioService) : super(AudioPlayerState()) {
    _audioService.onComplete = _onAyatComplete;
  }

  final AudioService _audioService;
  List<Ayat> _listAyat = [];

  void setAyatList(List<Ayat> listAyat) {
    _listAyat = listAyat;
  }

  void play(int noAyat, String url) async {
    if (state.isPlaying && state.currentAyatId == noAyat) {
      await _audioService.stop();
      emit(state.copyWith(isPlaying: false, currentAyatId: null));
      return;
    }

    if (state.isPlaying) {
      await _audioService.stop();
    }

    try {
      await _audioService.play(url);
      emit(state.copyWith(isPlaying: true, currentAyatId: noAyat));
    } catch (e) {
      emit(
        state.copyWith(
          isPlaying: false,
          currentAyatId: null,
          message: e.toString(),
        ),
      );
    }
  }

  void pause() async {
    try {
      await _audioService.pause();
      emit(state.copyWith(isPlaying: false));
    } catch (e) {
      emit(
        state.copyWith(
          isPlaying: true,
          message: e.toString(),
          currentAyatId: null,
        ),
      );
    }
  }

  void stop() async {
    emit(state.copyWith(isPlaying: false));
    try {
      await _audioService.stop();
      emit(state.copyWith(isPlaying: false));
    } catch (e) {
      emit(
        state.copyWith(
          isPlaying: true,
          message: e.toString(),
          currentAyatId: null,
        ),
      );
    }
  }

  void playNext() {
    final currentAyatIndex = _listAyat.indexWhere(
      (element) => element.nomorAyat == state.currentAyatId,
    );
    if (currentAyatIndex == _listAyat.length - 1) {
      emit(state.copyWith(isPlaying: false, currentAyatId: null));
      return;
    }

    final nextAyat = _listAyat[currentAyatIndex + 1];
    play(nextAyat.nomorAyat!, nextAyat.audio!.the05 ?? '');
  }

  void _onAyatComplete() {
    playNext();
  }

  @override
  Future<void> close() {
    _audioService.dispose();
    return super.close();
  }
}
