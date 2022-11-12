import 'package:flutter/material.dart';
import 'shared/dialog.dart';
import 'shared/button.dart';

class Controls extends StatefulWidget{
  final Function startInterval;
  final Function stopInterval;
  final Function pauseInterval;

  Controls(
    this.startInterval, 
    this.stopInterval,
    this.pauseInterval
  );

  @override
  _ControlsState createState() => _ControlsState();
}

class _ControlsState extends State<Controls> {
  static final List<String> _btnTxtArr = ['Start', 'Pause', 'Resume'];
  String _buttonText;

  @override
  void initState() {
    _buttonText = 'Start';
    super.initState();
  }

  void _start() {
    if(this._buttonText == 'Start' || this._buttonText == 'Resume') {
      setState(() {
        this._buttonText = 'Pause';
      });
    } 
    this.widget.startInterval();
  }

  void _pause() {
    if(this._buttonText == 'Pause') {
      setState(() {
        this._buttonText = 'Resume';
      });
    }
    this.widget.pauseInterval();
  }

  void _reset() {
    setState(() {
      this._buttonText = 'Start';
    });
  }

  void _prompt(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
      return PromptDialog(this.widget.stopInterval);
    }).then((value) => {
      if(value == true) {
        _reset()        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlButton(
                this._buttonText == _btnTxtArr[0] || this._buttonText == _btnTxtArr[2] ? this._start : this._pause,
                this._buttonText,
                null
                ),
              ControlButton(this._prompt, 'Stop', context)
            ],
          )
    );
  }
}