import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeroo/controller/settings_controller.dart';
import 'package:timeroo/controller/theme_controller.dart';
import 'package:timeroo/navControl.dart';
import 'package:timeroo/utility/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      init: ThemeController(),
      builder: (controller) => GetMaterialApp(
          onInit: () {
            Get..put(SettingsController());
          },
          darkTheme: Themes.dark,
          themeMode: ThemeMode.light,
          theme: controller.isDark.value ? Themes.dark : Themes.light,
          title: 'Timeroo',
          home: NavControl()),
    );
  }
}
