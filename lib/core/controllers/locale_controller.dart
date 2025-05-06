import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/services/prefs_service.dart';

class LocaleController extends GetxController {
  Rx<Locale> currentLocale = Rx<Locale>(const Locale('en'));

  @override
  void onInit() {
    super.onInit();
    getCurrentLocale();
  }

  void changeLocale(String localeCode) async {
    await PrefsService.saveString(key: "locale", value: localeCode);
    currentLocale.value = _getLocale(localeCode);
    Get.updateLocale(currentLocale.value);
  }

  void getCurrentLocale() async {
    final localeCode = PrefsService.getString(key: "locale") ?? 'en';
    currentLocale.value = _getLocale(localeCode);
    Get.updateLocale(currentLocale.value);
  }

  Locale _getLocale(String localeCode) {
    switch (localeCode) {
      case 'am':
        return const Locale('am');
      case 'en':
      default:
        return const Locale('en');
    }
  }
}
