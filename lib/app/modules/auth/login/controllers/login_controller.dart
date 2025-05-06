import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxBool isLoading = false.obs;

  Future<void> login() async {
    if (Get.focusScope?.hasFocus ?? false) {
      Get.focusScope?.unfocus();
    }
    if (formKey.currentState?.validate() ?? false) {
      isLoading(true);
      await Future.delayed(Duration(seconds: 2));
      isLoading(false);
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
