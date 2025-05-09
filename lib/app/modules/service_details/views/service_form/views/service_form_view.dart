import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/app/modules/auth/login/widgets/r_rounded_container.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/utils/form_validator.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_circled_icon_button.dart';
import 'package:mini_service_booking/core/widgets/buttons/r_main_button.dart';
import 'package:mini_service_booking/core/widgets/input_fields/r_input_field.dart';

import '../controllers/service_form_controller.dart';

class ServiceFormView extends GetView<ServiceFormController> {
  const ServiceFormView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: RRoundedContainer(
                roundDirection: RoundDirection.left,
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.all(Dimensions(context).height30),
              physics: BouncingScrollPhysics(),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    SizedBox(height: Dimensions(context).height120),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.isEditing
                            ? "text_Update_Service".tr
                            : "text_Create_Service".tr,
                        style: context.textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: Dimensions(context).height20),
                    RInputField(
                      controller: controller.nameController,
                      labelText: "text_Name".tr,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: FormValidator.requiredValidator,
                    ),
                    SizedBox(height: Dimensions(context).height10),
                    RInputField(
                      controller: controller.categoryController,
                      labelText: "text_Category".tr,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: FormValidator.requiredValidator,
                    ),
                    SizedBox(height: Dimensions(context).height10),
                    RInputField(
                      controller: controller.priceController,
                      labelText: "text_Price".tr,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: FormValidator.requiredValidator,
                    ),
                    SizedBox(height: Dimensions(context).height10),
                    RInputField(
                      controller: controller.durationController,
                      labelText: "text_Duration".tr,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: FormValidator.requiredValidator,
                    ),
                    SizedBox(height: Dimensions(context).height10),
                    RInputField(
                      controller: controller.ratingController,
                      labelText: "text_Rating".tr,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: FormValidator.requiredValidator,
                    ),
                    SizedBox(height: Dimensions(context).height10),
                    RInputField(
                      controller: controller.descriptionController,
                      labelText: "text_Description".tr,
                      textInputAction: TextInputAction.newline,
                      keyboardType: TextInputType.number,
                      isMultiline: true,
                      maxLines: 4,
                      validator: FormValidator.requiredValidator,
                    ),
                    SizedBox(height: Dimensions(context).height10),
                    Theme(
                      data: context.theme.copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: Obx(
                        () => SwitchListTile.adaptive(
                          title: Text("text_Is_Available".tr),
                          value: controller.isAvailable.value,
                          onChanged: (value) {
                            controller.isAvailable.value = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions(context).height15),
                    SizedBox(
                      width: Get.width,
                      child: Obx(
                        () => RMainButton(
                          isLoading: controller.isLoading.value,
                          label: controller.isEditing
                              ? "text_Update_Service".tr
                              : "text_Create_Service".tr,
                          onPressed: () async {
                            if (controller.isEditing) {
                              controller.updateService();
                            } else {
                              controller.createService();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: Dimensions(context).height10,
              left: Dimensions(context).width30,
              child: RCircledIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
