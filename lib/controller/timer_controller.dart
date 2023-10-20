import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeroo/controller/settings_controller.dart';
import 'package:timeroo/utility/file.dart';
import 'package:timeroo/widgets/shared/dialog.dart';

class TimerController extends GetxController {
  final _audio = Audio();
  Timer _timer = Timer(Duration.zero, () => null);
  int round = 1;
  int minutes = 0;
  RxInt seconds = 0.obs;
  int roundSeconds = SettingsController.to.warmup.value;
  bool isBreak = false;
  int breakSeconds = 0;
  bool isStopped = true;
  bool skip = false;
  RxString buttonText = 'Start'.obs;

  @override
  void onInit() {
    seconds.value = roundSeconds;
    
    super.onInit();
  }

  void startInterval() {
    //issue with prompt showing when timer is on

    //issue with audio stopping spotify

    //issue with timer maybe not working in background
    SettingsController.to.isActive = true;

    _timer = Timer.periodic(new Duration(seconds: 1), (t) {
      _incrementTimerInfo();
    });
  }

  void _incrementTimerInfo() {
    //Reset skip value since we only need this to be true when minutes and seconds are 0
    if (skip) skip = false;

    _notifyEndOfBreak();

    _notifyTimerHasStarted();

    _decrementRoundMinutes();

    _decrementSeconds();
  }

  void _notifyEndOfBreak() {
    if (minutes == 0 && seconds.value == 0) {
      skip = true;
      final currentSettings = SettingsController.to;

      if (isBreak == false && isStopped == false) {
        isBreak = true;
        breakSeconds = currentSettings.secondsPerBreak.value;
      } else {
        if (isBreak) {
          isBreak = false;
          round += 1;
          if (round == currentSettings.maxRounds.value)
            stopInterval(); //Stop timer when we reach the last round specified in settings
        }
        minutes = currentSettings.minutesPerRound.value;
      }
    }
  }

   //This is so we don't run certain sections until the timer has Offically started
  void _notifyTimerHasStarted() {
    if (isStopped && seconds.value == 0)
      isStopped = false;
  }

  void _decrementRoundMinutes() {
    if (!skip) {
      if (minutes != 0 && roundSeconds == 0) {
        minutes -= 1;
        roundSeconds =
            60; //must reset seconds when minute decrements
      }

      final maxRounds = SettingsController.to.maxRounds.value;

      if (minutes == maxRounds) {
        minutes = maxRounds - 1;
        roundSeconds = 0; //for beginning of round after break
      }
    }
  }

  void _decrementSeconds() {
    if (isBreak) {
      if (!skip) breakSeconds -= 1;
      seconds.value = breakSeconds;
    } else {
      if (!skip) {
        roundSeconds -= 1;
        seconds.value = roundSeconds;
      }
    }

    playBellSound();

    playStickSound();
  }

  void start() {
    buttonText.value = 'Pause';

    startInterval();
  }

  void stopInterval() {
      _cancelTimer();

      isStopped = true;
      isBreak = false;
      roundSeconds = 5;
      seconds.value = roundSeconds;
      minutes = 0;
      round = 1;
  }

  void pause() {
    buttonText.value = 'Resume';

    _timer.cancel();
  }

  //Destroy the timer
  void _cancelTimer() {
      this._timer.cancel();
      SettingsController.to.isActive = false;
  }

  void reset() {
    buttonText.value = 'Start';
  }

   void playStickSound() {
    if (minutes == 0 && seconds.value == 10)
      _audio..play(Audio.SticksSoundPath);
  }

  void playBellSound() {
    if (minutes == 0 && seconds.value == 0)
      _audio.play(Audio.BellSoundPath);
  }

  void prompt(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PromptDialog(stopInterval);
        }).then((value) {
      if (value == true) reset();
    });
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }
}