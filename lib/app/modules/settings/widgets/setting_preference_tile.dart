import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class SettingPreferenceTile extends StatelessWidget {
  const SettingPreferenceTile({
    super.key,
    required this.label,
    required this.leading,
    required this.onTap,
  });

  final String label;
  final Widget leading;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(
        label,
        style: context.textTheme.titleMedium!.copyWith(
          fontSize: Dimensions(context).font15,
        ),
      ),
    );
  }
}
