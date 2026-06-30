class ChefModel {
  final String id;
  final String name;
  final String specialty;
  final String bio;
  final String emoji;
  final int recipeCount;
  final List<String> recipeIds;

  const ChefModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.bio,
    required this.emoji,
    required this.recipeCount,
    this.recipeIds = const [],
  });
}