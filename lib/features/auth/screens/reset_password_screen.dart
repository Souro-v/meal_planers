import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<ResetPasswordController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: 24),
              const Text('Reset password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              const Text(
                'Set the new password for your account.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 32),

              // ── New Password ──
              Obx(() => AppTextField(
                label: 'Password',
                hint: 'Enter new password',
                controller: c.newPasswordController,
                isPassword: true,
                fieldState: c.newPasswordState.value,
                onChanged: c.validateNewPassword,
              )),
              const SizedBox(height: 20),

              // ── Confirm Password ──
              Obx(() => AppTextField(
                label: 'Re-enter Password',
                hint: 'Confirm your password',
                controller: c.confirmPasswordController,
                isPassword: true,
                fieldState: c.confirmPasswordState.value,
                onChanged: c.validateConfirmPassword,
              )),

              const Spacer(),

              // ── Set Password Button ──
              Obx(() => SizedBox(
                width: double.infinity, height: 52,
                child: ElevatedButton(
                  onPressed: c.isResetValid && !c.isLoading.value
                      ? () async {
                    await c.resetPassword();
                    _showSuccessDialog(context);
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: const Color(0xFFDDDDDD),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: c.isLoading.value
                      ? const SizedBox(width: 22, height: 22,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.5))
                      : const Text('Set a New Password',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              )),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // ── Success Dialog ────────────────────────────
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── X close ──
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close,
                      color: AppColors.textSecondary, size: 20),
                ),
              ),
              const SizedBox(height: 8),

              // ── Green checkmark ──
              Container(
                width: 72, height: 72,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check,
                    color: Colors.white, size: 36),
              ),
              const SizedBox(height: 20),

              const Text('Password Changed!',
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              const Text(
                'Your can now use your new\npassword to login.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13,
                    color: AppColors.textSecondary),
              ),
              const SizedBox(height: 24),

              // ── Login Button ──
              SizedBox(
                width: double.infinity, height: 52,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.login),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Login',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}