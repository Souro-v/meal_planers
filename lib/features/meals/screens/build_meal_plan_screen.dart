import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/meal_plan_controller.dart';
import '../widgets/meal_section.dart';

class BuildMealPlanScreen extends StatelessWidget {
  const BuildMealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MealPlanController());

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
                    icon: const Icon(Icons.close,
                        color: AppColors.textPrimary),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: Search
                    },
                    icon: const Icon(Icons.search,
                        color: AppColors.textPrimary),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // ── Title ──
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

            // ── Sections ──
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MealSection(
                      title: 'Most Popular',
                      meals: MealPlanController.mostPopular,
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 28),
                    MealSection(
                      title: 'Recently Created',
                      meals: MealPlanController.recentlyCreated,
                      onSeeAll: () {},
                    ),
                    const SizedBox(height: 28),
                    MealSection(
                      title: 'Recommended Plan',
                      meals: MealPlanController.recommendedPlan,
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