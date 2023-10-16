import 'dart:async';

import 'package:timeroo/models/timer_details_model.dart';
import 'package:timeroo/utility/file.dart';

class BoxingTimer {
  Timer? _timer;
  TimerDetails tmrDetails = TimerDetails();
  final _soundPlayer = Audio();

  void startInterval(Function setState, TimerDetails timerDetailsState) {
    _timer = Timer.periodic(new Duration(seconds: 1), (t) {
      _incrementTimerInfo();

      setState(() {
        timerDetailsState = tmrDetails;
      });
    });
  }

  void _incrementTimerInfo() {
    //Reset skip value since we only need this to be true when minutes and seconds are 0
    if (tmrDetails.skip) tmrDetails.skip = false;

    _notifyEndOfBreak();

    _notifyTimerHasStarted();

    _decrementRoundMinutes();

    _decrementSeconds();
  }

  void _decrementSeconds() {
    if (tmrDetails.isBreak) {
      if (!tmrDetails.skip) tmrDetails.breakSeconds -= 1;
      tmrDetails.seconds = tmrDetails.breakSeconds;
    } else {
      if (!tmrDetails.skip) {
        tmrDetails.roundSeconds -= 1;
        tmrDetails.seconds = tmrDetails.roundSeconds;
      }
    }

    playBellSound();

    playStickSound();
  }

  void _decrementRoundMinutes() {
    if (!tmrDetails.skip) {
      if (tmrDetails.minutes != 0 && tmrDetails.roundSeconds == 0) {
        tmrDetails.minutes -= 1;
        tmrDetails.roundSeconds =
            60; //must reset seconds when minute decrements
      }
      if (tmrDetails.minutes == 3) {
        tmrDetails.minutes = 2;
        tmrDetails.roundSeconds = 0; //for beginning of round after break
      }
    }
  }

  void _notifyEndOfBreak() {
    if (tmrDetails.minutes == 0 && tmrDetails.seconds == 0) {
      tmrDetails.skip = true;

      if (tmrDetails.isBreak == false && tmrDetails.isStopped == false) {
        tmrDetails.isBreak = true;
        tmrDetails.breakSeconds = 60;
      } else {
        if (tmrDetails.isBreak) {
          tmrDetails.isBreak = false;
          tmrDetails.round += 1;
          if (tmrDetails.round == 13)
            stopInterval(); //Stop timer when we reach the last round specified in settings
        }
        tmrDetails.minutes = 3;
      }
    }
  }

  //This is so we don't run certain sections until the timer has Offically started
  void _notifyTimerHasStarted() {
    if (tmrDetails.isStopped && tmrDetails.seconds == 0)
      tmrDetails.isStopped = false;
  }

  //Destroy the timer
  void cancelTimer() {
    if (this._timer != null) this._timer!.cancel();
  }

  void stopInterval() {
    if (this._timer != null) {
      this._timer!.cancel();

      tmrDetails.isStopped = true;
      tmrDetails.isBreak = false;
      tmrDetails.roundSeconds = 5;
      tmrDetails.seconds = tmrDetails.roundSeconds;
      tmrDetails.minutes = 0;
      tmrDetails.round = 1;
    }
  }

  void playStickSound() {
    if (tmrDetails.minutes == 0 && tmrDetails.seconds == 10)
      _soundPlayer.play(Audio.SticksSoundPath);
  }

  void playBellSound() {
    if (tmrDetails.minutes == 0 && tmrDetails.seconds == 0)
      _soundPlayer.play(Audio.BellSoundPath);
  }
}
