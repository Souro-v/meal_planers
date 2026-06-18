import 'package:get/get.dart';
import '../models/meal_model.dart';

class MealPlanController extends GetxController {

  // ── Added Meals ───────────────────────────────
  final addedMealIds = <String>[].obs;

  void toggleMeal(String id) {
    addedMealIds.contains(id)
        ? addedMealIds.remove(id)
        : addedMealIds.add(id);
  }

  bool isAdded(String id) => addedMealIds.contains(id);

  // ── Dummy Data ────────────────────────────────
  // TODO: api will come later
  static const mostPopular = [
    MealModel(
      id: 'mp1',
      name: 'Brussels Sprouts, Mashed Potato & Sausage Bowl',
      imageUrl: 'assets/images/meals/meal_brussels_sprouts_bowl.png',
      isPro: true,
    ),
    MealModel(
      id: 'mp2',
      name: 'Roasted Cauliflower & Black Bean Burrito Bowl with Cilantro',
      imageUrl: 'assets/images/meals/meal_cauliflower_burrito_bowl.png',
    ),
    MealModel(
      id: 'mp3',
      name: 'Creamy Cashew Zucchini Vegan Sausage Pasta',
      imageUrl: 'assets/images/meals/meal_cashew_zucchini_pasta.png',
    ),
  ];

  static const recentlyCreated = [
    MealModel(
      id: 'rc1',
      name: 'Indian Butter Chicken with Basmati Rice (Chicken Makhani)',
      imageUrl: 'assets/images/meals/meal_butter_chicken.png',
    ),
    MealModel(
      id: 'rc2',
      name: 'Greek Salad with Feta Cheese & Kalamata Olives',
      imageUrl: 'assets/images/meals/meal_greek_salad.png',
      isPro: true,
    ),
    MealModel(
      id: 'rc3',
      name: 'Italian Pasta Tomato & Basil (Pomodoro)',
      imageUrl: 'assets/images/meals/meal_italian_pasta.png',
    ),
  ];

  static const recommendedPlan = [
    MealModel(
      id: 'rp1',
      name: 'Recommended Meal One',
      imageUrl: 'assets/images/meals/meal_recommended_1.png',
    ),
    MealModel(
      id: 'rp2',
      name: 'Recommended Meal Two',
      imageUrl: 'assets/images/meals/meal_recommended_2.png',
    ),
    MealModel(
      id: 'rp3',
      name: 'Recommended Meal Three',
      imageUrl: 'assets/images/meals/meal_recommended_3.png',
    ),
  ];
}