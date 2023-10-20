import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDark = false;

  @override
  void onInit() async {
    super.onInit();
    isDark = false;
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme(bool _isDark) async {
    isDark = _isDark;
    Get.changeThemeMode(_isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}