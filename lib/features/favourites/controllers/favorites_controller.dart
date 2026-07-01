
import 'package:get/get.dart';
import '../../meals/controllers/meal_plan_controller.dart';
import '../../meals/models/meal_model.dart';
import '../../../core/services/storage_service.dart';

class FavoritesController extends GetxController {
  final favoriteMeals = <MealModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFromStorage();
  }

  void _loadFromStorage() {
    final savedIds = StorageService.getFavoriteIds();
    if (savedIds.isEmpty) return;

    final matched = MealPlanController.allMeals
        .where((meal) => savedIds.contains(meal.id))
        .toList();

    favoriteMeals.addAll(matched);
  }

  void toggleFavorite(MealModel meal) {
    isFavorite(meal.id)
        ? favoriteMeals.removeWhere((m) => m.id == meal.id)
        : favoriteMeals.add(meal);
    _saveToStorage();
  }

  bool isFavorite(String id) =>
      favoriteMeals.any((m) => m.id == id);

  void _saveToStorage() {
    final ids = favoriteMeals.map((m) => m.id).toList();
    StorageService.saveFavoriteIds(ids);
  }
}