import 'package:audioplayers/audioplayers.dart';

class Audio {
  static const String BellSoundPath = 'sounds/bell.mp3';
  static const String SticksSoundPath = 'sounds/sticks.mp3';
  
  final _player = AudioPlayer();
  static AudioCache player = AudioCache();
  
  void init() async {
    await _player.setReleaseMode(ReleaseMode.stop);
    await _player.setAudioContext(AudioContext(
      android: AudioContextAndroid(
        audioFocus: AndroidAudioFocus.gainTransientMayDuck
      )
    ));
  }

  void play(String sound) async {
    await _player.play(AssetSource(sound));
  }
}