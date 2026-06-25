import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../onboarding/controller/preference_controller.dart';
import '../../onboarding/widgets/selection_chip.dart';

class EatingPreferencesScreen extends StatelessWidget {
  const EatingPreferencesScreen({super.key});

  static const _diets = [
    'Classic', 'Low Carb', 'Keto', 'Flexitarian',
    'Paleo', 'Vegetarian', 'Pescetarian', 'Vegan',
  ];

  static const _allergies = [
    'Gluten', 'Peanut', 'Tree Nut', 'Soy',
    'Sesame', 'Mustard', 'Sulfite', 'Nightshade',
  ];

  static const _dislikes = [
    'Avocado', 'Beets', 'Bell Peppers', 'Brussels Sprouts',
    'Cauliflower', 'Eggplant', 'Mushrooms', 'Olives',
    'Quinoa', 'Tofu', 'Turnips',
  ];

  static const _servings = [
    ('2 servings', 'for two, or one with leftovers'),
    ('4 servings', 'for four, or two-three with leftovers'),
    ('6 servings', 'for a family of 5+'),
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PreferenceController>();

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF9F7),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back,
              color: AppColors.textPrimary),
        ),
        title: const Text('Eating Preferences',
            style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            )),
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1, color: AppColors.border),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── Diet ──
            _SectionHeader(title: 'Your Diet'),
            const SizedBox(height: 12),
            Obx(() => Column(
              children: _diets.map((diet) {
                final selected = c.selectedDiet.value == diet;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () => c.selectedDiet.value = diet,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFFFFF0D9)
                            : Colors.white,
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : AppColors.border,
                          width: selected ? 1.5 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(diet,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: selected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: AppColors.textPrimary,
                          )),
                    ),
                  ),
                );
              }).toList(),
            )),
            const SizedBox(height: 28),

            // ── Allergies ──
            _SectionHeader(title: 'Allergies'),
            const SizedBox(height: 12),
            Obx(() => Wrap(
              spacing: 10, runSpacing: 10,
              children: _allergies.map((item) {
                final selected = c.selectedAllergies.contains(item);
                return GestureDetector(
                  onTap: () => c.toggleAllergy(item),
                  child: SelectionChip(
                      label: item, selected: selected),
                );
              }).toList(),
            )),
            const SizedBox(height: 28),

            // ── Dislikes ──
            _SectionHeader(title: 'Dislikes'),
            const SizedBox(height: 12),
            Obx(() => Wrap(
              spacing: 10, runSpacing: 10,
              children: _dislikes.map((item) {
                final selected = c.selectedDislikes.contains(item);
                return GestureDetector(
                  onTap: () => c.toggleDislike(item),
                  child: SelectionChip(
                      label: item, selected: selected),
                );
              }).toList(),
            )),
            const SizedBox(height: 28),

            // ── Servings ──
            _SectionHeader(title: 'Servings per Meal'),
            const SizedBox(height: 12),
            Obx(() => Column(
              children: _servings.map((s) {
                final selected = c.selectedServings.value == s.$1;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => c.selectedServings.value = s.$1,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFFFFF0D9)
                            : Colors.white,
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : AppColors.border,
                          width: selected ? 1.5 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(s.$1,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: selected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: AppColors.textPrimary,
                              )),
                          const SizedBox(height: 2),
                          Text(s.$2,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
            const SizedBox(height: 40),
          ],
        ),
      ),

      // ── Save ──
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 12, 24, 36),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.border)),
        ),
        child: SizedBox(
          width: double.infinity, height: 52,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Saved!', 'Your preferences have been updated.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.success,
                colorText: Colors.white,
                margin: const EdgeInsets.all(16),
                borderRadius: 12,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Save Preferences',
                style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w600,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ));
  }
}