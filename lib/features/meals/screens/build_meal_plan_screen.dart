import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/meal_plan_controller.dart';
import '../widgets/meal_section.dart';

class BuildMealPlanScreen extends StatelessWidget {
  const BuildMealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final targetDay = Get.arguments as String?;
    final c = Get.find<MealPlanController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top Row ──
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close, color: AppColors.textPrimary),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  if (targetDay != null)
                    Text(
                      targetDay,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.textPrimary,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Build a meal plan',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MealSection(
                      title: 'Most Popular',
                      meals: MealPlanController.mostPopular,
                      targetDay: targetDay,
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 28),
                    MealSection(
                      title: 'Recently Created',
                      meals: MealPlanController.recentlyCreated,
                      targetDay: targetDay,
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 28),
                    MealSection(
                      title: 'Recommended Plan',
                      meals: MealPlanController.recommendedPlan,
                      targetDay: targetDay,
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
