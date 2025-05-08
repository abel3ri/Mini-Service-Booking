import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RStyledIcon extends StatelessWidget {
  const RStyledIcon({
    super.key,
    required this.icon,
    this.color,
    this.styled = true,
  });

  final String icon;
  final Color? color;
  final bool styled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: styled ? EdgeInsets.all(8) : EdgeInsets.zero,
      decoration: styled
          ? BoxDecoration(
              color: color?.withValues(alpha: 0.2) ??
                  Get.theme.primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(8),
            )
          : null,
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          color ?? Get.theme.primaryColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
