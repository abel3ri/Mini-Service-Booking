import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/auth/login/widgets/r_rounded_container.dart';
import 'package:mini_service_booking/app/modules/settings/widgets/setting_entry_list_tile.dart';
import 'package:mini_service_booking/app/modules/settings/widgets/setting_preference_tile.dart';
import 'package:mini_service_booking/app/modules/settings/widgets/settings_card.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_styled_icon.dart';
import 'package:mini_service_booking/core/widgets/images/r_circled_image_avatar.dart';
import 'package:mini_service_booking/core/widgets/modal_sheets/r_modal_bottom_sheet.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: RRoundedContainer(
                roundDirection: RoundDirection.left,
              ),
            ),
            Column(
              children: [
                SizedBox(height: Dimensions(context).height120),
                RCircledImageAvatar.large(
                  fallBackText: "AB",
                  imageUrl:
                      "https://www.getdigital.de/cdn/shop/files/productImage-20566-one-punch-man-pin-saitama_1200x1200.jpg?v=1720656317",
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {},
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: 0,
                        left: Dimensions(context).width30,
                        right: Dimensions(context).width30,
                        bottom: Dimensions(context).height10,
                      ),
                      children: [
                        Center(
                          child: Text(
                            "Abel",
                            style: context.textTheme.headlineMedium,
                          ),
                        ),
                        Center(
                          child: Text(
                            "+251963647311",
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                        Center(
                          child: Text(
                            "abelmerete22@gmail.com",
                            style: context.textTheme.bodySmall,
                          ),
                        ),
                        SizedBox(height: Dimensions(context).height15),
                        SettingsCard(
                          label: "Preferences".tr,
                          entries: [
                            SettingEntryListTile(
                              label: "Theme".tr,
                              icon: "assets/dev_icons/theme.svg",
                              onTap: () {
                                rShowModalBottomSheet(
                                  context: context,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SettingPreferenceTile(
                                        label: "System".tr,
                                        leading: RStyledIcon(
                                          icon: "assets/dev_icons/phone.svg",
                                        ),
                                        onTap: () async {
                                          await controller.themeController
                                              .changeTheme(
                                            "system",
                                          );
                                          Get.back();
                                        },
                                      ),
                                      SettingPreferenceTile(
                                        label: "Light".tr,
                                        leading: RStyledIcon(
                                          icon: "assets/dev_icons/light.svg",
                                        ),
                                        onTap: () async {
                                          await controller.themeController
                                              .changeTheme("light");
                                          Get.back();
                                        },
                                      ),
                                      SettingPreferenceTile(
                                        label: "Dark".tr,
                                        leading: RStyledIcon(
                                          icon: "assets/dev_icons/dark.svg",
                                        ),
                                        onTap: () async {
                                          await controller.themeController
                                              .changeTheme(
                                            "dark",
                                          );
                                          Get.back();
                                        },
                                      ),
                                      SettingPreferenceTile(
                                        label: "Cancel".tr,
                                        leading: Icon(Icons.close),
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            SettingEntryListTile(
                              label: "Language".tr,
                              icon: "assets/dev_icons/language.svg",
                              onTap: () {
                                rShowModalBottomSheet(
                                  context: context,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SettingPreferenceTile(
                                        label: "English",
                                        leading: Image.asset(
                                          "assets/flags/us.png",
                                          width: Dimensions(context).iconSize40,
                                        ),
                                        onTap: () async {
                                          Get.back();
                                          controller.localeController
                                              .changeLocale("en");
                                        },
                                      ),
                                      SettingPreferenceTile(
                                        label: "አማርኛ",
                                        leading: Image.asset(
                                          "assets/flags/et.png",
                                          width: Dimensions(context).iconSize40,
                                        ),
                                        onTap: () async {
                                          Get.back();
                                          controller.localeController
                                              .changeLocale("am");
                                        },
                                      ),
                                      SettingPreferenceTile(
                                        label: "Cancel".tr,
                                        leading: Icon(Icons.close),
                                        onTap: () {
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: Dimensions(context).height15),
                        SettingsCard(
                          entries: [
                            SettingEntryListTile(
                              label: "Logout".tr,
                              onTap: () {
                                Get.offAllNamed(
                                  "/login",
                                  predicate: (route) =>
                                      Get.currentRoute == "/login",
                                );
                              },
                              icon: "assets/dev_icons/logout.svg",
                              color: Colors.red,
                            ),
                          ],
                        ),
                        // SizedBox(height: Dimensions(context).height15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
