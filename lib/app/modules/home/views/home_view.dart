import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/home/widgets/home_app_bar.dart';
import 'package:mini_service_booking/app/modules/home/widgets/home_search_input.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/cards/r_service_card.dart';
import 'package:mini_service_booking/core/widgets/indicators/r_not_found.dart';
import 'package:mini_service_booking/core/widgets/shimmers/shimmer_grid.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: RefreshIndicator(
        onRefresh: () async => await controller.fetchServices(),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions(context).width30,
            vertical: Dimensions(context).height15,
          ),
          children: [
            homeSearchInput(context, controller),
            SizedBox(height: Dimensions(context).height20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "text_Popular_Services".tr,
                  style: context.textTheme.titleSmall,
                ),
                TextButton(
                  onPressed: () async {
                    Get.toNamed("/services");
                  },
                  child: Text(
                    "text_View_All".tr,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions(context).height20),
            Obx(() {
              if (controller.isLoading.isTrue) {
                return ShimmerGrid();
              } else if (controller.services.isEmpty) {
                return RNotFound(
                  onRetry: () async => await controller.fetchServices(),
                );
              }
              return MasonryGridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                mainAxisSpacing: Dimensions(context).height15,
                crossAxisSpacing: Dimensions(context).width15,
                itemBuilder: (context, index) => RServiceCard(
                  service: controller.services[index],
                ),
                itemCount: controller.services.length,
              );
            }),
          ],
        ),
      ),
    );
  }
}
