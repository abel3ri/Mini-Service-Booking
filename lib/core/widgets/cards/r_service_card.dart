import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:mini_service_booking/app/data/models/core/service_model.dart';
import 'package:mini_service_booking/core/utils/dimensions.dart';

class RServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback? onTap;
  final bool showCartControls;
  final bool showRating;
  final bool showPrice;
  final double? height;
  final double? width;
  final double? maxImageHeight;

  const RServiceCard({
    super.key,
    required this.service,
    this.onTap,
    this.showCartControls = true,
    this.showRating = true,
    this.showPrice = true,
    this.height,
    this.width,
    this.maxImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.toNamed("/service-details", arguments: {
              "id": service.id,
            });
          },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.isDarkMode ? Color(0x1F646464) : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: context.isDarkMode ? Colors.black54 : Colors.grey.shade200,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: maxImageHeight ?? Dimensions(context).height150,
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  imageUrl: service.imageUrl ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9cSGzVkaZvJD5722MU5A-JJt_T5JMZzotcw&s',
                  placeholder: (context, url) => Image.asset(
                    "assets/misc/placeholder.jpg",
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/misc/placeholder.jpg",
                    fit: BoxFit.cover,
                  ),
                  memCacheHeight: 600,
                  memCacheWidth: 600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions(context).width15,
                vertical: Dimensions(context).height10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name ?? 'N/A',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall,
                  ),
                  SizedBox(height: Dimensions(context).height10),
                  if (showRating) ...[
                    Row(
                      children: [
                        Text(
                          service.rating?.toStringAsFixed(1) ?? '0.0',
                          style: context.textTheme.titleLarge,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Get.theme.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions(context).width10),
                  ],
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (showPrice)
                        Text.rich(
                          TextSpan(
                            text: "ETB ",
                            children: [
                              TextSpan(
                                text:
                                    service.price?.toStringAsFixed(2) ?? "N/A",
                                style: context.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
