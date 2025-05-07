import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

enum RoundDirection { left, right }

class RRoundedContainer extends StatelessWidget {
  const RRoundedContainer({
    super.key,
    required this.roundDirection,
  });

  final RoundDirection roundDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions(context).height120,
      width: Dimensions(context).height120,
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: roundDirection == RoundDirection.left
              ? Radius.circular(96)
              : Radius.zero,
          bottomRight: roundDirection == RoundDirection.right
              ? Radius.circular(96)
              : Radius.zero,
        ),
      ),
    );
  }
}
