import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';

class RCircledIconButton extends StatelessWidget {
  const RCircledIconButton({
    super.key,
    required this.icon,
    this.backgrdounColor,
    this.iconColor,
    this.size,
    this.onTap,
  });

  final IconData icon;
  final Color? backgrdounColor;
  final Color? iconColor;
  final double? size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RCard(
      onPressed: onTap,
      borderRadius: Dimensions(context).radius100,
      isElevated: false,
      showBorder: false,
      color: backgrdounColor ?? Get.theme.primaryColor,
      child: Icon(
        icon,
        size: size,
        color: iconColor ?? Colors.white,
      ),
    );
  }
}
