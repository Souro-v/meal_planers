import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../../../app/routes/app_routes.dart';
import '../controller/preference_controller.dart';
import '../widgets/preference_scaffold.dart';

class SelectServingsScreen extends StatelessWidget {
  const SelectServingsScreen({super.key});

  static const _servings = [
    ('2 servings', 'for two, or one with leftovers'),
    ('4 servings', 'for four, or two-three with leftovers'),
    ('6 servings', 'for a family of 5+'),
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PreferenceController>();

    return PreferenceScaffold(
      step: 4,
      title: 'How many servings\nper meal?',
      onContinue: () => Get.toNamed(AppRoutes.setReminder),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: _servings.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final (title, subtitle) = _servings[i];
          return Obx(() {
            final selected = c.selectedServings.value == title;
            return GestureDetector(
              onTap: () => c.selectedServings.value = title,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFFFF0D9)
                      : Colors.white,
                  border: Border.all(
                    color: selected ? AppColors.primary : AppColors.border,
                    width: selected ? 1.5 : 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: AppColors.textPrimary,
                        )),
                    const SizedBox(height: 4),
                    Text(subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        )),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}