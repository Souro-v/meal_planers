import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../../../app/themes/app_colors.dart';
import '../controllers/meal_detail_controller.dart';
import '../models/meal_model.dart';

// ── Action Menu function
void _showActionMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => const _ActionMenu(),
  );
}

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = Get.arguments as MealModel;
    final c = Get.put(MealDetailController());

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      body: Column(
        children: [
          // ── Hero Image ──
          _HeroImage(meal: meal),

          // ── Scrollable Content ──
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Favorite
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          meal.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            height: 1.3,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Obx(
                        () => GestureDetector(
                          onTap: c.toggleFavorite,
                          child: Icon(
                            c.isFavorite.value
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: c.isFavorite.value
                                ? Colors.red
                                : AppColors.textSecondary,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Duration + Servings
                  Text(
                    '${meal.duration} • ${meal.servings} servings',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Tab Bar
                  Obx(
                    () => _TabBar(
                      selectedIndex: c.selectedTab.value,
                      onChanged: c.changeTab,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tab Content
                  Obx(
                    () => switch (c.selectedTab.value) {
                      0 => _CookwareTab(cookware: meal.cookware),
                      1 => _IngredientsTab(ingredients: meal.ingredients),
                      2 => _InstructionsTab(instructions: meal.instructions),
                      _ => const SizedBox(),
                    },
                  ),

                  const SizedBox(height: 100), // space for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),

      // ── Bottom Bar ──
      bottomNavigationBar: _BottomBar(),
    );
  }
}

// ── Hero Image ───────────────────────────────────────────
class _HeroImage extends StatelessWidget {
  final MealModel meal;

  const _HeroImage({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          meal.imageUrl,
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: double.infinity,
            height: 280,
            color: AppColors.backgroundGrey,
            child: const Icon(
              Icons.image_outlined,
              color: AppColors.textHint,
              size: 48,
            ),
          ),
        ),
        // Gradient overlay
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withValues(alpha: 0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Buttons
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleButton(icon: Icons.arrow_back, onTap: () => Get.back()),
                _CircleButton(
                  icon: Icons.more_horiz,
                  onTap: () => _showActionMenu(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Circle Button ────────────────────────────────────────
class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20),
      ),
    );
  }
}

// ── Custom Tab Bar ───────────────────────────────────────
class _TabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onChanged;

  const _TabBar({required this.selectedIndex, required this.onChanged});

  static const _tabs = ['Cookware', 'Ingredients', 'Instructions'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_tabs.length, (i) {
        final selected = i == selectedIndex;
        return Padding(
          padding: EdgeInsets.only(right: i < _tabs.length - 1 ? 8 : 0),
          child: GestureDetector(
            onTap: () => onChanged(i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFFFFF0D9) : Colors.white,
                border: Border.all(
                  color: selected ? AppColors.primary : AppColors.border,
                  width: selected ? 1.5 : 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _tabs[i],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected
                      ? AppColors.textPrimary
                      : AppColors.textSecondary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// ── Cookware Tab ─────────────────────────────────────────
class _CookwareTab extends StatelessWidget {
  final List<String> cookware;

  const _CookwareTab({required this.cookware});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cookware
          .map(
            (item) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.kitchen_outlined,
                        color: AppColors.textSecondary,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: AppColors.divider),
              ],
            ),
          )
          .toList(),
    );
  }
}

// ── Ingredients Tab ──────────────────────────────────────
class _IngredientsTab extends StatelessWidget {
  final List<IngredientModel> ingredients;

  const _IngredientsTab({required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ingredients
          .map(
            (item) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        item.quantity,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: AppColors.divider),
              ],
            ),
          )
          .toList(),
    );
  }
}

// ── Instructions Tab ─────────────────────────────────────
class _InstructionsTab extends StatelessWidget {
  final List<InstructionModel> instructions;

  const _InstructionsTab({required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        instructions.length,
        (i) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Step Number ──
              Text(
                '${i + 1}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Instruction Text ──
                    Text(
                      instructions[i].step,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                        height: 1.5,
                      ),
                    ),

                    // ── Step Ingredients ──
                    if (instructions[i].items.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      ...instructions[i].items.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                              height: 1.6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Bottom Bar ───────────────────────────────────────────
class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          // Cooked? button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => Get.toNamed(AppRoutes.feedback),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              icon: const Icon(
                Icons.check_circle_outline,
                color: AppColors.textSecondary,
                size: 18,
              ),
              label: const Text(
                'Cooked?',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Start Cooking button
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Start Cooking',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionMenu extends StatelessWidget {
  const _ActionMenu();

  static const _actions = [
    (Icons.info_outline, 'Nutrition Facts', ''),
    (Icons.restaurant_menu, 'Open Cooking Mode', ''),
    (Icons.sticky_note_2_outlined, 'Add Notes', '/add-notes'), // ← route
    (Icons.share_outlined, 'Share', ''),
    (Icons.print_outlined, 'Print', ''),
    (Icons.feedback_outlined, 'Feedback For The Chef', '/feedback'), // ← route
    (Icons.bookmark_border, 'Add To Collections', '/select-collections'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 36),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Close ──
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close,
                color: AppColors.textSecondary,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // ── Action Items ──
          ...List.generate(
            _actions.length,
            (i) => Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    _actions[i].$1,
                    color: AppColors.textPrimary,
                    size: 22,
                  ),
                  title: Text(
                    _actions[i].$2,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  // ListTile onTap:
                  onTap: () {
                    Get.back(); // bottom sheet close
                    if (_actions[i].$3.isNotEmpty) {
                      Get.toNamed(_actions[i].$3); // route navigate
                    }
                  },
                ),
                if (i < _actions.length - 1)
                  const Divider(height: 1, color: AppColors.divider),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
