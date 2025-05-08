import 'package:flutter/material.dart';

import 'package:get/get.dart';

enum ErrorType {
  network,
  server,
  timeout,
  parsing,
  data,
  handling,
  unknown,
  auth
}

class ErrorModel {
  ErrorModel({
    this.statusCode,
    required this.title,
    required this.message,
    this.timestamp,
    this.extra,
    this.errorType,
    this.position,
  });

  final int? statusCode;
  final String message;
  final String title;
  final String? timestamp;
  final Map<String, dynamic>? extra;
  final ErrorType? errorType;
  final SnackPosition? position;

  void showError() {
    Get.closeAllSnackbars();
    Get.showSnackbar(
      GetSnackBar(
        snackPosition: position ?? SnackPosition.BOTTOM,
        duration: const Duration(seconds: 4),
        animationDuration: const Duration(milliseconds: 300),
        dismissDirection: DismissDirection.horizontal,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Get.theme.colorScheme.error,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        borderRadius: 12,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        boxShadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        messageText: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Get.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
