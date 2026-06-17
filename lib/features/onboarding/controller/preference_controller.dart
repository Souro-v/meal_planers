import 'package:get/get.dart';
import '../../../app/routes/app_routes.dart';

class PreferenceController extends GetxController {

  // ── Diet (single select) ──────────────────
  final selectedDiet = ''.obs;

  // ── Allergies (multi select) ──────────────
  final selectedAllergies = <String>[].obs;

  void toggleAllergy(String item) {
    selectedAllergies.contains(item)
        ? selectedAllergies.remove(item)
        : selectedAllergies.add(item);
  }

  // ── Dislikes (multi select) ───────────────
  final selectedDislikes = <String>[].obs;

  void toggleDislike(String item) {
    selectedDislikes.contains(item)
        ? selectedDislikes.remove(item)
        : selectedDislikes.add(item);
  }

  // ── Servings (single select) ──────────────
  final selectedServings = ''.obs;

  // ── Reminder ──────────────────────────────
  final reminderEnabled = true.obs;
  final selectedTime    = '10:00 AM'.obs;
  final selectedDay     = 'Sundays'.obs;

  // ── Save & Navigate ───────────────────────
  Future<void> savePreferences() async {
    // TODO: API/local storage call
    Get.offAllNamed(AppRoutes.home);
  }
}