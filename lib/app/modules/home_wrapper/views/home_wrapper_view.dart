import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/home/views/home_view.dart';
import 'package:mini_service_booking/app/modules/home_wrapper/widgets/r_navigation_destination.dart';
import 'package:mini_service_booking/app/modules/settings/views/settings_view.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

import '../controllers/home_wrapper_controller.dart';

class HomeWrapperView extends GetView<HomeWrapperController> {
  const HomeWrapperView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.index.value,
          children: const [
            HomeView(),
            SettingsView(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: Dimensions(context).height20,
          left: Dimensions(context).width80,
          right: Dimensions(context).width80,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(Dimensions(context).radius100),
          ),
          padding: EdgeInsets.symmetric(vertical: Dimensions(context).height15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions(context).radius100),
            child: Obx(
              () => Theme(
                data: context.theme.copyWith(
                  splashColor: Colors.transparent,
                ),
                child: NavigationBar(
                  onDestinationSelected: controller.onPageChanged,
                  selectedIndex: controller.index.value,
                  backgroundColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  height: 56,
                  destinations: [
                    const RNavigationDestination(
                      iconPath: "assets/navigation_icons/home.svg",
                      label: "Home",
                      selectedIconPath:
                          "assets/navigation_icons/home_filled.svg",
                    ),
                    const RNavigationDestination(
                      iconPath: "assets/navigation_icons/settings.svg",
                      label: "Settings",
                      selectedIconPath:
                          "assets/navigation_icons/settings_filled.svg",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
