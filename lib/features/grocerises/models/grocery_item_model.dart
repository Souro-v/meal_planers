class GroceryItemModel {
  final String id;
  final String name;
  final String quantity;
  final String category;
  final bool isChecked;
  final bool hasAllergen;

  GroceryItemModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    this.isChecked   = false,
    this.hasAllergen = false,
  });

  GroceryItemModel copyWith({bool? isChecked}) => GroceryItemModel(
    id: id, name: name, quantity: quantity,
    category: category, hasAllergen: hasAllergen,
    isChecked: isChecked ?? this.isChecked,
  );
}