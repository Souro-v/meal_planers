import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/meal_plan_controller.dart';
import '../models/meal_model.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // arguments: {'title': 'Most Popular', 'meals': [...]}
    final args  = Get.arguments as Map<String, dynamic>;
    final title = args['title'] as String;
    final meals = args['meals'] as List<MealModel>;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Header ──
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 16, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.textPrimary),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 8),
                  Text(title,
                      style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // ── Meal count ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('${meals.length} recipes',
                  style: const TextStyle(
                    fontSize: 13, color: AppColors.textSecondary,
                  )),
            ),
            const SizedBox(height: 16),

            // ── Grid ──
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.78,
                ),
                itemCount: meals.length,
                itemBuilder: (_, i) => _MealGridCard(meal: meals[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MealGridCard extends StatelessWidget {
  final MealModel meal;
  const _MealGridCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MealPlanController>();

    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.mealDetail, arguments: meal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                // ── Image ──
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    meal.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundGrey,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(Icons.image_outlined,
                          color: AppColors.textHint),
                    ),
                  ),
                ),

                // ── Pro badge ──
                if (meal.isPro)
                  Positioned(
                    top: 8, left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Pro',
                          style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),

                // ── + button ──
                Positioned(
                  top: 8, right: 8,
                  child: Obx(() {
                    final added = c.isAdded(meal.id);
                    return GestureDetector(
                      onTap: () => c.toggleMeal(meal.id),
                      child: Container(
                        width: 28, height: 28,
                        decoration: BoxDecoration(
                          color: added ? AppColors.primary : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: added
                                ? AppColors.primary
                                : AppColors.border,
                          ),
                        ),
                        child: Icon(
                          added ? Icons.check : Icons.add,
                          size: 16,
                          color: added
                              ? Colors.white
                              : AppColors.textSecondary,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // ── Name ──
          Text(meal.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13, color: AppColors.textPrimary, height: 1.4,
              )),

          // ── Duration ──
          Text(meal.duration,
              style: const TextStyle(
                fontSize: 11, color: AppColors.textSecondary,
              )),
        ],
      ),
    );
  }
}