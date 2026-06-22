import 'package:get/get.dart';
import '../models/grocery_item_model.dart';

class GroceriesController extends GetxController {

  final showAllergenWarning = true.obs;

  final items = <GroceryItemModel>[
    GroceryItemModel(id: 'g1', name: 'lemon',            quantity: '½', category: 'Produce',  isChecked: true),
    GroceryItemModel(id: 'g2', name: 'lime',             quantity: '1', category: 'Produce'),
    GroceryItemModel(id: 'g3', name: 'mango',            quantity: '½', category: 'Produce'),
    GroceryItemModel(id: 'g4', name: 'orange',           quantity: '½', category: 'Produce'),
    GroceryItemModel(id: 'g5', name: 'english cucumber', quantity: '1', category: 'Produce',  isChecked: true),
    GroceryItemModel(id: 'g6', name: 'chicken breast',   quantity: '2', category: 'Meat',     hasAllergen: true),
    GroceryItemModel(id: 'g7', name: 'coconut milk',     quantity: '1', category: 'Canned',   hasAllergen: true),
    GroceryItemModel(id: 'g8', name: 'basmati rice',     quantity: '1', category: 'Grains'),
    GroceryItemModel(id: 'g9', name: 'olive oil',        quantity: '1', category: 'Pantry'),
  ].obs;

  // ── Grouped by category ──
  Map<String, List<GroceryItemModel>> get grouped {
    final map = <String, List<GroceryItemModel>>{};
    for (final item in items) {
      map.putIfAbsent(item.category, () => []).add(item);
    }
    return map;
  }

  void toggleItem(String id) {
    final i = items.indexWhere((item) => item.id == id);
    if (i != -1) items[i] = items[i].copyWith(isChecked: !items[i].isChecked);
  }

  void dismissAllergenWarning() => showAllergenWarning.value = false;

  void addItem(String name) {
    items.add(GroceryItemModel(
      id:       DateTime.now().millisecondsSinceEpoch.toString(),
      name:     name,
      quantity: '1',
      category: 'Other',
    ));
  }
}