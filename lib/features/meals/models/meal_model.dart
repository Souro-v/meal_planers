class MealModel {
  final String id;
  final String name;
  final String imageUrl;
  final bool isPro;

  const MealModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isPro = false,
  });
}