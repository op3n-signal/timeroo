import 'package:flutter/material.dart';

class PromptDialog extends StatelessWidget {
  final Function _stop;

  PromptDialog(this._stop);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Are you sure? The timer will be stopped.'),
          actions: [
            TextButton(
              child: const Text('Yes'), 
              onPressed: () { 
                this._stop(); 
                Navigator.pop(context, true);
              },
            ),
            TextButton(
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