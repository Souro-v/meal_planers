import 'dart:async';
import 'package:get/get.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../models/meal_model.dart';

class CookingController extends GetxController {
  final MealModel meal;

  CookingController(this.meal);

  final currentStep = 0.obs;
  final timerSeconds = 0.obs;
  final isTimerRunning = false.obs;
  final activeTimerMins = 0.obs;

  Timer? _countdown;

  // ── Getters ──────────────────────────────
  bool get isLastStep => currentStep.value >= meal.instructions.length - 1;

  InstructionModel get currentInstruction =>
      meal.instructions[currentStep.value];

  String get formattedTime {
    final m = timerSeconds.value ~/ 60;
    final s = timerSeconds.value % 60;
    return '${m.toString().padLeft(2, '0')}:'
        '${s.toString().padLeft(2, '0')}';
  }

  @override
  void onInit() {
    super.onInit();
    WakelockPlus.enable();
  }

  // ── Navigation ───────────────────────────
  void nextStep() {
    if (!isLastStep) {
      cancelTimer();
      currentStep.value++;
    }
  }

  void goToStep(int index) {
    cancelTimer();
    currentStep.value = index;
    Get.back();
  }

  // ── Timer ────────────────────────────────
  void startTimer(int minutes) {
    cancelTimer();
    activeTimerMins.value = minutes;
    timerSeconds.value = minutes * 60;
    isTimerRunning.value = true;

    _countdown = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        t.cancel();
        isTimerRunning.value = false;
      }
    });
  }

  void addMinute() => timerSeconds.value += 60;

  void cancelTimer() {
    _countdown?.cancel();
    _countdown = null;
    isTimerRunning.value = false;
    timerSeconds.value = 0;
    activeTimerMins.value = 0;
  }

  @override
  void onClose() {
    WakelockPlus.disable();
    _countdown?.cancel();
    super.onClose();
  }
}
