import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';

class RSocialIcon extends StatelessWidget {
  const RSocialIcon({
    super.key,
    required this.imagePath,
    this.color,
  });

  final String imagePath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RCard(
      isElevated: false,
      child: SvgPicture.asset(
        imagePath,
        width: Dimensions(context).iconSize32,
        colorFilter:
            color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      ),
    );
  }
}
