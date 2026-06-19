class IngredientModel {
  final String name;
  final String quantity;

  const IngredientModel({
    required this.name,
    required this.quantity,
  });
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
  });
}
class InstructionModel {
  final String step;
  final List<String> items; //step ingredients

  const InstructionModel({
    required this.step,
    this.items = const [],
  });
}

