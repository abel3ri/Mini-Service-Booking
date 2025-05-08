import 'package:get/get.dart';
import 'package:mini_service_booking/core/controllers/locale_controller.dart';
import 'package:mini_service_booking/core/controllers/theme_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<LocaleController>(
      () => LocaleController(),
    );
    Get.lazyPut<ThemeController>(
      () => ThemeController(),
    );
  }
}
