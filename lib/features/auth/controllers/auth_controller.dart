import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../core/services/auth_api_service.dart';
import '../../../core/services/social_auth_service.dart';
import '../../../core/services/storage_service.dart';
import '../../../shared/utils/enums.dart';

class AuthController extends GetxController {

  // ════════════════════════════════════════
  //  SIGN UP
  // ════════════════════════════════════════
  final nameController     = TextEditingController();
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();
  final nameState          = FieldState.normal.obs;
  final emailState         = FieldState.normal.obs;
  final passwordState      = FieldState.normal.obs;
  final isTermsAccepted    = false.obs;
  final isSignUpLoading    = false.obs;

  bool get isSignUpValid =>
      nameState.value     == FieldState.success &&
          emailState.value    == FieldState.success &&
          passwordState.value == FieldState.success &&
          isTermsAccepted.value;

  void validateName(String v) =>
      nameState.value = v.trim().length >= 2
          ? FieldState.success : FieldState.error;

  void validateEmail(String v) {
    final ok = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v);
    emailState.value = ok ? FieldState.success : FieldState.error;
  }

  void validatePassword(String v) =>
      passwordState.value = v.length >= 8
          ? FieldState.success : FieldState.error;

  Future<void> signUp() async {
    if (!isSignUpValid) return;
    isSignUpLoading.value = true;
    try {
      await AuthApiService.signUp(
        name:     nameController.text.trim(),
        email:    emailController.text.trim(),
        password: passwordController.text,
      );
      Get.offAllNamed(AppRoutes.onboarding);
    } catch (e) {
      _showError('Sign up failed. Please try again.');
    } finally {
      isSignUpLoading.value = false;
    }
  }

  // ════════════════════════════════════════
  //  LOGIN
  // ════════════════════════════════════════
  final loginEmailController    = TextEditingController();
  final loginPasswordController = TextEditingController();
  final loginEmailState         = FieldState.normal.obs;
  final loginPasswordState      = FieldState.normal.obs;
  final isLoginLoading          = false.obs;

  bool get isLoginValid =>
      loginEmailState.value    == FieldState.success &&
          loginPasswordState.value == FieldState.success;

  void validateLoginEmail(String v) {
    final ok = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v);
    loginEmailState.value = ok ? FieldState.success : FieldState.error;
  }

  void validateLoginPassword(String v) =>
      loginPasswordState.value = v.length >= 8
          ? FieldState.success : FieldState.error;

  Future<void> login() async {
    if (!isLoginValid) return;
    isLoginLoading.value = true;
    try {
      await AuthApiService.login(
        email:    loginEmailController.text.trim(),
        password: loginPasswordController.text,
      );
      Get.offAllNamed(StorageService.isOnboardingDone
          ? AppRoutes.home
          : AppRoutes.onboarding);
    } catch (e) {
      _showError('Invalid email or password.');
    } finally {
      isLoginLoading.value = false;
    }
  }

  // ════════════════════════════════════════
  //  SOCIAL AUTH
  // ════════════════════════════════════════
  final isSocialLoading = false.obs;

  Future<void> signInWithGoogle() async {
    isSocialLoading.value = true;
    try {
      final result = await SocialAuthService.signInWithGoogle();
      if (result != null) {
        Get.offAllNamed(StorageService.isOnboardingDone
            ? AppRoutes.home
            : AppRoutes.onboarding);
      }
    } catch (e) {
      _showError('Google sign in failed. Please try again.');
    } finally {
      isSocialLoading.value = false;
    }
  }
  Future<void> signInWithFacebook() async {
    isSocialLoading.value = true;
    try {
      final result = await SocialAuthService.signInWithFacebook();
      if (result != null) {
        Get.offAllNamed(StorageService.isOnboardingDone
            ? AppRoutes.home
            : AppRoutes.onboarding);
      }
    } catch (e) {
      _showError('Facebook sign in failed. Please try again.');
    } finally {
      isSocialLoading.value = false;
    }
  }
  //  HELPERS
  // ════════════════════════════════════════
  void _showError(String message) {
    Get.snackbar(
      'Error', message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.error,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}