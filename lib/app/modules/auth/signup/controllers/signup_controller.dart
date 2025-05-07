import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;

  Future<void> signup() async {
    if (Get.focusScope?.hasFocus ?? false) {
      Get.focusScope?.unfocus();
    }
    if (formKey.currentState?.validate() ?? false) {
      isLoading(true);
      await Future.delayed(Duration(seconds: 2));
      isLoading(false);
      Get.offAllNamed(
        "/home-wrapper",
        predicate: (route) => Get.currentRoute == "/home-wrapper",
      );
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
