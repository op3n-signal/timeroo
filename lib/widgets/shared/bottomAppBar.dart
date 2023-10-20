import 'package:flutter/material.dart';
import 'package:timeroo/controller/settings_controller.dart';

import './dialog.dart';

Widget bottomAppBar(int selectedIndex, Function setIndex, BuildContext context) {
  final blTimerActive = SettingsController.to.isActive;

  return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => {
          if(index != selectedIndex) {
            if(index != 0 && blTimerActive) {
              showDialog(context: context, builder: (BuildContext context) {
                return PromptDialog(() => null);
              }).then((value) => {
                if(value == true) {
                  SettingsController.to.isActive = false,
                  setIndex(index),
                }
              })
            } else {
              setIndex(index)            
            }
          }
        },
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings), 
            label: 'Settings'),
        ],
      );
}