import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/home/controllers/home_controller.dart';
import 'package:mini_service_booking/app/modules/home/widgets/home_bottom_sheet.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';
import 'package:mini_service_booking/core/widgets/modal_sheets/r_modal_bottom_sheet.dart';

Widget homeSearchInput(BuildContext context, HomeController controller) {
  return RCard(
    onPressed: () {
      Get.toNamed("/services", arguments: {
        "auto_focus": true,
      });
    },
    isElevated: false,
    showBorder: false,
    color: Get.isDarkMode ? const Color(0x1F646464) : Colors.white,
    borderRadius: Dimensions(context).radius100,
    padding: EdgeInsets.symmetric(
      horizontal: Dimensions(context).width30,
      vertical: Dimensions(context).height10,
    ),
    child: Row(
      children: [
        Icon(
          CupertinoIcons.search,
          size: Dimensions(context).iconSize32,
        ),
        SizedBox(width: Dimensions(context).width10),
        Text(
          "text_Search_services".tr,
          style: context.textTheme.titleMedium?.copyWith(
            color: Colors.grey,
          ),
        ),
        Spacer(),
        RCard(
          isElevated: false,
          showBorder: false,
          onPressed: () {
            rShowModalBottomSheet(
              isScrollControlled: true,
              context: context,
              child: homeBottomSheet(context, controller),
            );
          },
          padding: EdgeInsets.all(12),
          color: Get.theme.primaryColor,
          borderRadius: Dimensions(context).radius100,
          child: Icon(
            Icons.tune_rounded,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
