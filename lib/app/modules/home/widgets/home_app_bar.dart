import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/images/r_circled_image_avatar.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "text_Hello_user".trParams({'name': 'Abel'}),
          style: context.textTheme.titleLarge,
        ),
        Text(
          "text_Welcome_to_Service_Booking".tr,
          style: context.textTheme.bodySmall,
        )
      ],
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: Dimensions(context).width15),
        child: RCircledImageAvatar.small(
          fallBackText: "AB",
          imageUrl:
              "https://www.getdigital.de/cdn/shop/files/productImage-20566-one-punch-man-pin-saitama_1200x1200.jpg?v=1720656317",
        ),
      )
    ],
  );
}
