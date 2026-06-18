import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';

class GuidePopover extends StatelessWidget {
  const GuidePopover({super.key});

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

          // ── Title ──
          const Text(
            'Build your first meal plan',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // ── Description ──
          const Text(
            'Add a few recipes to cook this week, and we\'ll '
                'build you an easy-to-shop grocery list.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28),

          // ── Got It Button ──
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Get.back();                           // bottom sheet is off
                Get.toNamed(AppRoutes.buildMealPlan); // go to screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Got It!',
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