import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';

class AccountController extends GetxController {
  final nameController            = TextEditingController();
  final emailController           = TextEditingController();
  final currentPasswordController = TextEditingController();
  final newPasswordController     = TextEditingController();
  final isLoading                 = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController.text  = 'Ramy';
    emailController.text = 'ramy@example.co.uk';
  }

  Future<void> save() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    Get.back();
    Get.snackbar(
      'Saved!', 'Your account has been updated.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }
}