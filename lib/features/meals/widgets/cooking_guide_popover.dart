import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../models/meal_model.dart';

class CookingGuidePopover extends StatelessWidget {
  final MealModel meal;
  const CookingGuidePopover({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Close ──
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.close,
                  color: AppColors.textSecondary, size: 22),
            ),
          ),
          const SizedBox(height: 8),

          // ── Hand Icon ──
          const Text('🖐️', style: TextStyle(fontSize: 36)),
          const SizedBox(height: 16),

          // ── Title ──
          const Text('Hands-free cooking',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              )),
          const SizedBox(height: 12),

          // ── Description ──
          const Text(
            'Advance to the next instruction without touching '
                'your screen with icky fingers. Hold your hand over '
                'the top of your screen until it goes black, then remove.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),

          // ── Continue ──
          SizedBox(
            width: double.infinity, height: 52,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
                Get.toNamed(AppRoutes.cookingMode, arguments: meal);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}