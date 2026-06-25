import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_planers/features/grocerises/screens/groceries_screen.dart';
import '../../../app/themes/app_colors.dart';
import '../../favourites/controllers/favorites_controller.dart';
import '../../favourites/screens/favorites_screen.dart';
import '../../meals/controllers/meal_plan_controller.dart';
import '../../onboarding/controller/preference_controller.dart';
import '../../settings/screens/settings_screen.dart';
import '../controllers/main_controller.dart';
import 'meal_plan_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // ── Screens per tab ──
  static const _screens = [
    MealPlanScreen(),
    GroceriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController(), permanent: true);
    Get.put(PreferenceController(), permanent: true);
    Get.put(MealPlanController(), permanent: true);
    final c = Get.put(MainController());

    return Scaffold(
      body: Obx(
        () => IndexedStack(index: c.currentIndex.value, children: _screens),
      ),
      bottomNavigationBar: Obx(
        () => _AppBottomNav(
          currentIndex: c.currentIndex.value,
          onTap: c.changeTab,
        ),
      ),
    );
  }
}

// ── Custom Bottom Nav ─────────────────────────────────────
class _AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const _AppBottomNav({required this.currentIndex, required this.onTap});

  static const _icons = [
    'assets/icons/home.png',
    'assets/icons/groceries.png',
    'assets/icons/favourite.png',
    'assets/icons/settings.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(_icons.length, (i) {
              final isSelected = i == currentIndex;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(i),
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Image.asset(
                      _icons[i],
                      height: 44,
                      // Selected → orange, Unselected → gray
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textHint,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
