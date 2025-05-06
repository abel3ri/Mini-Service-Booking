import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RRoundedContainer extends StatelessWidget {
  const RRoundedContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 128,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(96),
        ),
      ),
    );
  }
}
