import 'package:flutter/material.dart';

class PromptDialog extends StatelessWidget {
  final Function _stop;

  PromptDialog(this._stop);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure?'),
          actions: [
            FlatButton(
              child: const Text('Yes'), 
              onPressed: () { 
                if(this._stop != null)
                  this._stop(); 
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: const Text('Cancel'), 
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        )
    );
  }
}