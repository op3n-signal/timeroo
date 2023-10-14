import 'package:flutter/material.dart';
import 'package:timeroo/helpers/boxing-timer.dart';
import 'shared/dialog.dart';
import 'shared/button.dart';

class Controls extends StatefulWidget {
  final Function stopInterval;
  final Function pauseInterval;

  Controls(this.stopInterval, this.pauseInterval);

  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  final boxingTimer = BoxingTimer();
  String? _buttonText;

  @override
  void initState() {
    _buttonText = 'Start';
    super.initState();
  }

  void _pause() {
    setState(() {
      this._buttonText = 'Resume';
    });

    this.widget.pauseInterval();
  }

  void _reset() {
    setState(() {
      this._buttonText = 'Start';
    });
  }

  void _prompt(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return PromptDialog(_reset);
        }).then((value) => {
          if (value == true) {_reset()}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ControlButton(
            this._buttonText == 'Start' || this._buttonText == 'Resume'
                ? null
                : this._pause,
            this._buttonText,
            null),
        ControlButton(this._prompt, 'Stop', context)
      ],
    ));
  }
}
