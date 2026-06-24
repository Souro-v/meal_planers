import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controllers/meal_plan_controller.dart';
import '../controllers/search_controller.dart';
import '../models/meal_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MealSearchController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Search Bar ──
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Row(
                children: [

                  // Back button (Search screen থেকে এলে)
                  if (Get.previousRoute.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back,
                            color: AppColors.textPrimary),
                      ),
                    ),

                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: TextField(
                        controller: c.searchController,
                        autofocus: false,
                        onChanged: c.onSearch,
                        style: const TextStyle(
                          fontSize: 15, color: AppColors.textPrimary,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Search recipes...',
                          hintStyle: TextStyle(color: AppColors.textHint),
                          prefixIcon: Icon(Icons.search,
                              color: AppColors.textHint, size: 20),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),

                  // Clear button
                  Obx(() => c.query.value.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: c.clear,
                      child: const Text('Cancel',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  )
                      : const SizedBox()),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ── Filter Chips ──
            SizedBox(
              height: 36,
              child: Obx(() => ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: MealSearchController.filters.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final filter = MealSearchController.filters[i];
                  final selected =
                      c.selectedFilter.value == filter;
                  return GestureDetector(
                    onTap: () => c.setFilter(filter),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary
                            : Colors.white,
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(filter,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: selected
                                ? Colors.white
                                : AppColors.textPrimary,
                          )),
                    ),
                  );
                },
              )),
            ),
            const SizedBox(height: 16),

            // ── Results count ──
            Obx(() => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                c.query.value.isEmpty && c.selectedFilter.value == 'All'
                    ? 'All Recipes'
                    : '${c.results.length} results',
                style: const TextStyle(
                  fontSize: 13, color: AppColors.textSecondary,
                ),
              ),
            )),
            const SizedBox(height: 12),

            // ── Results Grid ──
            Expanded(
              child: Obx(() {
                final results = c.results;

                if (results.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: AppColors.textHint),
                        SizedBox(height: 16),
                        Text('No recipes found',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            )),
                        SizedBox(height: 8),
                        Text('Try a different keyword or filter',
                            style: TextStyle(
                              fontSize: 13, color: AppColors.textHint,
                            )),
                      ],
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: results.length,
                  itemBuilder: (_, i) =>
                      _SearchResultCard(meal: results[i]),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Search Result Card ────────────────────────────────────
class _SearchResultCard extends StatelessWidget {
  final MealModel meal;
  const _SearchResultCard({required this.meal});

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
                    errorBuilder: (context, error, stackTrace) =>
                        Container(
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

                // ── Duration badge ──
                Positioned(
                  bottom: 8, left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha:0.55),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.access_time,
                            color: Colors.white, size: 11),
                        const SizedBox(width: 3),
                        Text(meal.duration,
                            style: const TextStyle(
                              fontSize: 10, color: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
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

          // ── Servings ──
          Text('${meal.servings} servings',
              style: const TextStyle(
                fontSize: 11, color: AppColors.textSecondary,
              )),
        ],
      ),
    );
  }
}