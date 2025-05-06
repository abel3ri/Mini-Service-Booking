import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final IconData? leadingIcon;
  final TextStyle? titleTextStyle;
  final bool centerTitle;
  final List<Widget>? actions;

  const RAppBar({
    super.key,
    required this.title,
    this.onLeadingPressed,
    this.leadingIcon = Icons.arrow_back_ios_new_rounded,
    this.titleTextStyle,
    this.centerTitle = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: leadingIcon != null
          ? IconButton(
              onPressed: onLeadingPressed ?? () => Get.back(),
              icon: Icon(
                leadingIcon,
                size: Dimensions(context).iconSize24,
              ),
            )
          : null,
      title: Text(
        title,
        style: titleTextStyle ??
            context.textTheme.titleMedium!.copyWith(
              fontSize: Dimensions(context).font15,
            ),
      ),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
