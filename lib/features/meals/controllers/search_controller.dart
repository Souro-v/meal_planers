import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/meal_model.dart';
import '../controllers/meal_plan_controller.dart';

class MealSearchController extends GetxController {
  final searchController = TextEditingController();

  final query         = ''.obs;
  final selectedFilter = 'All'.obs;

  static const filters = [
    'All', 'Quick (< 20 min)', 'Vegetarian',
    'Vegan', 'High Protein', 'Pro',
  ];

  // ── All meals combined ──
  static final _allMeals = [
    ...MealPlanController.mostPopular,
    ...MealPlanController.recentlyCreated,
    ...MealPlanController.recommendedPlan,
  ];

  List<MealModel> get results {
    var list = _allMeals.toList();

    // Filter
    switch (selectedFilter.value) {
      case 'Pro':
        list = list.where((m) => m.isPro).toList();
        break;
      case 'Quick (< 20 min)':
        list = list.where((m) {
          final mins = int.tryParse(
              m.duration.replaceAll(RegExp(r'[^0-9]'), '')) ?? 99;
          return mins <= 20;
        }).toList();
        break;
      case 'Vegetarian':
        list = list.where((m) =>
        m.name.toLowerCase().contains('salad') ||
            m.name.toLowerCase().contains('vegan') ||
            m.name.toLowerCase().contains('vegetable') ||
            m.name.toLowerCase().contains('cauliflower') ||
            m.name.toLowerCase().contains('tofu')
        ).toList();
        break;
      case 'Vegan':
        list = list.where((m) =>
        m.name.toLowerCase().contains('vegan') ||
            m.name.toLowerCase().contains('tofu') ||
            m.name.toLowerCase().contains('vegetable')
        ).toList();
        break;
      case 'High Protein':
        list = list.where((m) {
          final protein = int.tryParse(
              m.nutrition?.protein.replaceAll(RegExp(r'[^0-9]'), '') ?? '0') ?? 0;
          return protein >= 30;
        }).toList();
        break;
    }

    // Search query
    if (query.value.isNotEmpty) {
      list = list.where((m) =>
          m.name.toLowerCase().contains(query.value.toLowerCase())
      ).toList();
    }

    return list;
  }

  void onSearch(String v) => query.value = v;

  void setFilter(String f) => selectedFilter.value = f;

  void clear() {
    searchController.clear();
    query.value = '';
    selectedFilter.value = 'All';
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}