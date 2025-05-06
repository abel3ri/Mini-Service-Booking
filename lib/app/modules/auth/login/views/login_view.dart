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
              child: RRoundedContainer(),
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
                      Text('Login', style: context.textTheme.headlineLarge),
                      SizedBox(height: Dimensions(context).height30),
                      RInputField(
                        controller: controller.emailController,
                        labelText: "Email",
                        prefixIcon: Icons.email_rounded,
                        validator: FormValidator.emailValidator,
                      ),
                      SizedBox(height: Dimensions(context).height15),
                      RInputField(
                        controller: controller.passwordController,
                        labelText: "Password",
                        prefixIcon: Icons.lock_rounded,
                        validator: FormValidator.passwordValidator,
                      ),
                      SizedBox(height: Dimensions(context).height30),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password?"),
                          ),
                          Expanded(
                            child: Obx(
                              () => RMainButton(
                                label: "Login",
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
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {},
                            child: Text('Sign Up'),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      RDividerText(
                        text: "Or",
                      ),
                      SizedBox(height: Dimensions(context).height20),
                      Row(
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
