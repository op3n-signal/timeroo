import 'package:flutter/material.dart';
import 'package:timeroo/helpers/boxing-timer.dart';
import 'package:timeroo/models/timer_details_model.dart';
import 'package:timeroo/widgets/roundInfo.dart';
import 'package:timeroo/widgets/shared/button.dart';
import 'package:timeroo/widgets/shared/dialog.dart';
import 'package:timeroo/widgets/time.dart';

import '../utility/file.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Audio _soundPlayer = Audio();
  final boxingTimer = BoxingTimer();
  String _buttonText = 'Start';

  @override
  void initState() {
    boxingTimer.tmrDetails = TimerDetails();
    boxingTimer.tmrDetails.seconds = boxingTimer.tmrDetails.roundSeconds;
    super.initState();
  }

  void _start() {
    setState(() {
      this._buttonText = 'Pause';
    });

    //play audio clips
    //_audioClipHandler();

    boxingTimer.startInterval(setState, boxingTimer.tmrDetails);
  }

  void _pause() {
    setState(() {
      this._buttonText = 'Resume';
    });

    this._pauseInterval();
  }

  void _prompt(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PromptDialog(boxingTimer.stopInterval);
        }).then((value) => {
          if (value == true) {_reset()}
        });
  }

  void _pauseInterval() {
    this.boxingTimer.cancelTimer();
  }

  void _reset() {
    setState(() {
      this._buttonText = 'Start';
    });
  }

  /* void _audioClipHandler() {
    final _tmrDetails = boxingTimer.tmrDetails;

    if (_tmrDetails.minutes == 0 &&
        (_tmrDetails.seconds == 0 || _tmrDetails.seconds == 10)) {
      if (_tmrDetails.seconds == 0) {
        //if (_soundPlayer.cache.fixedPlayer.state != Audio.playState)
        _soundPlayer.play(Audio.bell);
      } else {
        //if (_soundPlayer.cache.fixedPlayer.state != Audio.playState)
        _soundPlayer.play(Audio.sticks);
      }
    }
  } */

  @override
  void dispose() {
    this.boxingTimer.cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _soundPlayer.load();
    final _tmrDetails = boxingTimer.tmrDetails;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RoundInfo(_tmrDetails.isStopped, _tmrDetails.isBreak,
              _tmrDetails.round.toString()),
          Time(_tmrDetails.minutes, _tmrDetails.seconds),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ControlButton(
                    this._buttonText == 'Start' || this._buttonText == 'Resume'
                        ? this._start
                        : this._pause,
                    this._buttonText,
                    null),
                ControlButton(this._prompt, 'Stop', context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
