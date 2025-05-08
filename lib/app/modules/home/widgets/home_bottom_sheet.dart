import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/home/controllers/home_controller.dart';
import 'package:mini_service_booking/app/modules/home/views/filtered_services_view.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_circled_icon_button.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_main_button.dart';

Widget homeBottomSheet(BuildContext context, HomeController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Dimensions(context).width15,
      vertical: Dimensions(context).height15,
    ),
    child: ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Filter Services",
              style: context.textTheme.titleLarge,
            ),
            RCircledIconButton(
              icon: Icons.clear_rounded,
              onTap: () {
                controller.clearFilters();
              },
            ),
          ],
        ),
        SizedBox(height: Dimensions(context).height15),
        Text(
          "Categories",
          style: context.textTheme.titleMedium,
        ),
        SizedBox(height: Dimensions(context).height10),
        Wrap(
          spacing: Dimensions(context).width10,
          runSpacing: Dimensions(context).height10,
          children: controller.categories
              .map(
                (category) => Obx(
                  () => ChoiceChip(
                    label: Text(category),
                    selected: controller.selectedCategory.value == category,
                    onSelected: (selected) {
                      controller.toggleCategory(category);
                    },
                    selectedColor: Get.theme.primaryColor,
                    labelStyle: TextStyle(
                      color: controller.selectedCategory.value == category
                          ? Colors.white
                          : Get.theme.textTheme.bodyMedium?.color,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: Dimensions(context).height15),
        Obx(
          () => Text(
            "Price (Max: ETB ${controller.maxPrice.value.toInt()})",
            style: context.textTheme.titleMedium,
          ),
        ),
        Obx(
          () => Slider(
            value: controller.maxPrice.value,
            max: 1000,
            min: 0,
            divisions: 100,
            label: "ETB ${controller.maxPrice.value.toInt()}",
            onChanged: controller.updateMaxPrice,
            activeColor: Get.theme.primaryColor,
          ),
        ),
        SizedBox(height: Dimensions(context).height15),
        Obx(
          () => Text(
            "Rating (Min: ${controller.minRating.value.toInt()})",
            style: context.textTheme.titleMedium,
          ),
        ),
        Obx(
          () => Slider(
            value: controller.minRating.value,
            max: 100,
            min: 0,
            divisions: 100,
            label: "${controller.minRating.value.toInt()}",
            onChanged: controller.updateMinRating,
            activeColor: Get.theme.primaryColor,
          ),
        ),
        SizedBox(height: Dimensions(context).height15),
        Center(
          child: SizedBox(
            width: Get.width,
            child: Obx(
              () => RMainButton(
                isLoading: controller.isFiltering.value,
                label: "Apply Filter",
                onPressed: () async {
                  final filteredServices = await controller.applyFilters();
                  Get.to(() => const FilteredServicesView(), arguments: {
                    "services": filteredServices,
                  });
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
