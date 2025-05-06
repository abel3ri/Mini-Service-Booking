import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/services/prefs_service.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> currentTheme = Rx<ThemeMode>(ThemeMode.system);

  @override
  void onInit() {
    super.onInit();
    getCurrentTheme();
  }

  Future<void> changeTheme(String theme) async {
    await PrefsService.saveString(key: "theme", value: theme);

    ThemeMode newTheme;
    if (theme == "light") {
      newTheme = ThemeMode.light;
    } else if (theme == "dark") {
      newTheme = ThemeMode.dark;
    } else {
      newTheme = ThemeMode.system;
    }

    currentTheme(newTheme);
    Get.changeThemeMode(newTheme);
  }

  void getCurrentTheme() async {
    final theme = PrefsService.getString(key: "theme");

    if (theme == "light") {
      currentTheme(ThemeMode.light);
    } else if (theme == "dark") {
      currentTheme(ThemeMode.dark);
    } else {
      currentTheme(ThemeMode.system);
    }

    Get.changeThemeMode(currentTheme.value);
  }
}
