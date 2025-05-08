import 'package:flutter/material.dart';
import 'package:mini_service_booking/core/widgets/cards/r_card.dart';
import 'package:mini_service_booking/core/widgets/shimmers/shimmer_item.dart';

class ShimmerGrid extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;
  final double childAspectRatio;
  final EdgeInsets padding;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const ShimmerGrid({
    Key? key,
    this.itemCount = 6,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.8,
    this.padding = EdgeInsets.zero,
    this.mainAxisSpacing = 8,
    this.crossAxisSpacing = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: padding,
      itemCount: itemCount,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemBuilder: (context, index) {
        return const ShimmerServiceCard();
      },
    );
  }
}

class ShimmerServiceCard extends StatelessWidget {
  const ShimmerServiceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RCard(
      isElevated: false,
      showBorder: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerItem(
            width: double.infinity,
            height: 120,
            borderRadius: 8,
          ),
          const SizedBox(height: 12),
          ShimmerItem(
            width: 120,
            height: 16,
            borderRadius: 4,
          ),
          const SizedBox(height: 8),
          ShimmerItem(
            width: 80,
            height: 14,
            borderRadius: 4,
          ),
          const SizedBox(height: 8),
          ShimmerItem(
            width: 60,
            height: 14,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }
}
