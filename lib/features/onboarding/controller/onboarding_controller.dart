import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage    = 0.obs;

  void onPageChanged(int index) => currentPage.value = index;

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAllNamed(AppRoutes.selectDiet);
    }
  }

  void skip() => Get.offAllNamed(AppRoutes.home);

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}