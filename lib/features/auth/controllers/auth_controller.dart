import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/utils/enums.dart';

class AuthController extends GetxController {

  // --- Controllers ---
  final nameController     = TextEditingController();
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();

  // --- Observables ---
  final nameState      = FieldState.normal.obs;
  final emailState     = FieldState.normal.obs;
  final passwordState  = FieldState.normal.obs;
  final isTermsAccepted = false.obs;
  final isLoading       = false.obs;

  // --- Computed ---
  bool get isSignUpValid =>
      nameState.value     == FieldState.success &&
          emailState.value    == FieldState.success &&
          passwordState.value == FieldState.success &&
          isTermsAccepted.value;

  // --- Validators ---
  void validateName(String value) {
    nameState.value = value.trim().length >= 2
        ? FieldState.success
        : FieldState.error;
  }

  void validateEmail(String value) {
    final valid = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    emailState.value = valid ? FieldState.success : FieldState.error;
  }

  void validatePassword(String value) {
    passwordState.value = value.length >= 8
        ? FieldState.success
        : FieldState.error;
  }

  // --- Actions ---
  Future<void> signUp() async {
    if (!isSignUpValid) return;
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // TODO: API call
    isLoading.value = false;
    // Get.offAllNamed(AppRoutes.onboarding);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}