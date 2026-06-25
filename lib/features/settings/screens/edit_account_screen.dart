import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../shared/widgets/app_text_field.dart';
import '../controllers/account_controller.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AccountController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,
              color: AppColors.textPrimary),
        ),
        title: const Text('Edit Account',
            style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            )),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Avatar ──
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 90, height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.backgroundGrey,
                      border: Border.all(
                          color: AppColors.border, width: 2),
                    ),
                    child: const Icon(Icons.person,
                        size: 50, color: AppColors.textHint),
                  ),
                  Positioned(
                    bottom: 0, right: 0,
                    child: Container(
                      width: 28, height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white, width: 2),
                      ),
                      child: const Icon(Icons.edit,
                          color: Colors.white, size: 14),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ── Name ──
            AppTextField(
              label: 'Full Name',
              controller: c.nameController,
            ),
            const SizedBox(height: 20),

            // ── Email ──
            AppTextField(
              label: 'Email Address',
              controller: c.emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 28),

            // ── Change Password section ──
            const Text('Change Password',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                )),
            const SizedBox(height: 16),

            AppTextField(
              label: 'Current Password',
              controller: c.currentPasswordController,
              isPassword: true,
            ),
            const SizedBox(height: 20),

            AppTextField(
              label: 'New Password',
              controller: c.newPasswordController,
              isPassword: true,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),

      // ── Save Button ──
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: Obx(() => SizedBox(
          width: double.infinity, height: 52,
          child: ElevatedButton(
            onPressed: c.isLoading.value ? null : c.save,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: c.isLoading.value
                ? const SizedBox(
                width: 22, height: 22,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2.5))
                : const Text('Save Changes',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
        )),
      ),
    );
  }
}