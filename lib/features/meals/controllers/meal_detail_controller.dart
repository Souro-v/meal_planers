import 'package:get/get.dart';

class MealDetailController extends GetxController {
  final selectedTab = 0.obs;
  //final isFavorite  = false.obs;

  void changeTab(int index) => selectedTab.value = index;
//  void toggleFavorite() => isFavorite.value = !isFavorite.value;
}