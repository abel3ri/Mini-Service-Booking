import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:mini_service_booking/core/services/prefs_service.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = [
      PageViewModel(
        title: "Book services effortlessly".tr,
        bodyWidget: Text(
          "Discover and book trusted local services in just a few taps.".tr,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: Dimensions(context).font15,
          ),
        ),
        image: Lottie.asset(
          'assets/lotties/on_boarding_one.json',
          height: Dimensions(context).height200,
        ),
      ),
      PageViewModel(
        title: "Track and manage your bookings".tr,
        bodyWidget: Text(
          "Stay updated with real-time status and manage all your service requests in one place."
              .tr,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: Dimensions(context).font15,
          ),
        ),
        image: Lottie.asset(
          'assets/lotties/on_boarding_two.json',
          height: Dimensions(context).height200,
        ),
      ),
      PageViewModel(
        title: "Connect with professionals".tr,
        bodyWidget: Text(
          "Chat or call experts directly to get your issues resolved faster."
              .tr,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium!.copyWith(
            fontSize: Dimensions(context).font15,
          ),
        ),
        image: Lottie.asset(
          'assets/lotties/on_boarding_three.json',
          height: Dimensions(context).height200,
        ),
      ),
    ];

    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () async {
          await PrefsService.saveBool(key: "init", value: false);
          Get.offNamed('/login');
        },
        onSkip: () async {
          await PrefsService.saveBool(key: "init", value: false);
          Get.offNamed('/login');
        },
        showSkipButton: true,
        skip: Text(
          "Skip".tr,
          style: context.textTheme.titleMedium?.copyWith(
            color: Get.theme.primaryColor,
          ),
        ),
        next: Icon(
          Icons.arrow_forward_ios_outlined,
          size: Dimensions(context).font15,
        ),
        done: Text(
          "Done".tr,
          style: context.textTheme.titleMedium?.copyWith(
            color: Get.theme.primaryColor,
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: Size(
            Dimensions(context).width15,
            Dimensions(context).height10,
          ),
          color: Colors.grey,
          activeSize: Size(
            Dimensions(context).width60,
            Dimensions(context).height10,
          ),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                Dimensions(context).radius12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
