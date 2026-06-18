import 'package:flutter/material.dart';
import '../../../app/themes/app_colors.dart';
import '../models/meal_model.dart';
import 'meal_card.dart';

class MealSection extends StatelessWidget {
  final String title;
  final List<MealModel> meals;
  final VoidCallback? onSeeAll;

  const MealSection({
    super.key,
    required this.title,
    required this.meals,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ── Section Header ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  )),
              GestureDetector(
                onTap: onSeeAll,
                child: const Text('See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // ── Horizontal Scroll ──
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: meals.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) => MealCard(meal: meals[i]),
          ),
        ),
      ],
    );
  }
}