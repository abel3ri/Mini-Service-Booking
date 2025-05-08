import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/service_details/controllers/service_details_controller.dart';
import 'package:mini_service_booking/app/modules/service_details/widgets/sliver_app_bar.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_main_button.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_outlined_button.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';
import 'package:mini_service_booking/core/widgets/indicators/r_loading.dart';
import 'package:mini_service_booking/core/widgets/indicators/r_not_found.dart';
import 'package:readmore/readmore.dart';

class ServiceDetailsView extends GetView<ServiceDetailsController> {
  const ServiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return RLoading(
              width: Dimensions(context).iconSize96,
            );
          }
          if (controller.service.value == null) {
            return RNotFound(
              title: "text_Service_not_found".tr,
              subtitle: "text_The_requested_service_could_not_be_fetched".tr,
              retryText: "text_Go_Back".tr,
              onRetry: () {
                Get.back();
              },
            );
          }

          final service = controller.service.value;
          return RefreshIndicator(
            onRefresh: () async => controller.fetchService(),
            child: CustomScrollView(
              slivers: [
                sliverAppBar(context, service),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Dimensions(context).width20,
                            vertical: Dimensions(context).height20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      service?.name ??
                                          "text_Unknown_Service".tr,
                                      style: context.textTheme.titleLarge
                                          ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  RCard(
                                    isElevated: false,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_outline_rounded,
                                          size: Dimensions(context).iconSize20,
                                        ),
                                        Text('${service?.rating ?? "N/A"}')
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: Dimensions(context).height15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RCard(
                                    color: Get.theme.primaryColor,
                                    isElevated: false,
                                    child: Text(
                                      '${service?.category ?? "N/A"}',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.hourglass_bottom_rounded,
                                        size: Dimensions(context).iconSize20,
                                        color: Get.theme.primaryColor,
                                      ),
                                      Text(
                                        "text_Minutes".trParams({
                                          'duration':
                                              service?.duration?.toString() ??
                                                  "N/A"
                                        }),
                                        style: context.textTheme.titleSmall,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: Dimensions(context).height15),
                              Text(
                                "text_Description".tr,
                                style: context.textTheme.titleMedium,
                              ),
                              ReadMoreText(
                                service?.description ??
                                    "text_No_description_provided".tr,
                              ),
                              SizedBox(height: Dimensions(context).height15),
                              Text(
                                "text_Price".tr,
                                style: context.textTheme.titleMedium,
                              ),
                              Text.rich(
                                TextSpan(
                                  text: "text_ETB".tr,
                                  children: [
                                    TextSpan(
                                      text: ' ${service?.price ?? "N/A"}',
                                      style: context.textTheme.headlineLarge
                                          ?.copyWith(
                                        color: Get.theme.primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                                style: context.textTheme.titleSmall?.copyWith(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Obx(
        () {
          if (controller.service.value != null) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions(context).width30,
                vertical: Dimensions(context).height10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ROutlinedButton(
                      label: "text_Delete".tr,
                      onPressed: () async => controller.deleteService(),
                      color: Get.theme.colorScheme.error,
                    ),
                  ),
                  SizedBox(width: Dimensions(context).width15),
                  Expanded(
                    child: RMainButton(
                      label: "text_Edit".tr,
                      onPressed: () {
                        Get.toNamed("/service-form", arguments: {
                          "is_editing": true,
                          "service": controller.service.value,
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
