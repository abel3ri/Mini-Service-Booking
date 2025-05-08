import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

class ServiceDetailsController extends GetxController {
  final String? serviceId = Get.arguments?['id'];
  final Rx<ServiceModel?> service = Rx<ServiceModel?>(null);
  final RxBool isLoading = false.obs;
  final ServiceService serviceService = Get.find();

  @override
  void onReady() {
    super.onReady();
    if (serviceId == null) {
      Get.back();
      return;
    } else
      fetchService();
  }

  Future<void> fetchService() async {
    isLoading(true);
    final res = await serviceService.fetchService(id: serviceId!);
    isLoading(false);

    res.fold((l) => l.showError(), (r) {
      service.value = r;
    });
  }
}
