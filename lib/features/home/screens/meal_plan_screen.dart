import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../../meals/controllers/meal_plan_controller.dart';
import '../../meals/models/meal_model.dart';
import '../../meals/widgets/guide_popover.dart';

class MealPlanScreen extends StatelessWidget {
  const MealPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MealPlanController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: Obx(() => c.hasAnyMeals
          ? _FilledState(c: c)
          : _EmptyState(c: c)),
    );
  }
}

// ── Empty State ──────────────────────────────────────────
class _EmptyState extends StatelessWidget {
  final MealPlanController c;
  const _EmptyState({required this.c});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              'Your personalized\nmeal plan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w700,
                color: AppColors.textPrimary, height: 1.3,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Plan your meals for the entire week in minutes. '
                  'Build your first meal plan to get started!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, color: AppColors.textSecondary, height: 1.6,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity, height: 52,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    builder: (_) => const GuidePopover(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Build Your First Meal Plan',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700,
                      color: Colors.white,
                    )),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

// ── Filled State ─────────────────────────────────────────
class _FilledState extends StatelessWidget {
  final MealPlanController c;
  const _FilledState({required this.c});

  static const _days = [
    'Monday', 'Tuesday', 'Wednesday',
    'Thursday', 'Friday', 'Saturday', 'Sunday',
  ];

  static const _short = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [

          // ── Header ──
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Meal Plan',
                    style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    )),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (_) => const GuidePopover(),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                        const Text('Add',
                            style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                        IconButton(
                          onPressed: () => Get.toNamed(AppRoutes.search),
                          icon: const Icon(Icons.search, color: AppColors.textPrimary),
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // ── Week Selector ──
          Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                GestureDetector(
                  onTap: c.prevWeek,
                  child: const Icon(Icons.chevron_left,
                      color: AppColors.textSecondary),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    c.weekRangeLabel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: c.nextWeek,
                  child: const Icon(Icons.chevron_right,
                      color: AppColors.textSecondary),
                ),
              ],
            ),
          )),
          const SizedBox(height: 20),

          // ── Day List ──
          Expanded(
            child: Obx(() => ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: _days.length,
              itemBuilder: (_, i) {
                final day    = _days[i];
                final date   = c.weekDay(i);
                final meals  = c.weeklyPlan[day] ?? [];
                final isToday = date.day == DateTime.now().day
                    && date.month == DateTime.now().month
                    && c.weekOffset.value == 0;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // ── Day header ──
                    Row(
                      children: [
                        Container(
                          width: 38, height: 38,
                          decoration: BoxDecoration(
                            color: isToday
                                ? AppColors.primary
                                : AppColors.backgroundGrey,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(_short[i],
                                    style: TextStyle(
                                      fontSize: 10, fontWeight: FontWeight.w600,
                                      color: isToday
                                          ? Colors.white
                                          : AppColors.textSecondary,
                                    )),
                                Text('${date.day}',
                                    style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.w700,
                                      color: isToday
                                          ? Colors.white
                                          : AppColors.textPrimary,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(day,
                            style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600,
                              color: isToday
                                  ? AppColors.primary
                                  : AppColors.textPrimary,
                            )),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // ── Meals or empty row ──
                    if (meals.isEmpty)
                      _EmptyDaySlot(
                        day: day,
                        onAdd: () => Get.toNamed(
                          AppRoutes.buildMealPlan,
                          arguments: day,
                        ),
                      )
                    else
                      _MealRow(
                        day: day,
                        meals: meals,
                        controller: c,
                      ),

                    const SizedBox(height: 20),
                  ],
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}

// ── Empty Day Slot ───────────────────────────────────────
class _EmptyDaySlot extends StatelessWidget {
  final String day;
  final VoidCallback onAdd;
  const _EmptyDaySlot({required this.day, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onAdd,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: AppColors.textHint, size: 18),
            SizedBox(width: 6),
            Text('Add a meal',
                style: TextStyle(
                  fontSize: 14, color: AppColors.textHint,
                )),
          ],
        ),
      ),
    );
  }
}

// ── Meal Row (horizontal scroll) ─────────────────────────
class _MealRow extends StatelessWidget {
  final String day;
  final List<MealModel> meals;
  final MealPlanController controller;
  const _MealRow({
    required this.day,
    required this.meals,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: meals.length + 1, // +1 for add button
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          // Last item = Add button
          if (i == meals.length) {
            return GestureDetector(
              onTap: () => Get.toNamed(
                AppRoutes.buildMealPlan,
                arguments: day,
              ),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: AppColors.textHint, size: 24),
                    SizedBox(height: 4),
                    Text('Add',
                        style: TextStyle(
                          fontSize: 12, color: AppColors.textHint,
                        )),
                  ],
                ),
              ),
            );
          }

          final meal = meals[i];
          return GestureDetector(
            onTap: () => Get.toNamed(
              AppRoutes.mealDetail,
              arguments: meal,
            ),
            child: Stack(
              children: [
                // ── Meal Card ──
                SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          meal.imageUrl,
                          width: 120, height: 110,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 120, height: 110,
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundGrey,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.image_outlined,
                                    color: AppColors.textHint),
                              ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(meal.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textPrimary,
                            height: 1.3,
                          )),
                    ],
                  ),
                ),

                // ── Remove button ──
                Positioned(
                  top: 6, right: 6,
                  child: GestureDetector(
                    onTap: () =>
                        controller.removeMealFromDay(day, meal.id),
                    child: Container(
                      width: 22, height: 22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close,
                          color: AppColors.textPrimary, size: 13),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}