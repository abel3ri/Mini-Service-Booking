import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

import '../controllers/service_details_controller.dart';

class ServiceDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceDetailsController>(
      () => ServiceDetailsController(),
    );
    Get.lazyPut<ServiceService>(
      () => ServiceService(),
    );
  }
}
