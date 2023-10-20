import 'package:flutter/material.dart';

class Themes {
  static const _TextTheme = TextTheme(
      bodyLarge: TextStyle(fontSize: 44.0, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w300),
      bodySmall: TextStyle(fontSize: 12.0),
      labelLarge: TextStyle(fontSize: 26.0),
    );


  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: _TextTheme,
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],
    scaffoldBackgroundColor: Colors.black45,
    textTheme: _TextTheme,
  );
}
