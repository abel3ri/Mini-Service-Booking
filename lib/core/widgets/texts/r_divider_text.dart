import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RDividerText extends StatelessWidget {
  const RDividerText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimensions(context).textFieldWidth,
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Get.theme.primaryColor,
              thickness: .5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              text,
              style: context.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Get.theme.primaryColor,
              thickness: .5,
            ),
          ),
        ],
      ),
    );
  }
}
