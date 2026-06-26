import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_planers/features/auth/controllers/auth_state_controller.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widgets/primary_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthStateController());
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(),

              // ── Logo ──
              Image.asset(
                'assets/icons/app_logo.png',
                width: 90,
                height: 90,
              ),
              const SizedBox(height: 16),

              // ── App Name ──
              const Text(
                'Mealtime',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              const CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2.5,
              ),
              const SizedBox(height: 40),
              // ── Get Started ──
              PrimaryButton(
                text: 'Get Started',
                onPressed: () => Get.toNamed(AppRoutes.signup),
              ),
              const SizedBox(height: 16),

              // ── Login link ──
              _loginRow(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already a member? ',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.login),
          child: const Text(
            'Login',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
