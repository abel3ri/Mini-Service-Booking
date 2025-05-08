import 'package:get/get.dart';
import 'package:mini_service_booking/core/controllers/locale_controller.dart';
import 'package:mini_service_booking/core/controllers/theme_controller.dart';

class SettingsController extends GetxController {
  final ThemeController themeController = Get.find();
  final LocaleController localeController = Get.find();
}
