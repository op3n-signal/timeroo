import 'package:flutter/material.dart';

class RoundInfo extends StatelessWidget {
  RoundInfo(this._isStopped, this._isBreak, this._round);

  final bool _isStopped;
  final bool _isBreak;
  final String _round;

  @override
  Widget build(BuildContext context) {
    if (this._isBreak) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Round ' + this._round.toString(),
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0), // Uniform radius
                ),
                child: Text(
                  'Break',
                  style: TextStyle(fontSize: 50),
                )),
          ]);
    } else if (this._isStopped) {
      return Text(
        'Get Ready!',
        style: Theme.of(context).textTheme.bodyLarge,
      );
    } else {
      return Text(
        'Round ' + this._round.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      );
    }
  }
}
