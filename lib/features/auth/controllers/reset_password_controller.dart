import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../core/services/auth_api_service.dart';
import '../../../shared/utils/enums.dart';

class ResetPasswordController extends GetxController {

  // ── Forgot Password ──────────────────────
  final forgotEmailController = TextEditingController();
  final forgotEmailState      = FieldState.normal.obs;

  void validateForgotEmail(String v) {
    final ok = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v);
    forgotEmailState.value = ok ? FieldState.success : FieldState.error;
  }

  // ── OTP ──────────────────────────────────
  final otpControllers = List.generate(4, (_) => TextEditingController());
  final otpFocusNodes  = List.generate(4, (_) => FocusNode());
  final otpLength      = 0.obs;

  String get otpCode =>
      otpControllers.map((c) => c.text).join();

  // ── Reset Password ───────────────────────
  final newPasswordController     = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordState          = FieldState.normal.obs;
  final confirmPasswordState      = FieldState.normal.obs;

  void validateNewPassword(String v) =>
      newPasswordState.value = v.length >= 8
          ? FieldState.success : FieldState.error;

  void validateConfirmPassword(String v) =>
      confirmPasswordState.value = v == newPasswordController.text
          ? FieldState.success : FieldState.error;

  bool get isResetValid =>
      newPasswordState.value    == FieldState.success &&
          confirmPasswordState.value == FieldState.success;

  final isLoading = false.obs;

  // ── Send Code ─────────────────────────────
  Future<void> sendCode() async {
    isLoading.value = true;
    try {
      await AuthApiService.forgotPassword(
          forgotEmailController.text.trim());
    } catch (e) {
      Get.snackbar('Error', 'Failed to send code. Try again.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.error,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16));
    } finally {
      isLoading.value = false;
    }
  }
  // ── Reset Password ────────────────────────
  Future<void> resetPassword() async {
    if (!isResetValid) return;
    isLoading.value = true;
    try {
      await AuthApiService.resetPassword(
        email:    forgotEmailController.text.trim(),
        password: newPasswordController.text,
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to reset password. Try again.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.error,
          colorText: Colors.white,
          margin: const EdgeInsets.all(16));
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    forgotEmailController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    for (final c in otpControllers) c.dispose();
    for (final f in otpFocusNodes) f.dispose();
    super.onClose();
  }
}