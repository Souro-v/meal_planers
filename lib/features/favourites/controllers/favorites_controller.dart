import 'package:get/get.dart';
import '../../meals/models/meal_model.dart';

class FavoritesController extends GetxController {

  final favoriteMeals = <MealModel>[].obs;

  void toggleFavorite(MealModel meal) {
    isFavorite(meal.id)
        ? favoriteMeals.removeWhere((m) => m.id == meal.id)
        : favoriteMeals.add(meal);
  }

  bool isFavorite(String id) =>
      favoriteMeals.any((m) => m.id == id);
}