import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/app/modules/services/widgets/service_search_input.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/app_bars/r_app_bar.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_circled_icon_button.dart';
import 'package:mini_service_booking/core/widgets/cards/r_service_card.dart';
import 'package:mini_service_booking/core/widgets/indicators/r_loading.dart';

import '../controllers/services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppBar(
        title: "text_Services".tr,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: Dimensions(context).width15,
            ),
            child: RCircledIconButton(
              icon: Icons.add,
              onTap: () {
                Get.toNamed("/service-form", arguments: {
                  "is_editing": false,
                });
              },
            ),
          ),
        ],
      ),
      body: PagingListener(
        controller: controller.pagingController,
        builder: (context, state, fetchNextPage) => RefreshIndicator(
          onRefresh: () async => controller.pagingController.refresh(),
          child: CustomScrollView(
            slivers: [
              serviceSearchInput(context, controller),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions(context).width30,
                  vertical: Dimensions(context).height15,
                ),
                sliver: PagedSliverMasonryGrid.count(
                  state: state,
                  fetchNextPage: fetchNextPage,
                  builderDelegate: PagedChildBuilderDelegate<ServiceModel>(
                    firstPageProgressIndicatorBuilder: (context) => RLoading(
                      width: Dimensions(context).iconSize96,
                    ),
                    animateTransitions: true,
                    itemBuilder: (context, service, index) => RServiceCard(
                      service: service,
                      onTap: () {
                        Get.toNamed('/service-details', arguments: {
                          "id": service.id,
                        });
                      },
                    ),
                  ),
                  crossAxisCount: 2,
                  mainAxisSpacing: Dimensions(context).height15,
                  crossAxisSpacing: Dimensions(context).width30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
