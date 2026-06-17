import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';
import '../controller/preference_controller.dart';
import '../widgets/preference_scaffold.dart';
import '../widgets/selection_chip.dart';

class SelectAllergiesScreen extends StatelessWidget {
  const SelectAllergiesScreen({super.key});

  static const _allergies = [
    'Gluten',
    'Peanut',
    'Tree Nut',
    'Soy',
    'Sesame',
    'Mustard',
    'Sulfite',
    'Nightshade',
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<PreferenceController>();

    return PreferenceScaffold(
      step: 2,
      title: 'Any allergies?',
      onContinue: () => Get.toNamed(AppRoutes.selectDislikes),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Obx(
          () => Wrap(
            spacing: 10,
            runSpacing: 10,
            children: _allergies.map((item) {
              final selected = c.selectedAllergies.contains(item);
              return GestureDetector(
                onTap: () => c.toggleAllergy(item),
                child: SelectionChip(label: item, selected: selected),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
