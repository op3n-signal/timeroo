import 'package:flutter/material.dart';

import 'dart:async';

import '../utility/file.dart';
import '../widgets/controls.dart';
import '../widgets/roundInfo.dart';
import '../widgets/time.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Audio _soundPlayer = Audio();
  Timer _timer;
  int _round;
  int _minutes;
  int _seconds;
  int _roundSeconds;
  int _breakSeconds;
  bool _isBreak;
  bool _isStopped;
  bool _skip;

  @override
  void initState() {
    _skip = false;
    _isStopped = true;
    _round = 1;
    _minutes = 0;
    _roundSeconds = 5;
    _seconds = _roundSeconds;
    _breakSeconds = 0;
    _isBreak = false;
    super.initState();
  }

  void _startInterval() {
    _timer = Timer.periodic(new Duration(seconds: 1), (t) {
      //play audio clips
      _audioClipHandler();
      //increment mins, seconds
      _incRoundInfo();
    });
  }

  void _pauseInterval() {
    this._timer.cancel();
  }

  void _stopInterval() {
    if (this._timer != null) {
      this._timer.cancel();
      setState(() {
        this._isStopped = true;
        this._isBreak = false;
        this._roundSeconds = 5;
        this._seconds = this._roundSeconds;
        this._minutes = 0;
        this._round = 1;
      });
    }
  }

  void _audioClipHandler() {
    if (this._minutes == 0 && (this._seconds == 0 || this._seconds == 10)) {
      if (this._seconds == 0) {
        if (_soundPlayer.cache.fixedPlayer.state != Audio.playState)
          _soundPlayer.play(Audio.bell);
      } else {
        if (_soundPlayer.cache.fixedPlayer.state != Audio.playState)
          _soundPlayer.play(Audio.sticks);
      }
    }
  }

  void _incRoundInfo() {
    setState(() {
      if (this._skip) this._skip = false;

      if (this._minutes == 0 && this._seconds == 0) {
        if (this._isBreak == false && this._isStopped == false) {
          this._isBreak = true;
          this._breakSeconds = 60;
        } else {
          if (this._isBreak == true) {
            this._isBreak = false;
            this._round += 1;
            if (this._round == 13) _stopInterval();
          }
          this._minutes = 3;
        }
        this._skip = true;
      }

      if (this._isStopped == true && this._seconds == 0) this._isStopped = false;

      if (!this._skip) {
        if (this._minutes != 0 && this._roundSeconds == 0) {
          this._minutes -= 1;
          this._roundSeconds = 60;
        }
        if (this._minutes == 3) {
          this._minutes = 2;
          this._roundSeconds = 0;
        }
      }

      if (this._isBreak == true) {
        if (!this._skip) this._breakSeconds -= 1;
        this._seconds = this._breakSeconds;
      } else {
        if (!this._skip) {
          this._roundSeconds -= 1;
          this._seconds = this._roundSeconds;
        }
      }
    });
  }

  @override
  void dispose() {
    if (this._timer != null) _timer.cancel();    
    super.dispose();  
  }

  @override
  Widget build(BuildContext context) {
    _soundPlayer.load();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RoundInfo(this._isStopped, this._isBreak, this._round.toString()),
          Time(this._minutes, this._seconds),
          Controls(_startInterval, _stopInterval, _pauseInterval)
        ],
      ),
    );
  }
}
