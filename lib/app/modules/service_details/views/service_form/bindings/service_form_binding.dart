import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

import '../controllers/service_form_controller.dart';

class ServiceFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceFormController>(
      () => ServiceFormController(),
    );
    Get.lazyPut<ServiceService>(
      () => ServiceService(),
    );
  }
}
