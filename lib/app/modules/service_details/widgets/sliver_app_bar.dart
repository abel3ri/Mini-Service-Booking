import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
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
            child: RCard(
              onPressed: () {
                Get.back();
              },
              isElevated: false,
              borderRadius: Dimensions(context).radius60,
              showBorder: false,
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
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
