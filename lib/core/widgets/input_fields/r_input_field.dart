import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final IconData? prefixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isMultiline;
  final int? maxLines;
  final int? minLines;
  final IconData? suffixIcon;
  final void Function()? onShowPasswordTap;

  const RInputField({
    Key? key,
    this.controller,
    required this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.isMultiline = false,
    this.maxLines,
    this.minLines,
    this.suffixIcon,
    this.onShowPasswordTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: isMultiline ? TextInputType.multiline : keyboardType,
      textInputAction: isMultiline ? TextInputAction.newline : textInputAction,
      validator: validator,
      maxLines: isMultiline ? (maxLines ?? null) : 1,
      minLines: isMultiline ? (minLines ?? 3) : 1,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Get.theme.colorScheme.primary.withValues(alpha: 0.6),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Get.theme.colorScheme.primary,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.primaryContainer,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.primaryContainer,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Get.theme.colorScheme.primary,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: context.theme.colorScheme.surface.withValues(alpha: 0.8),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Dimensions(context).width30,
          vertical: isMultiline
              ? Dimensions(context).height20
              : Dimensions(context).height15,
        ),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onShowPasswordTap,
                child: Icon(
                  suffixIcon,
                  size: Dimensions(context).iconSize20,
                ),
              )
            : null,
      ),
      style: context.textTheme.bodyLarge,
    );
  }
}
