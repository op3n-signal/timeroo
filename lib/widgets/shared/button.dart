import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final Function? _method;
  final String? _buttonText;
  final BuildContext? _context;

  const ControlButton(this._method, this._buttonText, this._context);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: () {
          if(this._context != null)
            this._method!(this._context);
          else
            this._method!();
        },
        child: Text(this._buttonText!, style: Theme.of(context).textTheme.bodyMedium,)
        )
    );
  }
}
