import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/indicators/r_loading.dart';

import '../controllers/splash_controller.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: RLoading(
        width: Dimensions(context).iconSize96,
        height: Dimensions(context).iconSize96,
      ),
    );
  }
}
