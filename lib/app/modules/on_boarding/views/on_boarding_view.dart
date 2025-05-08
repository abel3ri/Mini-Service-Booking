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
        title: "text_Book_services_effortlessly".tr,
        bodyWidget: Text(
          "text_Discover_and_book_trusted_local_services".tr,
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
        title: "text_Track_and_manage_your_bookings".tr,
        bodyWidget: Text(
          "text_Stay_updated_with_real_time_status".tr,
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
        title: "text_Connect_with_professionals".tr,
        bodyWidget: Text(
          "text_Chat_or_call_experts_directly".tr,
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
          "text_Skip".tr,
          style: context.textTheme.titleMedium?.copyWith(
            color: Get.theme.primaryColor,
          ),
        ),
        next: Icon(
          Icons.arrow_forward_ios_outlined,
          size: Dimensions(context).font15,
        ),
        done: Text(
          "text_Done".tr,
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
