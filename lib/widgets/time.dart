import 'package:flutter/material.dart';

class Time extends StatefulWidget {
  final int _minutes;
  final int _seconds;

  const Time(this._minutes, this._seconds);

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.widget._minutes.toString().padLeft(2, '0') + ':' + this.widget._seconds.toString().padLeft(2, '0'),
        style: Theme.of(context).textTheme.bodyLarge,
        ),
      );
  }
}