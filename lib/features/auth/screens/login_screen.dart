import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textPrimary,
                ),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 24),
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 32),

              // ── Email ──
              Obx(
                () => AppTextField(
                  label: 'Email Address',
                  hint: 'Enter your email',
                  controller: c.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  fieldState: c.loginEmailState.value,
                  onChanged: c.validateLoginEmail,
                ),
              ),
              const SizedBox(height: 20),

              // ── Password ──
              Obx(
                () => AppTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: c.loginPasswordController,
                  isPassword: true,
                  fieldState: c.loginPasswordState.value,
                  onChanged: c.validateLoginPassword,
                ),
              ),
              const SizedBox(height: 12),

              // ── Forgot Password ──
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ── Login Button ──
              Obx(() {
                final active = c.isLoginValid;
                return SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: active && !c.isLoginLoading.value
                        ? c.login
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: active
                          ? AppColors.primary
                          : const Color(0xFFDDDDDD),
                      disabledBackgroundColor: const Color(0xFFDDDDDD),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: c.isLoginLoading.value
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.5,
                            ),
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
                text: 'Login with Google',
                icon: FontAwesomeIcons.google,
                iconColor: const Color(0xFF4285F4),
                onPressed: () {},
              ),
              const SizedBox(height: 12),

              // ── Facebook ──
              _SocialButton(
                text: 'Login with Facebook',
                icon: FontAwesomeIcons.facebook,
                iconColor: Colors.white,
                backgroundColor: const Color(0xFF1877F2),
                textColor: Colors.white,
                onPressed: () {},
              ),
              const SizedBox(height: 24),

              // ── Sign Up link ──
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member? ',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.signup),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) => const Row(
    children: [
      Expanded(child: Divider(color: AppColors.border)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Or',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
      ),
      Expanded(child: Divider(color: AppColors.border)),
    ],
  );
}

class _SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.textPrimary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          side: backgroundColor == Colors.white
              ? const BorderSide(color: AppColors.border)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: FaIcon(icon, color: iconColor, size: 18),
        label: Text(
          text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
