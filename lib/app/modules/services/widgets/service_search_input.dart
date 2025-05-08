import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/services/controllers/services_controller.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

Widget serviceSearchInput(BuildContext context, ServicesController controller) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions(context).width20,
        vertical: Dimensions(context).height10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.isDarkMode ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode ? Colors.black54 : Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          autofocus: controller.autoFocus,
          controller: controller.searchController,
          decoration: InputDecoration(
            hintText: 'Search services...',
            hintStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.isDarkMode ? Colors.grey[400] : Colors.grey[600],
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Get.theme.primaryColor,
              size: 24,
            ),
            suffixIcon: AnimatedOpacity(
              opacity: controller.searchController.text.isNotEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Get.theme.primaryColor,
                  size: 20,
                ),
                onPressed: controller.searchController.text.isNotEmpty
                    ? controller.clearSearch
                    : null,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: context.isDarkMode ? Colors.grey[850] : Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: Dimensions(context).height15,
              horizontal: Dimensions(context).width15,
            ),
          ),
          style: context.textTheme.bodyLarge,
          onChanged: controller.onSearchChanged,
        ),
      ),
    ),
  );
}
