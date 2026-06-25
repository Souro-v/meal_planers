import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../app/themes/app_colors.dart';

class ShareMealtimeScreen extends StatelessWidget {
  const ShareMealtimeScreen({super.key});

  static const _refLink = 'https://mealtime.app/ref/ramy2024';

  void _copyLink(BuildContext context) {
    Clipboard.setData(const ClipboardData(text: _refLink));
    Get.snackbar(
      'Copied!', 'Referral link copied to clipboard.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void _share() {
    Share.share(
      '🍽️ I\'ve been using Mealtime to plan my weekly meals!\n\n'
          'It makes grocery shopping and cooking so much easier. '
          'Try it free: $_refLink',
      subject: 'Check out Mealtime!',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF9F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,
              color: AppColors.textPrimary),
        ),
        title: const Text('Share Mealtime',
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),

            // ── Illustration ──
            Container(
              width: 100, height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0D9),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Center(
                child: Text('🍽️', style: TextStyle(fontSize: 52)),
              ),
            ),
            const SizedBox(height: 24),

            // ── Title ──
            const Text('Share with friends',
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                )),
            const SizedBox(height: 12),

            const Text(
              'Love using Mealtime? Share it with your friends '
                  'and family and help them eat better too!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, color: AppColors.textSecondary, height: 1.6,
              ),
            ),
            const SizedBox(height: 32),

            // ── Referral Link Box ──
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your referral link',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      )),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(_refLink,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            )),
                      ),
                      GestureDetector(
                        onTap: () => _copyLink(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF0D9),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('Copy',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── Share Button ──
            SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton.icon(
                onPressed: _share,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.share_outlined,
                    color: Colors.white, size: 20),
                label: const Text('Share Now',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
              ),
            ),

            const Spacer(),

            // ── Footer note ──
            const Text(
              'When your friends sign up using your link, '
                  'you both get 1 month of Pro free!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12, color: AppColors.textSecondary, height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}