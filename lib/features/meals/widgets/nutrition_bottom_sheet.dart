import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../models/meal_model.dart';

class NutritionBottomSheet extends StatelessWidget {
  final MealModel meal;
  const NutritionBottomSheet({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final n = meal.nutrition;
    if (n == null) return const SizedBox();

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Header ──
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Nutrition Facts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )),
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.close,
                    color: AppColors.textSecondary, size: 22),
              ),
            ],
          ),

          Text(
            'Per serving • ${meal.servings} servings',
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          const Divider(thickness: 2, color: AppColors.textPrimary),

          // ── Calories ──
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('Calories',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    )),
                Text('${n.calories}',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    )),
              ],
            ),
          ),
          const Divider(thickness: 2, color: AppColors.textPrimary),
          const SizedBox(height: 4),

          Align(
            alignment: Alignment.centerRight,
            child: Text('% Daily Value*',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                )),
          ),
          const SizedBox(height: 4),

          // ── Nutrition Rows ──
          _NutritionRow(label: 'Total Fat',   value: n.fat,     daily: '33%'),
          _NutritionRow(label: 'Total Carbs', value: n.carbs,   daily: '21%'),
          _NutritionRow(label: 'Protein',     value: n.protein, daily: ''),
          _NutritionRow(label: 'Fiber',       value: n.fiber,   daily: '14%'),
          _NutritionRow(label: 'Sugar',       value: n.sugar,   daily: ''),
          _NutritionRow(label: 'Sodium',      value: n.sodium,  daily: '43%',
              showDivider: false),

          const SizedBox(height: 12),
          const Text(
            '* Percent Daily Values are based on a 2,000 calorie diet.',
            style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _NutritionRow extends StatelessWidget {
  final String label;
  final String value;
  final String daily;
  final bool showDivider;

  const _NutritionRow({
    required this.label,
    required this.value,
    required this.daily,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    )),
              ),
              Text(value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                  )),
              if (daily.isNotEmpty) ...[
                const SizedBox(width: 16),
                SizedBox(
                  width: 36,
                  child: Text(daily,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      )),
                ),
              ] else
                const SizedBox(width: 52),
            ],
          ),
        ),
        if (showDivider)
          const Divider(height: 1, color: AppColors.divider),
      ],
    );
  }
}