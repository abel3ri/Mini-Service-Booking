import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RNotFound extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final EdgeInsets? padding;
  final VoidCallback? onRetry;
  final String? retryText;

  const RNotFound({
    Key? key,
    this.title = 'No Items Found',
    this.subtitle,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.padding,
    this.onRetry,
    this.retryText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(Dimensions(context).width15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_rounded,
              size: iconSize ?? Dimensions(context).iconSize32,
              color: iconColor,
            ),
            SizedBox(height: Dimensions(context).height10),
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions(context).height10),
            Text(
              '${subtitle ?? "There are no items to display at this time"}',
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[500],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Dimensions(context).height10),
            OutlinedButton(
              onPressed: onRetry,
              child: Text(retryText ?? "Try Again"),
            ),
          ],
        ),
      ),
    );
  }
}
