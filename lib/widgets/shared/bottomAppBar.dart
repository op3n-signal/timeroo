import 'package:flutter/material.dart';
import 'package:timeroo/controller/settings_controller.dart';
import 'package:timeroo/controller/timer_controller.dart';

import './dialog.dart';

Widget bottomAppBar(
    int selectedIndex, Function setIndex, BuildContext context) {
  return BottomNavigationBar(
    fixedColor: Colors.blueGrey,
    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    type: BottomNavigationBarType.fixed,
    onTap: (int index) => {
      if (index != selectedIndex)
        {
          if (index != 0 && SettingsController.to.isActive)
            {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PromptDialog(() => null);
                  }).then((value) => {
                    if (value == true)
                      {
                        SettingsController.to.isActive = false,
                        TimerController.to.stopInterval(),
                        setIndex(index),
                      }
                  })
            }
          else
            {setIndex(index)}
        }
    },
    currentIndex: selectedIndex,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.timer),
        label: 'Timer',
      ),
      BottomNavigationBarItem(
          icon: const Icon(Icons.settings), label: 'Settings'),
    ],
  );
}
