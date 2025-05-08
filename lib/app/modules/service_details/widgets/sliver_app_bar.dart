import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_circled_icon_button.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';

Widget sliverAppBar(BuildContext context, ServiceModel? service) {
  return SliverAppBar(
    expandedHeight: Get.height * 0.35,
    automaticallyImplyLeading: false,
    elevation: 0,
    pinned: true,
    stretch: true,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: service!.imageUrl!,
            fit: BoxFit.cover,
            placeholder: (context, url) => Image.asset(
              "assets/misc/placeholder.jpg",
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => Image.asset(
              "assets/misc/placeholder.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: Dimensions(context).height40,
            left: Dimensions(context).width30,
            child: RCircledIconButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () {
                Get.back();
              },
            ),
          ),
          Positioned(
            top: Dimensions(context).height40,
            right: Dimensions(context).width30,
            child: RCard(
              isElevated: false,
              showBorder: false,
              borderRadius: Dimensions(context).radius100,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions(context).width30,
                vertical: Dimensions(context).height10,
              ),
              color: (service.isAvailable ?? false) == true
                  ? Colors.green
                  : Colors.red,
              child: Text(
                "${(service.isAvailable ?? false) == true ? "text_Available".tr : "text_Unavailable".tr}",
                style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0),
      child: Container(
        height: Dimensions(context).height40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions(context).radius60),
            topRight: Radius.circular(Dimensions(context).radius60),
          ),
        ),
        child: Container(
          width: Dimensions(context).width90,
          height: Dimensions(context).height10,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: BorderRadius.circular(
              Dimensions(context).radius80,
            ),
          ),
        ),
      ),
    ),
  );
}
