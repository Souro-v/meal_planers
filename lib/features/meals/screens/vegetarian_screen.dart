import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/meal_plan_controller.dart';
import '../models/meal_model.dart';

class VegetarianScreen extends StatelessWidget {
  const VegetarianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Header ──
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 24, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.textPrimary),
                  ),
                  const SizedBox(width: 4),
                  const Text('Vegetarian',
                      style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 4),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '${MealPlanController.vegetarianMeals.length} plant-based recipes',
                style: const TextStyle(
                  fontSize: 13, color: AppColors.textSecondary,
                ),
              ),
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
                  childAspectRatio: 0.75,
                ),
                itemCount: MealPlanController.vegetarianMeals.length,
                itemBuilder: (_, i) => _VegetarianCard(
                  meal: MealPlanController.vegetarianMeals[i],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VegetarianCard extends StatelessWidget {
  final MealModel meal;
  const _VegetarianCard({required this.meal});

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

                // ── Image (Cloudinary network) ──
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(
                    meal.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGrey,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        ),
                      );
                    },
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

                // ── Vegetarian badge ──
                Positioned(
                  top: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.eco, color: Colors.white, size: 11),
                        SizedBox(width: 3),
                        Text('Veg',
                            style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),

                // ── Pro badge (if applicable) ──
                if (meal.isPro)
                  Positioned(
                    top: 8, right: 38,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Pro',
                          style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),

                // ── + / ✓ button ──
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

          Text(meal.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13, color: AppColors.textPrimary, height: 1.4,
              )),
          Text(meal.duration,
              style: const TextStyle(
                fontSize: 11, color: AppColors.textSecondary,
              )),
        ],
      ),
    );
  }
}