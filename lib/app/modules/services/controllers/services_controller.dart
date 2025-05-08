import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/data/services/service_service.dart';

class ServicesController extends GetxController {
  final ServiceService serviceService = Get.find();
  final bool autoFocus = Get.arguments?['auto_focus'] ?? false;
  late final PagingController<int, ServiceModel> pagingController;
  final int limit = 10;
  bool _hasMore = true;
  String? _searchTerm;
  final TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void onInit() {
    super.onInit();
    pagingController = PagingController<int, ServiceModel>(
      getNextPageKey: (state) => _hasMore ? (state.keys?.last ?? 0) + 1 : null,
      fetchPage: (pageKey) async {
        final query = {
          "limit": limit.toString(),
          "page": pageKey.toString(),
          "orderBy": "createdAt",
          "order": "desc"
        };
        if (_searchTerm != null && _searchTerm!.isNotEmpty) {
          query["search"] = _searchTerm!;
        }
        final res = await serviceService.fetchServices(query: query);
        final services = res.fold(
          (error) => throw Exception(error.message),
          (services) => services,
        );
        if (services.isEmpty) {
          _hasMore = false;
        }
        return services;
      },
    );
  }

  void onSearchChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      updateSearchTerm(value);
    });
  }

  void updateSearchTerm(String searchTerm) {
    _searchTerm = searchTerm.trim();
    _hasMore = true;
    pagingController.refresh();
  }

  void clearSearch() {
    searchController.clear();
    updateSearchTerm('');
  }

  @override
  void onClose() {
    _hasMore = false;
    searchController.dispose();
    _debounceTimer?.cancel();
    pagingController.dispose();
    super.onClose();
  }
}
