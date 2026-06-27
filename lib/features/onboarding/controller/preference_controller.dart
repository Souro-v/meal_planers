import 'package:get/get.dart';
import '../../../core/services/storage_service.dart';
import '../../../core/services/notification_service.dart';
import '../../../app/routes/app_routes.dart';

class PreferenceController extends GetxController {
  final selectedDiet      = ''.obs;
  final selectedAllergies = <String>[].obs;
  final selectedDislikes  = <String>[].obs;
  final selectedServings  = ''.obs;
  final reminderEnabled   = true.obs;
  final selectedTime      = '10:00 AM'.obs;
  final selectedDay       = 'Sundays'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFromStorage();
  }

  void _loadFromStorage() {
    final prefs = StorageService.getPreferences();
    if (prefs == null) return;
    selectedDiet.value      = prefs['diet'] ?? '';
    selectedAllergies.value = List<String>.from(prefs['allergies'] ?? []);
    selectedDislikes.value  = List<String>.from(prefs['dislikes'] ?? []);
    selectedServings.value  = prefs['servings'] ?? '';
    reminderEnabled.value   = prefs['reminderEnabled'] ?? true;
    selectedTime.value      = prefs['time'] ?? '10:00 AM';
    selectedDay.value       = prefs['day'] ?? 'Sundays';
  }

  void toggleAllergy(String item) {
    selectedAllergies.contains(item)
        ? selectedAllergies.remove(item)
        : selectedAllergies.add(item);
  }

  void toggleDislike(String item) {
    selectedDislikes.contains(item)
        ? selectedDislikes.remove(item)
        : selectedDislikes.add(item);
  }

  Future<void> savePreferences() async {
    await StorageService.savePreferences({
      'diet':            selectedDiet.value,
      'allergies':       selectedAllergies.toList(),
      'dislikes':        selectedDislikes.toList(),
      'servings':        selectedServings.value,
      'reminderEnabled': reminderEnabled.value,
      'time':            selectedTime.value,
      'day':             selectedDay.value,
    });

    // Schedule notification if enabled
    if (reminderEnabled.value) {
      final dayMap = {
        'Mondays': 1, 'Tuesdays': 2, 'Wednesdays': 3,
        'Thursdays': 4, 'Fridays': 5, 'Saturdays': 6, 'Sundays': 7,
      };
      final timeParts  = selectedTime.value.split(':');
      final hourParts  = timeParts[1].split(' ');
      var hour         = int.parse(timeParts[0]);
      final isPm       = hourParts[1] == 'PM';
      if (isPm && hour != 12) hour += 12;
      if (!isPm && hour == 12) hour = 0;
      final minute     = int.parse(hourParts[0]);

      await NotificationService.scheduleWeeklyReminder(
        weekday: dayMap[selectedDay.value] ?? 7,
        hour:    hour,
        minute:  minute,
      );
    } else {
      await NotificationService.cancelAll();
    }

    await StorageService.setOnboardingDone();
    Get.offAllNamed(AppRoutes.home);
  }
}