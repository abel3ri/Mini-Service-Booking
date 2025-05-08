import 'package:flutter/material.dart';

import 'package:get/get.dart';

Future<bool?> rPromptDialog({
  required String title,
  required String content,
  required String mainActionLabel,
  String cancelLabel = 'text_Cancel',
}) async {
  return await showDialog<bool>(
    context: Get.context!,
    builder: (context) => AlertDialog(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(title.tr),
      content: Text(content.tr),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back(result: true);
          },
          child: Text(
            mainActionLabel.tr,
            style: context.textTheme.titleSmall?.copyWith(
              color: Get.theme.primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back(result: false);
          },
          child: Text(
            cancelLabel.tr,
            style: context.textTheme.titleSmall?.copyWith(
              color: Get.theme.primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}
