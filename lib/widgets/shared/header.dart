import 'package:flutter/material.dart';

class AppBarHeader {
  
  static PreferredSizeWidget getAppBar() {
    return AppBar(
          title: const Text('Timeroo'),
          centerTitle: true,
        );
  }
}