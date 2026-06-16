import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/utils/enums.dart';
import '../../../app/routes/app_routes.dart';

class AuthController extends GetxController {

  // ════════════════════════════════════════════
  //  SIGN UP
  // ════════════════════════════════════════════

  final nameController     = TextEditingController();
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();

  final nameState       = FieldState.normal.obs;
  final emailState      = FieldState.normal.obs;
  final passwordState   = FieldState.normal.obs;
  final isTermsAccepted = false.obs;
  final isSignUpLoading = false.obs;

  bool get isSignUpValid =>
      nameState.value     == FieldState.success &&
          emailState.value    == FieldState.success &&
          passwordState.value == FieldState.success &&
          isTermsAccepted.value;

  void validateName(String v) =>
      nameState.value = v.trim().length >= 2
          ? FieldState.success
          : FieldState.error;

  void validateEmail(String v) {
    final ok = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v);
    emailState.value = ok ? FieldState.success : FieldState.error;
  }

  void validatePassword(String v) =>
      passwordState.value = v.length >= 8
          ? FieldState.success
          : FieldState.error;

  Future<void> signUp() async {
    if (!isSignUpValid) return;
    isSignUpLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // TODO: API call
    isSignUpLoading.value = false;
    Get.offAllNamed(AppRoutes.onboarding);
  }

  // ════════════════════════════════════════════
  //  LOGIN
  // ════════════════════════════════════════════

  final loginEmailController    = TextEditingController();
  final loginPasswordController = TextEditingController();

  final loginEmailState    = FieldState.normal.obs;
  final loginPasswordState = FieldState.normal.obs;
  final isLoginLoading     = false.obs;

  bool get isLoginValid =>
      loginEmailState.value    == FieldState.success &&
          loginPasswordState.value == FieldState.success;

  void validateLoginEmail(String v) {
    final ok = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v);
    loginEmailState.value = ok ? FieldState.success : FieldState.error;
  }

  void validateLoginPassword(String v) =>
      loginPasswordState.value = v.length >= 8
          ? FieldState.success
          : FieldState.error;

  Future<void> login() async {
    if (!isLoginValid) return;
    isLoginLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // TODO: API call
    isLoginLoading.value = false;
    Get.offAllNamed(AppRoutes.home);
  }

  // ════════════════════════════════════════════
  //  SOCIAL AUTH
  // ════════════════════════════════════════════

  Future<void> signInWithGoogle() async {
    // TODO: Google sign in
  }

  Future<void> signInWithFacebook() async {
    // TODO: Facebook sign in
  }

  // ════════════════════════════════════════════
  //  CLEANUP
  // ════════════════════════════════════════════

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