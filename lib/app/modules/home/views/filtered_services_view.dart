import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/app_bars/r_app_bar.dart';
import 'package:mini_service_booking/core/widgets/cards/r_service_card.dart';
import 'package:mini_service_booking/core/widgets/indicators/r_not_found.dart';

class FilteredServicesView extends StatelessWidget {
  const FilteredServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ServiceModel> services = Get.arguments?['services'] ?? [];

    return Scaffold(
      appBar: RAppBar(title: "Filtered Services"),
      body: services.isEmpty
          ? RNotFound(
              title: "No Services Found",
              subtitle: "No services match the selected filters",
              retryText: "Go Back",
              onRetry: Get.back,
            )
          : MasonryGridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions(context).width15,
                vertical: Dimensions(context).height15,
              ),
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              mainAxisSpacing: Dimensions(context).height15,
              crossAxisSpacing: Dimensions(context).width15,
              itemBuilder: (context, index) => RServiceCard(
                service: services[index],
                onTap: () {
                  Get.toNamed('/service-details', arguments: {
                    "id": services[index].id,
                  });
                },
              ),
              itemCount: services.length,
            ),
    );
  }
}
