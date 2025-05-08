import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';
import 'package:mini_service_booking/app/modules/service_details/controllers/service_details_controller.dart';
import 'package:mini_service_booking/app/modules/services/controllers/services_controller.dart';

class ServiceFormController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isAvailable = false.obs;

  final ServiceService serviceService = Get.find();

  final bool isEditing = Get.arguments?['is_editing'] ?? false;
  final ServiceModel? editingService = Get.arguments?['service'];

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (isEditing) {
      initFields();
    }
  }

  Future<void> createService() async {
    if (formKey.currentState?.validate() ?? false) {
      if (Get.focusScope?.hasFocus ?? false) {
        Get.focusScope?.unfocus();
      }
      final Map<String, dynamic> serviceData = {
        "name": nameController.text.trim(),
        "category": categoryController.text.trim(),
        "price": int.tryParse(priceController.text.trim()),
        "duration": int.tryParse(durationController.text.trim()),
        "rating": int.tryParse(ratingController.text.trim()),
        "description": descriptionController.text.trim(),
        "isAvailable": isAvailable.value,
        "createdAt": DateTime.now().toIso8601String(),
      };
      isLoading(true);
      final res = await serviceService.createService(serviceData: serviceData);
      isLoading(false);

      res.fold((l) => l.showError(), (r) {
        Get.find<ServicesController>().pagingController.refresh();
        Get.back();
        r.showSuccess();
      });
    }
  }

  Future<void> updateService() async {
    if (editingService == null || isEditing == false) return;
    if (formKey.currentState?.validate() ?? false) {
      if (Get.focusScope?.hasFocus ?? false) {
        Get.focusScope?.unfocus();
      }
      final Map<String, dynamic> serviceData = {
        "name": nameController.text.trim(),
        "category": categoryController.text.trim(),
        "price": int.tryParse(priceController.text.trim()),
        "duration": int.tryParse(durationController.text.trim()),
        "rating": int.tryParse(ratingController.text.trim()),
        "description": descriptionController.text.trim(),
        "isAvailable": isAvailable.value,
        "createdAt": DateTime.now().toIso8601String(),
      };
      isLoading(true);
      final res = await serviceService.updateService(
        id: editingService!.id!,
        serviceData: serviceData,
      );
      isLoading(false);

      res.fold((l) => l.showError(), (r) {
        Get.find<ServiceDetailsController>().fetchService();
        Get.back();
        r.showSuccess();
      });
    }
  }

  void initFields() {
    nameController.text = editingService?.name ?? "";
    categoryController.text = editingService?.category ?? "";
    priceController.text = editingService?.price?.toString() ?? "";
    durationController.text = editingService?.duration?.toString() ?? "";
    ratingController.text = editingService?.rating?.toString() ?? "";
    descriptionController.text = editingService?.description ?? "";
    isAvailable.value = editingService?.isAvailable ?? false;
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    categoryController.dispose();
    priceController.dispose();
    durationController.dispose();
    ratingController.dispose();
    descriptionController.dispose();
  }
}
