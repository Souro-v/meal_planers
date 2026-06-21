import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/themes/app_colors.dart';
import '../models/collection_model.dart';

class CollectionController extends GetxController {

  final nameController = TextEditingController();

  // ── Dummy collections ──
  final collections = <CollectionModel>[
    CollectionModel(
      id: 'c1',
      name: 'Healthy',
      imageUrl: 'assets/images/meals/meal_greek_salad.png',
      recipeCount: 2,
    ),
    CollectionModel(
      id: 'c2',
      name: 'Japanese',
      imageUrl: 'assets/images/meals/meal_butter_chicken.png',
      recipeCount: 5,
    ),
  ].obs;

  final selectedIds = <String>[].obs;

  void toggleSelection(String id) {
    selectedIds.contains(id)
        ? selectedIds.remove(id)
        : selectedIds.add(id);
  }

  bool isSelected(String id) => selectedIds.contains(id);

  // ── Add new collection ──
  void createCollection() {
    final name = nameController.text.trim();
    if (name.isEmpty) return;

    collections.add(CollectionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      imageUrl: 'assets/images/meals/meal_recommended_1.png',
      recipeCount: 0,
    ));

    nameController.clear();
    Get.back(); // AddCollectionScreen বন্ধ
  }

  // ── Save selection ──
  void save() {
    // TODO: API call
    Get.back();
    Get.snackbar(
      'Saved!',
      'Recipe added to selected collections.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}