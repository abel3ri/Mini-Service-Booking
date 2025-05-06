import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RMainButton extends StatelessWidget {
  const RMainButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  const RMainButton.icon({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    required this.icon,
  });

  final String label;
  final void Function()? onPressed;
  final bool isLoading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isLoading ? null : onPressed,
      style: FilledButton.styleFrom(
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
              child: CircularProgressIndicator(),
            ),
            SizedBox(width: Dimensions(context).width10),
          ],
          Text(
            overflow: TextOverflow.ellipsis,
            label,
            style: context.textTheme.titleMedium!.copyWith(
              color: !isLoading ? Colors.white : null,
              fontSize: Dimensions(context).font12,
            ),
            textAlign: TextAlign.center,
          ),
          if (icon != null) ...[
            SizedBox(width: Dimensions(context).width10),
            Icon(
              icon,
              size: Dimensions(context).iconSize20,
              color: Colors.white,
            ),
          ],
        ],
      ),
    );
  }
}
