import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class ROutlinedButton extends StatelessWidget {
  const ROutlinedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.color,
  });

  const ROutlinedButton.icon({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    required this.icon,
    this.color,
  });

  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: color ?? Get.theme.primaryColor,
        side: BorderSide(
          color: color ?? Get.theme.primaryColor,
          width: 2,
        ),
        minimumSize: Size(
          Dimensions(context).buttonWidth,
          Dimensions(context).buttonHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions(context).radius15,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isLoading) ...[
            SizedBox(
              width: Dimensions(context).iconSize16,
              height: Dimensions(context).iconSize16,
              child: CircularProgressIndicator(
                color: color ?? Get.theme.primaryColor,
              ),
            ),
            SizedBox(width: Dimensions(context).width10),
          ],
          Text(
            overflow: TextOverflow.ellipsis,
            label,
            style: context.textTheme.titleMedium!.copyWith(
              color: isLoading
                  ? (context.isDarkMode ? Colors.grey[400] : Colors.grey[600])
                  : (color ?? Get.theme.primaryColor),
              fontSize: Dimensions(context).font12,
            ),
            textAlign: TextAlign.center,
          ),
          if (icon != null) ...[
            SizedBox(width: Dimensions(context).width10),
            Icon(
              icon,
              size: Dimensions(context).iconSize20,
              color: isLoading
                  ? (context.isDarkMode ? Colors.grey[400] : Colors.grey[600])
                  : (color ?? Get.theme.primaryColor),
            ),
          ],
        ],
      ),
    );
  }
}
