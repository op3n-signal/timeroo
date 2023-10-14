import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audio_cache.dart';

class Audio {
  static String bell = 'sounds/bell.mp3';
  static String sticks = 'sounds/sticks.mp3';
 // static AudioPlayerState playState = AudioPlayerState.PLAYING;
  //final AudioPlayer _player = AudioPlayer();
  final AudioCache cache = AudioCache(prefix: 'assets/');
  

  void load() {
    //cache.fixedPlayer = _player;
  }

  void play(String sound) async {
    //await cache.play(sound);
  }
}