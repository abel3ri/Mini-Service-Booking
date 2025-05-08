import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';
import 'package:mini_service_booking/app/modules/home/controllers/home_controller.dart';
import 'package:mini_service_booking/app/modules/services/controllers/services_controller.dart';
import 'package:mini_service_booking/core/widgets/dialogs/r_prompt_dialog.dart';

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

  Future<void> deleteService() async {
    if (serviceId == null) return;
    final prompt = await rPromptDialog(
      title: "Delete Service?",
      content: "Are you sure you want to delete this service?",
      mainActionLabel: "Delete",
    );
    if (prompt ?? false) {
      isLoading(true);
      final res = await serviceService.deleteService(id: serviceId!);
      isLoading(false);
      res.fold((l) => l.showError(), (r) {
        if (Get.previousRoute == "/home-wrapper") {
          Get.find<HomeController>().fetchServices();
        } else if (Get.previousRoute == "/services") {
          Get.find<ServicesController>().pagingController.refresh();
        }
        Get.back();
        r.showSuccess();
      });
    }
  }
}
