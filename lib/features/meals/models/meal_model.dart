class NutritionModel {
  final int calories;
  final String protein;
  final String carbs;
  final String fat;
  final String fiber;
  final String sugar;
  final String sodium;

  const NutritionModel({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.fiber,
    required this.sugar,
    required this.sodium,
  });
}

class IngredientModel {
  final String name;
  final String quantity;
  const IngredientModel({required this.name, required this.quantity});
}

class InstructionModel {
  final String step;
  final List<String> items;
  const InstructionModel({required this.step, this.items = const []});
}

class MealModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isPro;
  final String duration;
  final int servings;
  final List<String> cookware;
  final List<IngredientModel> ingredients;
  final List<InstructionModel> instructions;
  final NutritionModel? nutrition;

  const MealModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isPro = false,
    this.duration = '30 minutes',
    this.servings = 2,
    this.cookware = const [],
    this.ingredients = const [],
    this.instructions = const [],
    this.nutrition,
  });
}