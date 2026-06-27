import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/meal_plan_controller.dart';
import '../models/meal_model.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;
  final double width;
  final String? targetDay;

  const MealCard({
    super.key,
    required this.meal,
    this.width = 150,
    this.targetDay,
  });

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MealPlanController>();

    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.mealDetail, arguments: meal),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image + Badges ──
            Stack(
              children: [
                // Food image (Cloudinary / Network & Asset Ready)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: _buildImage(width),
                ),

                // Pro badge (top left)
                if (meal.isPro)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('Pro',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )),
                    ),
                  ),

                // + / ✓ button (top right)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(() {
                    final added = c.isAdded(meal.id);
                    return GestureDetector(
                      onTap: () {
                        c.toggleMeal(meal.id);
                        if (targetDay != null && !added) {
                          c.addMealToDay(targetDay!, meal);
                          Get.back();
                        }
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: added ? AppColors.primary : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: added ? AppColors.primary : AppColors.border,
                          ),
                        ),
                        child: Icon(
                          added ? Icons.check : Icons.add,
                          size: 16,
                          color: added ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // ── Meal Name ──
            Text(
              meal.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Image widget helper ──
  Widget _buildImage(double size) {
    final url = meal.imageUrl;
    final isNetwork = url.startsWith('http');

    if (isNetwork) {
      return CachedNetworkImage(
        imageUrl: url,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          color: AppColors.backgroundGrey,
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.backgroundGrey,
          child: const Icon(Icons.image_outlined, color: AppColors.textHint),
        ),
      );
    }

    return Image.asset(
      url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: AppColors.backgroundGrey,
        child: const Icon(Icons.image_outlined, color: AppColors.textHint),
      ),
    );
  }
}