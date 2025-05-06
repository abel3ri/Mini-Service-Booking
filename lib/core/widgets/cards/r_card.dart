import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RCard extends StatelessWidget {
  const RCard({
    super.key,
    required this.child,
    this.color,
    this.onPressed,
    this.borderRadius,
    this.padding,
    this.isElevated = true,
    this.showBorder = true,
    this.isSelected = false,
  });

  final Widget child;
  final Color? color;
  final void Function()? onPressed;
  final double? borderRadius;
  final EdgeInsets? padding;
  final bool isElevated;
  final bool showBorder;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding ?? EdgeInsets.all(Dimensions(context).width10),
        decoration: BoxDecoration(
          border: showBorder
              ? Border.all(
                  width: .5,
                  color: isSelected
                      ? Get.theme.primaryColor
                      : context.isDarkMode
                          ? Colors.grey.shade600
                          : Colors.grey,
                )
              : null,
          color: color ?? context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? Dimensions(context).radius10,
          ),
          boxShadow: isElevated
              ? [
                  BoxShadow(
                    color: Get.isDarkMode ? Colors.black26 : Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
