import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/controllers/locale_controller.dart';
import 'package:mini_service_booking/core/controllers/theme_controller.dart';
import 'package:mini_service_booking/core/services/theme_service.dart';
import 'package:mini_service_booking/core/utils/init_app_dependecies.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppDependencies();
  final themeController = Get.put(ThemeController());
  final localeController = Get.put(LocaleController());
  runApp(
    GetMaterialApp(
      title: "Mini Service Booking",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.currentTheme.value,
      defaultTransition: Transition.cupertino,
      locale: localeController.currentLocale.value,
      fallbackLocale: const Locale("en", "us"),
      debugShowCheckedModeBanner: false,
    ),
  );
}
