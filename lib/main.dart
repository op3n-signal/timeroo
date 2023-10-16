import 'package:flutter/material.dart';

import 'navControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeroo',
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 20.0),
            bodyMedium: TextStyle(fontSize: 44.0),
            labelLarge: TextStyle(fontSize: 26.0),
          ),
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(150, 160, 200, 1)
            )
          ),
      initialRoute: '/',
      routes: {
        '/': (context) => NavControl() //nav control holds the routes, home (timer info) is first in list
      },
    );
  }
}
