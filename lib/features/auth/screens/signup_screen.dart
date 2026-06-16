import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AuthController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // ── Back button ──
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 24),

              // ── Title ──
              const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 28, fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 32),

              // ── Full Name ──
              Obx(() => AppTextField(
                label: 'Full Name',
                hint: 'Enter your full name',
                controller: c.nameController,
                fieldState: c.nameState.value,
                onChanged: c.validateName,
              )),
              const SizedBox(height: 20),

              // ── Email ──
              Obx(() => AppTextField(
                label: 'Email Address',
                hint: 'Enter your email',
                controller: c.emailController,
                keyboardType: TextInputType.emailAddress,
                fieldState: c.emailState.value,
                onChanged: c.validateEmail,
              )),
              const SizedBox(height: 20),

              // ── Password ──
              Obx(() => AppTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: c.passwordController,
                isPassword: true,
                fieldState: c.passwordState.value,
                onChanged: c.validatePassword,
              )),
              const SizedBox(height: 20),

              // ── Terms & Conditions ──
              Obx(() => Row(
                children: [
                  SizedBox(
                    width: 20, height: 20,
                    child: Checkbox(
                      value: c.isTermsAccepted.value,
                      activeColor: AppColors.primary,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      onChanged: (v) => c.isTermsAccepted.value = v ?? false,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 13,
                            color: AppColors.textSecondary),
                        children: [
                          TextSpan(text: "I agree to Mealtime's "),
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 24),

              // ── Create Account Button ──
              Obx(() {
                final active = c.isSignUpValid;
                return SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: active && !c.isSignUpLoading.value
                        ? c.signUp : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      active ? AppColors.primary : const Color(0xFFDDDDDD),
                      disabledBackgroundColor: const Color(0xFFDDDDDD),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: c.isSignUpLoading.value
                        ? const SizedBox(
                      width: 22, height: 22,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5),
                    )
                        : Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600,
                        color: active
                            ? AppColors.white
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 24),

              // ── Or divider ──
              const _OrDivider(),
              const SizedBox(height: 24),

              // ── Google ──
              _SocialButton(
                text: 'Sign Up with Google',
                onPressed: () {},
                isGoogle: true,
              ),
              const SizedBox(height: 12),

              // ── Facebook ──
              _SocialButton(
                text: 'Sign Up with Facebook',
                onPressed: () {},
                isFacebook: true,
              ),
              const SizedBox(height: 24),

              // ── Already a member ──
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member? ',
                        style: TextStyle(color: AppColors.textSecondary,
                            fontSize: 14)),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.login),
                      child: const Text('Login',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14, fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Or Divider ──────────────────────────────────────
class _OrDivider extends StatelessWidget {
  const _OrDivider();
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: AppColors.border)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Or',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14)),
        ),
        Expanded(child: Divider(color: AppColors.border)),
      ],
    );
  }
}

// ── Social Button ────────────────────────────────────
class _SocialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isGoogle;
  final bool isFacebook;

  const _SocialButton({
    required this.text,
    required this.onPressed,
    this.isGoogle = false,
    this.isFacebook = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isFacebook) {
      return SizedBox(
        width: double.infinity, height: 52,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1877F2),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
          icon: const Text('f',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800,
                  color: Colors.white)),
          label: const Text('Sign Up with Facebook',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
      );
    }

    // Google
    return SizedBox(
      width: double.infinity, height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
        icon: const Text('G',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,
                color: Color(0xFF4285F4))),
        label: const Text('Sign Up with Google',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,
                color: AppColors.textPrimary)),
      ),
    );
  }
}