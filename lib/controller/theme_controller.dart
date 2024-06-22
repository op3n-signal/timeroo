import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();

  RxBool isDark = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isDark.value = false;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme(bool _isDark) async {
    isDark.value = _isDark;
    Get.changeThemeMode(_isDark ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
