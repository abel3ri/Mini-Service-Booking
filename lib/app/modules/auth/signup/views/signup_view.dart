import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/auth/login/widgets/r_rounded_container.dart';
import 'package:mini_service_booking/app/modules/auth/login/widgets/r_social_icon.dart';
import 'package:mini_service_booking/app/modules/auth/signup/controllers/signup_controller.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/utils/form_validator.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_main_button.dart';
import 'package:mini_service_booking/core/widgets/input_fields/r_input_field.dart';
import 'package:mini_service_booking/core/widgets/texts/r_divider_text.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Hero(
                tag: "rounded_container",
                child: RRoundedContainer(
                  roundDirection: RoundDirection.right,
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
                      Text('Sign Up', style: context.textTheme.headlineLarge),
                      SizedBox(height: Dimensions(context).height30),
                      RInputField(
                        controller: controller.emailController,
                        labelText: "Email",
                        prefixIcon: Icons.email_rounded,
                        validator: FormValidator.emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Dimensions(context).height15),
                      RInputField(
                        controller: controller.userNameController,
                        labelText: "Username",
                        prefixIcon: Icons.person_rounded,
                        validator: FormValidator.userNameValidator,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(height: Dimensions(context).height15),
                      Obx(
                        () => RInputField(
                          controller: controller.passwordController,
                          labelText: "Password",
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
                      Obx(
                        () => RMainButton(
                          label: "Sign Up",
                          onPressed: () async => controller.signup(),
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.offNamed("/login");
                            },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      RDividerText(
                        text: "Or",
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
