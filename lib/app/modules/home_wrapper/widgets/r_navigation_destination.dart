import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RNavigationDestination extends StatelessWidget {
  const RNavigationDestination({
    super.key,
    required this.iconPath,
    required this.label,
    this.selectedIconPath,
  });

  final String iconPath;
  final String label;
  final String? selectedIconPath;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: SvgPicture.asset(
        iconPath,
        width: Dimensions(context).iconSize32,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      label: label,
      tooltip: label,
      selectedIcon: SvgPicture.asset(
        selectedIconPath ?? iconPath,
        width: Dimensions(context).iconSize32,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
