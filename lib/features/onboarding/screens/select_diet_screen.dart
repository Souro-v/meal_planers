import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controller/preference_controller.dart';
import '../widgets/preference_scaffold.dart';

class SelectDietScreen extends StatelessWidget {
  const SelectDietScreen({super.key});

  static const _diets = [
    'Classic', 'Low Carb', 'Keto', 'Flexitarian',
    'Paleo', 'Vegetarian', 'Pescetarian', 'Vegan',
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.put(PreferenceController());

    return PreferenceScaffold(
      step: 1,
      title: 'Pick your diet',
      onContinue: () => Get.toNamed(AppRoutes.selectAllergies),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: _diets.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, i) => Obx(() {
          final selected = c.selectedDiet.value == _diets[i];
          return GestureDetector(
            onTap: () => c.selectedDiet.value = _diets[i],
            child: _SelectionTile(
              label: _diets[i],
              selected: selected,
            ),
          );
        }),
      ),
    );
  }
}

class _SelectionTile extends StatelessWidget {
  final String label;
  final bool selected;
  const _SelectionTile({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFFF0D9) : Colors.white,
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.border,
          width: selected ? 1.5 : 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}