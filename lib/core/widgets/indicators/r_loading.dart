import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RLoading extends StatelessWidget {
  const RLoading({
    super.key,
    this.width,
    this.height,
    this.alignment,
  });

  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: Lottie.asset(
        width: width ?? Dimensions(context).iconSize48,
        height: height ?? Dimensions(context).iconSize48,
        fit: BoxFit.cover,
        "assets/lotties/loading.json",
      ),
    );
  }
}
