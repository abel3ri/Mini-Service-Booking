import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

Future<void> rShowModalBottomSheet({
  required BuildContext context,
  required Widget child,
  Function? callBack,
  bool? isScrollControlled,
}) async {
  await showModalBottomSheet(
    backgroundColor: context.theme.scaffoldBackgroundColor,
    context: context,
    isScrollControlled: isScrollControlled ?? false,
    showDragHandle: true,
    useSafeArea: true,
    builder: (context) {
      return Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions(context).width15,
        ).add(EdgeInsets.only(
          bottom: Dimensions(context).height10,
        )),
        child: child,
      );
    },
  ).then((_) {
    callBack?.call();
  });
}
