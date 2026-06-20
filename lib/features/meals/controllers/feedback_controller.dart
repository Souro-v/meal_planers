import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';

class FeedbackController extends GetxController {
  final rating            = 0.obs;
  final commentController = TextEditingController();
  final isLoading         = false.obs;

  void setRating(int value) => rating.value = value;

  Future<void> send() async {
    // if no rating then no changes
    if (rating.value == 0) {
      Get.snackbar(
        'Rating Required',
        'Please select a star rating before sending.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    isLoading.value = true;

    try {
      await Future.delayed(const Duration(seconds: 1)); // TODO: API call

      // ── Success: screen close, snackbar  ──
      Get.back();
      Get.snackbar(
        'Feedback Sent!',
        'Thank you! Your feedback has been received.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        icon: const Icon(Icons.check_circle_outline, color: Colors.white),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );

    } catch (_) {
      // ── Failure: screen is on, top  error showing in top ──
      Get.snackbar(
        'Failed to Send',
        'Something went wrong. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        icon: const Icon(Icons.error_outline, color: Colors.white),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
        duration: const Duration(seconds: 3),
      );

    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    commentController.dispose();
    super.onClose();
  }
}