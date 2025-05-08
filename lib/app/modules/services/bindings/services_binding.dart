import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

import '../controllers/services_controller.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicesController>(
      () => ServicesController(),
    );
    Get.lazyPut<ServiceService>(
      () => ServiceService(),
    );
  }
}
