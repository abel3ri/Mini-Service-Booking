import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

class HomeController extends GetxController {
  final ServiceService serviceService = Get.find();
  final RxList<ServiceModel> services = RxList<ServiceModel>([]);
  final RxList<ServiceModel> filteredServices = RxList<ServiceModel>([]);
  final RxBool isLoading = false.obs;
  final RxBool isFiltering = false.obs;

  final RxString selectedCategory = ''.obs;
  final RxDouble maxPrice = 1000.0.obs;
  final RxDouble minRating = 0.0.obs;
  final List<String> categories = [
    'Health',
    'Computers',
    'Electronics',
    'Jewelry'
  ];

  @override
  void onReady() {
    super.onReady();
    fetchServices();
  }

  Future<void> fetchServices() async {
    isLoading(true);
    try {
      final query = {
        "limit": "5",
        "page": "1",
        "sortBy": "createdAt",
      };

      final res = await serviceService.fetchServices(query: query);
      res.fold(
        (error) {
          error.showError();
          services.clear();
        },
        (fetchedServices) {
          services.value = fetchedServices;
        },
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchFilteredServices() async {
    isFiltering(true);
    try {
      final query = {
        "limit": "5",
        "page": "1",
        "sortBy": "createdAt",
      };

      if (selectedCategory.value.isNotEmpty) {
        query['category'] = selectedCategory.value;
      }

      final res = await serviceService.fetchServices(query: query);
      res.fold(
        (error) {
          error.showError();
          filteredServices.clear();
        },
        (fetchedServices) {
          filteredServices.value = fetchedServices.where((service) {
            bool matchesCategory = selectedCategory.value.isEmpty ||
                service.category == selectedCategory.value;
            return matchesCategory;
          }).toList();
        },
      );
    } finally {
      isFiltering(false);
    }
  }

  Future<List<ServiceModel>> applyFilters() async {
    await fetchFilteredServices();
    return filteredServices.toList();
  }

  void toggleCategory(String category) {
    if (selectedCategory.value == category) {
      selectedCategory.value = '';
    } else {
      selectedCategory.value = category;
    }
  }

  void updateMaxPrice(double price) {
    maxPrice.value = price;
  }

  void updateMinRating(double rating) {
    minRating.value = rating;
  }

  void clearFilters() {
    selectedCategory.value = '';
    maxPrice.value = 1000.0;
    minRating.value = 0.0;
  }
}
