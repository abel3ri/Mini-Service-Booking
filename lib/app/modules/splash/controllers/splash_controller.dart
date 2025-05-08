import 'package:get/get.dart';
import 'package:mini_service_booking/core/services/prefs_service.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    if (PrefsService.getBool(key: "init") ?? true) {
      Get.offAllNamed(
        "/on-boarding",
        predicate: (route) => Get.currentRoute == "/on-boarding",
      );
    } else {
      Future.delayed(Duration(milliseconds: 300)).then((_) {
        Get.offAllNamed(
          "/login",
          predicate: (route) => Get.currentRoute == "/login",
        );
      });
    }
  }
}
