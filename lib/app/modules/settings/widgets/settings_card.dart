import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    this.label,
    required this.entries,
  });

  final String? label;
  final List<Widget> entries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            '$label',
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: Dimensions(context).font18,
            ),
          ),
          SizedBox(height: Dimensions(context).height10)
        ],
        RCard(
          isElevated: true,
          showBorder: false,
          borderRadius: Dimensions(context).radius15,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions(context).height20,
            horizontal: Dimensions(context).width10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: entries,
          ),
        ),
      ],
    );
  }
}
