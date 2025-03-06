import 'package:audioplayers/audioplayers.dart';

abstract class AudioService {
  void Function()? onComplete;
  Future<void> play(String url);
  Future<void> pause();
  Future<void> stop();
  void dispose();
}

class AudioServiceImpl implements AudioService {
  final AudioPlayer _audioPlayer;

  AudioServiceImpl({required AudioPlayer audioPlayer})
    : _audioPlayer = audioPlayer {
    _audioPlayer.onPlayerComplete.listen((event) {
      if (onComplete != null) {
        onComplete!();
      }
    });
  }

  @override
  void Function()? onComplete;

  @override
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> play(String url) async {
    try {
      await _audioPlayer.play(UrlSource(url));
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
  }

  factory AudioServiceImpl.create() {
    return AudioServiceImpl(audioPlayer: AudioPlayer());
  }
}
