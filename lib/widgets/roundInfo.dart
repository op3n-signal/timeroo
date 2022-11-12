import 'package:flutter/material.dart';

class RoundInfo extends StatefulWidget {
  final bool _isStopped;
  final bool _isBreak;
  final String _round;

  const RoundInfo(this._isStopped, this._isBreak, this._round);

  @override
  _RoundInfoState createState() => _RoundInfoState();
}

class _RoundInfoState extends State<RoundInfo> {
  String roundText;

  @override
  void initState() {
    roundText = 'Ready';
    super.initState();
  }

  String getText() {
    if(!this.widget._isStopped)
    setState(() {
      this.roundText = this.widget._isBreak == true ? 'Break' : 'Round ' + this.widget._round.toString();      
    });
    return this.roundText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(getText())
        ]
      ),
    );
  }
}