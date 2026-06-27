import 'package:get/get.dart';
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
    // favorite IDs load
    final ids = StorageService.getFavoriteIds();
    // TODO: API থেকে meal details fetch করে load করো
    // local dummy data  match
  }

  void toggleFavorite(MealModel meal) {
    isFavorite(meal.id)
        ? favoriteMeals.removeWhere((m) => m.id == meal.id)
        : favoriteMeals.add(meal);
    _saveToStorage();
  }

  bool isFavorite(String id) => favoriteMeals.any((m) => m.id == id);

  void _saveToStorage() {
    final ids = favoriteMeals.map((m) => m.id).toList();
    StorageService.saveFavoriteIds(ids);
  }
}
