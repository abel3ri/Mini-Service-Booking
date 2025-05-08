import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_styled_icon.dart';

class SettingEntryListTile extends StatelessWidget {
  const SettingEntryListTile({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    this.color,
  });

  final void Function()? onTap;
  final String label;
  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: RStyledIcon(
        icon: icon,
        color: color,
      ),
      title: Text(
        label,
        style: context.textTheme.titleMedium!.copyWith(
          fontSize: Dimensions(context).font15,
          color: color,
        ),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_rounded,
        size: Dimensions(context).iconSize32,
        color: color ?? Get.theme.primaryColor,
      ),
    );
  }
}
