import 'package:flutter/material.dart';

class Themes {
  static const _TextTheme = TextTheme(
    bodyLarge: TextStyle(fontSize: 54.0, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(
        fontSize: 26.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodySmall: TextStyle(fontSize: 12.0),
    labelLarge: TextStyle(fontSize: 26.0),
  );

  static final light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: _TextTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
        return Colors.blue;
      }))));

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Color.fromARGB(255, 36, 36, 36),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Color.fromARGB(255, 21, 21, 21),
    ),
    textTheme: _TextTheme,
  );
}
