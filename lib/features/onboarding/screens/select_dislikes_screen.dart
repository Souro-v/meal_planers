import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../controller/preference_controller.dart';
import '../widgets/preference_scaffold.dart';
import '../widgets/selection_chip.dart';

class SelectDislikesScreen extends StatelessWidget {
  const SelectDislikesScreen({super.key});

  static const _dislikes = [
    'Avocado', 'Beets', 'Bell Peppers', 'Brussels Sprouts',
    'Cauliflower', 'Eggplant', 'Mushrooms', 'Olives',
    'Quinoa', 'Tofu', 'Turnips',
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PreferenceController>();

    return PreferenceScaffold(
      step: 3,
      title: 'How about dislikes?',
      onContinue: () => Get.toNamed(AppRoutes.selectServings),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(() => Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _dislikes.map((item) {
            final selected = c.selectedDislikes.contains(item);
            return GestureDetector(
              onTap: () => c.toggleDislike(item),
              child: SelectionChip(
                label: item,
                selected: selected,
              ),
            );
          }).toList(),
        )),
      ),
    );
  }
}