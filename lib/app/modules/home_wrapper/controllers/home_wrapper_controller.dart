import 'package:get/get.dart';

class HomeWrapperController extends GetxController {
  Rx<int> index = 0.obs;

  void onPageChanged(int i) {
    index.value = i;
  }
}
