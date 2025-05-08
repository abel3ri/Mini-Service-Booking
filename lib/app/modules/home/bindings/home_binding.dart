import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ServiceService>(
      () => ServiceService(),
    );
  }
}
