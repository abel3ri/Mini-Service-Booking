import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/auth/login/widgets/r_rounded_container.dart';
import 'package:mini_service_booking/app/modules/auth/login/widgets/r_social_icon.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/utils/form_validator.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_main_button.dart';
import 'package:mini_service_booking/core/widgets/input_fields/r_input_field.dart';
import 'package:mini_service_booking/core/widgets/texts/r_divider_text.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: "rounded_container",
                child: RRoundedContainer(
                  roundDirection: RoundDirection.left,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(Dimensions(context).height30),
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('text_Login'.tr,
                          style: context.textTheme.headlineLarge),
                      SizedBox(height: Dimensions(context).height30),
                      RInputField(
                        controller: controller.emailController,
                        labelText: "text_E_mail".tr,
                        prefixIcon: Icons.email_rounded,
                        validator: FormValidator.emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Dimensions(context).height15),
                      Obx(
                        () => RInputField(
                          controller: controller.passwordController,
                          labelText: "text_Password".tr,
                          prefixIcon: Icons.lock_rounded,
                          validator: FormValidator.passwordValidator,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText:
                              controller.showPassword.isTrue ? false : true,
                          onShowPasswordTap: () {
                            controller
                                .showPassword(!controller.showPassword.value);
                          },
                          suffixIcon: controller.showPassword.isTrue
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                      ),
                      SizedBox(height: Dimensions(context).height30),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("text_Forgot_Password".tr),
                          ),
                          Expanded(
                            child: Obx(
                              () => RMainButton(
                                label: "text_Login".tr,
                                onPressed: () async => controller.login(),
                                isLoading: controller.isLoading.value,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("text_Dont_have_an_account".tr),
                          TextButton(
                            onPressed: () {
                              Get.offNamed("/signup");
                            },
                            child: Text('text_Sign_Up'.tr),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      RDividerText(
                        text: "text_Or_Continue_With".tr,
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      Hero(
                        tag: "social_icons",
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: Dimensions(context).width15,
                          children: [
                            RSocialIcon(
                              imagePath: "assets/social_icons/google.svg",
                            ),
                            RSocialIcon(
                              imagePath: "assets/social_icons/facebook.svg",
                            ),
                            RSocialIcon(
                              imagePath: "assets/social_icons/apple.svg",
                              color: Get.theme.textTheme.bodyLarge?.color,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
