import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';

class Audio {
  static const String BellSoundPath = 'sounds/bell.mp3';
  static const String SticksSoundPath = 'sounds/sticks.mp3';
  
  final _player = AudioPlayer();

  void play(String sound) async {
    await _player.play(AssetSource(sound));
  }
}